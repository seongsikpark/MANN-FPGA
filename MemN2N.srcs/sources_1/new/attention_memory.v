//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/04/04 19:40:46
// Design Name: 
// Module Name: attention_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps
`include "common.h"

module attention_memory
(
    // clock
    clk,
    // reset_n
    rst_n,
    rst_n_soft,
    rst_n_hop,
    // input
    en_mem_w,
    en_fwd_path,
    en_bwd_path,
    en_bwd_path_grad,
    din_mem,
    din_question,
    gin,
    ain_bwd_path_grad,
    done_bwd_path_grad,
    hop,

    // output
    done_mem_w,
    done_fwd_path,
    done_bwd_path,
    we_mem,
    aout_mem,
    dout_attention,
    gout_mat,
    gout_vec,

    // debug
    debug_out
);
////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter BW_WL = `BW_WL;
parameter BW_IWL = `BW_IWL;
parameter BW_IWL_EXP = `BW_IWL_EXP;

parameter DIM_EMB = 1<<`BW_DIM_EMB;
parameter BW_DATA = `BW_DATA_EMB_W;

parameter BW_MEM_DATA = BW_DATA*DIM_EMB;
parameter BW_MEM_ADDR = `BW_MEM_ADDR;
parameter COUNT_VALUE_IN = (1 << BW_MEM_ADDR) - 1;
parameter NUM_MEM = `NUM_MEM;

parameter BW_HOP = `BW_HOP;
parameter NUM_HOP = `NUM_HOP;

////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clock
input wire clk;

// reset_n
input wire rst_n;
input wire rst_n_soft;
input wire rst_n_hop;

// input
input wire en_mem_w;
input wire en_fwd_path;
input wire en_bwd_path;
input wire en_bwd_path_grad;
input wire [BW_MEM_DATA-1:0] din_mem;
input wire [BW_MEM_DATA-1:0] din_question;
input wire [BW_DATA*NUM_MEM-1:0] gin;
input wire [BW_MEM_ADDR-1:0] ain_bwd_path_grad;
input wire done_bwd_path_grad;
input wire [BW_HOP-1:0] hop;

// output
output wire [BW_MEM_ADDR-1:0] aout_mem;
output wire we_mem;
//output reg done_mem_w;
output wire done_mem_w;
output wire done_fwd_path;
output reg done_bwd_path;

//output reg [BW_DATA*NUM_MEM-1:0] dout_attention;
output wire [BW_DATA*NUM_MEM-1:0] dout_attention;

output wire [BW_DATA*DIM_EMB-1:0] gout_mat;
//output reg [BW_DATA*DIM_EMB-1:0] gout_vec;
output wire [BW_DATA*DIM_EMB-1:0] gout_vec;

output reg [`BW_DEBUG_ATT_MEM-1:0] debug_out;

////////////////////////////////////////////////////////////
// internal signals
////////////////////////////////////////////////////////////

genvar i;
genvar j;

reg en_mem_w_sync;
reg en_fwd_path_sync;

reg en_bwd_path_sync;
reg en_bwd_path_grad_sync;

reg [BW_MEM_ADDR-1:0] addr_mem_a;
reg [BW_MEM_ADDR-1:0] addr_mem_a_mem_w;
reg [BW_MEM_ADDR-1:0] addr_mem_a_fwd_path;
reg [BW_MEM_ADDR-1:0] addr_mem_a_bwd_path;

wire [BW_DATA-1:0] question [0:DIM_EMB-1];

wire [BW_DATA-1:0] data_in_mem_a [0:DIM_EMB-1];
wire [BW_DATA-1:0] data_out_mem_a [0:DIM_EMB-1];


wire [BW_DATA-1:0] _gin [0:NUM_MEM-1];

wire [BW_DATA-1:0] _gout_mat [DIM_EMB-1:0];
reg [BW_DATA-1:0] _gout_vec [DIM_EMB-1:0];

wire [BW_DATA-1:0] _reg_mult [0:DIM_EMB-1];

wire [BW_DATA-1:0] _tree_adder_1st [0:DIM_EMB/2-1];
wire [BW_DATA-1:0] _tree_adder_2nd [0:DIM_EMB/4-1];
wire [BW_DATA-1:0] _tree_adder_3rd [0:DIM_EMB/8-1];
wire [BW_DATA-1:0] _tree_adder_4th [0:DIM_EMB/16-1];
wire [BW_DATA-1:0] _tree_adder_5th;

reg [BW_DATA-1:0] tree_adder_1st [0:DIM_EMB/2-1];
reg [BW_DATA-1:0] tree_adder_2nd [0:DIM_EMB/4-1];
reg [BW_DATA-1:0] tree_adder_3rd [0:DIM_EMB/8-1];
reg [BW_DATA-1:0] tree_adder_4th [0:DIM_EMB/16-1];
reg [BW_DATA-1:0] tree_adder_5th;

reg tree_adder_1st_input_valid;
reg tree_adder_1st_valid;
reg tree_adder_2nd_valid;
reg tree_adder_3rd_valid;
reg tree_adder_4th_valid;
reg tree_adder_5th_valid;
wire tree_adder_valid;




//reg [BW_MEM_ADDR-1:0] dout_addr;

wire rst_n_addr_mem;
wire en_addr_mem;
wire [BW_MEM_ADDR:0] count_addr_mem;
//wire done_addr_mem;

wire rst_n_addr_dout;
wire en_addr_dout;
reg en_addr_dot_product;
wire en_addr_dout_div;
//reg en_addr_dout_div;

//wire [BW_MEM_ADDR-1:0] count_addr_dout;
wire [BW_MEM_ADDR:0] count_addr_dout;

reg _done_dot_product;
reg done_dot_product;
reg done_exp_load;
reg done_exp_load_1d;
reg done_exp_load_2d;
reg done_exp;
reg done_exp_latch;
reg done_norm_sum;
//wire [NUM_MEM-1:0] done_div;
wire done_div;
wire done_norm_div;

reg en_norm_div;
reg en_norm_div_init;

reg we_mem_a;

reg [BW_MEM_ADDR-1:0] addr_dout_attention_pre;
reg [BW_MEM_ADDR-1:0] addr_dout_attention;

reg [BW_MEM_ADDR-1:0] addr_exp;
reg [BW_MEM_ADDR-1:0] addr_exp_1d;
reg [BW_MEM_ADDR-1:0] addr_exp_2d;
//wire [BW_MEM_ADDR-1:0] addr_exp;

wire [BW_MEM_ADDR-1:0] addr_exp_load;

reg [BW_MEM_ADDR-1:0] addr_exp_latch;


//reg [BW_DATA*NUM_MEM-1:0] reg_dot_product;
//reg [BW_DATA-1:0] reg_dot_product;
reg [BW_DATA-1:0] reg_dot_product [0:NUM_MEM];
wire [BW_DATA-1:0] _reg_dot_product;
//reg [BW_DATA*NUM_MEM-1:0] reg_exp;
reg [BW_DATA-1:0] reg_exp [0:NUM_MEM];

wire [BW_DATA-1:0] din_exp;
wire [BW_DATA-1:0] _dout_exp;
reg [BW_DATA-1:0] dout_exp;


reg [BW_DATA-1:0] reg_sum_exp;
wire [BW_DATA-1:0] _reg_sum_exp;

reg en_dot_product;
reg en_exp;
reg en_exp_latch_pre;
reg en_exp_latch_pre_1d;
reg en_exp_latch_pre_2d;
reg en_exp_latch;

wire [BW_DATA-1:0] div_norm_q;
wire [BW_DATA-1:0] div_norm_f;

reg [BW_DATA-1:0] _dout_attention;

wire we_dout;

wire div_din_ready;
reg div_din_valid;
wire _div_din_valid;




// bwd path

reg en_bwd_path_sm_sum_grad;
reg done_bwd_path_sm_sum_grad;

reg en_bwd_path_sm_grad;
reg done_bwd_path_sm_grad;

reg en_bwd_path_dot_grad;
reg done_bwd_path_dot_grad_pre;
reg done_bwd_path_dot_grad;

wire en_addr_exp;

//reg [BW_DATA-1:0] sum_grad;             // sum of grad_in * dout_attetion

reg [BW_DATA-1:0] grad_out_sm [0:NUM_MEM-1];
wire [BW_DATA-1:0] _grad_out_sm;
//wire [BW_DATA-1:0] _grad_out_sm [0:NUM_MEM-1];

wire [BW_MEM_ADDR-1:0] addr_sm_grad;
reg [BW_MEM_ADDR-1:0] addr_sm_grad_latch;
reg [BW_MEM_ADDR-1:0] addr_grad;
wire [BW_MEM_ADDR-1:0] addr_mem_grad_bwd_path_grad_sync;
wire [BW_MEM_ADDR-1:0] addr_mem_grad_bwd_path_dot_grad;

reg [BW_DATA-1:0] reg_dot_product_max;
reg [BW_MEM_ADDR-1:0] addr_dot_product;

//reg en_exp_sum;

//reg [BW_DATA-1:0] _mult_in_a_fwd_path [0:DIM_EMB-1];
//reg [BW_DATA-1:0] _mult_in_b_fwd_path [0:DIM_EMB-1];
wire [BW_DATA-1:0] _mult_in_a_fwd_path [0:DIM_EMB-1];
wire [BW_DATA-1:0] _mult_in_b_fwd_path [0:DIM_EMB-1];
wire [BW_DATA-1:0] _mult_out_fwd_path [0:DIM_EMB-1];
reg [BW_DATA-1:0] mult_out_fwd_path [0:DIM_EMB-1];

//reg [BW_DATA-1:0] _mult_in_a_bwd_path [0:DIM_EMB-1];
//reg [BW_DATA-1:0] _mult_in_b_bwd_path [0:DIM_EMB-1];
wire [BW_DATA-1:0] _mult_in_a_bwd_path [0:DIM_EMB-1];
wire [BW_DATA-1:0] _mult_in_b_bwd_path [0:DIM_EMB-1];
wire [BW_DATA-1:0] _mult_out_bwd_path [0:DIM_EMB-1];
reg [BW_DATA-1:0] mult_out_bwd_path [0:DIM_EMB-1];


reg [BW_DATA-1:0] _mult_in_a_1;
reg [BW_DATA-1:0] _mult_in_b_1;

reg [BW_DATA-1:0] mult_in_a_1;
reg [BW_DATA-1:0] mult_in_b_1;

wire [BW_DATA-1:0] _mult_out_1;



wire [DIM_EMB-1:0] enable_mac;
wire [BW_DATA-1:0] _din_a_mac [0:DIM_EMB-1];
reg [BW_DATA-1:0] din_a_mac [0:DIM_EMB-1];
wire [BW_DATA-1:0] din_b_mac [0:DIM_EMB-1];
wire [BW_DATA-1:0] dout_mac [0:DIM_EMB-1];


wire enable_mac_bwd_path_sm_sum_grad;
wire [BW_DATA-1:0] din_a_mac_bwd_path_sm_sum_grad;
wire [BW_DATA-1:0] din_b_mac_bwd_path_sm_sum_grad;
wire [BW_DATA-1:0] dout_mac_bwd_path_sm_sum_grad;



reg _en_accum_grad;

reg en_accum_grad;

wire [BW_DATA-1:0] sum_grad;

wire en_addr_sm_grad;

wire rst_n_mac;
wire rst_n_mac_bwd_path_sm_sum_grad;
reg [BW_DATA-1:0] _add_in_a [0:DIM_EMB/2-1];
reg [BW_DATA-1:0] _add_in_b [0:DIM_EMB/2-1];
wire [BW_DATA-1:0] _add_out [0:DIM_EMB/2-1];

reg [BW_MEM_ADDR-1:0] addr_mem_grad;

reg [BW_DATA-1:0] _add_in_a_exp_sub_max;
reg [BW_DATA-1:0] _add_in_b_exp_sub_max;
wire [BW_DATA-1:0] _add_out_exp_sub_max;
reg [BW_DATA-1:0] add_out_exp_sub_max;


wire [BW_DATA-1:0] _add_in_a_bwd_path;
wire [BW_DATA-1:0] _add_in_b_bwd_path;
wire [BW_DATA-1:0] _add_out_bwd_path;


wire we_mem_grad;
wire [BW_DATA-1:0] data_in_mem_grad [0:DIM_EMB-1];
wire [BW_DATA-1:0] data_out_mem_grad [0:DIM_EMB-1];



reg done_mem_w_1;
reg done_mem_w_2;



//reg [BW_DATA*NUM_MEM-1:0] dout_attention_buf [0:NUM_HOP-1];
reg [BW_DATA-1:0] dout_attention_buf [0:NUM_HOP-1][0:NUM_MEM-1];

//
wire overflow_adder_exp_sub_max;
wire overflow_adder_bwd_path;
wire overflow_tree_adder_5th;
wire overflow_accu_exp;

wire underflow_adder_exp_sub_max;
wire underflow_adder_bwd_path;
wire underflow_tree_adder_5th;
wire underflow_accu_exp;

wire [DIM_EMB-1:0] overflow_mult_fwd_path;
wire [DIM_EMB-1:0] overflow_mult_bwd_path;
wire overflow_mult_1;

wire [DIM_EMB-1:0] underflow_mult_fwd_path;
wire [DIM_EMB-1:0] underflow_mult_bwd_path;
wire underflow_mult_1;

////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin : assign_gin
        assign _gin[i] = gin[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate


assign we_mem = we_mem_a;
//assign we_mem_a = en_mem_w_sync;
//assign data_mem_a = (we_mem_a==1'b0) ? {BW_MEM_DATA{1'bz}} : din_mem;

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_data_in_mem_a
        assign data_in_mem_a[i] = (we_mem_a==1'b1) ? din_mem[(i+1)*BW_DATA-1-:BW_DATA] : {BW_DATA{1'b0}};
    end
endgenerate

//assign data_mem_a = (we_mem_a==1'b1) ? din_mem : {BW_MEM_DATA{1'bz}};

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign question[i] = din_question[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate



//assign addr_dout_attention = count_addr_dout;
//assign en_addr_dout = en_dot_product && !done_dot_product;


//assign dout_attention = reg_dot_product;

//assign din_exp = reg_dot_product [(addr_exp+1)*BW_DATA-1-:BW_DATA] >> (BW_IWL_EXP-BW_IWL);
//assign din_exp = ($signed(_reg_dot_product) >>> (BW_IWL_EXP-BW_IWL));
//assign din_exp = (en_exp==1'b1) ? _add_out_exp_sub_max : {BW_DATA{1'b0}};
//assign din_exp = _add_out_exp_sub_max;
assign din_exp = add_out_exp_sub_max;
//assign din_exp = $signed(add_out_exp_sub_max) + ((32'b1)<<<(BW_WL-BW_IWL_EXP-1));


assign aout_mem = count_addr_mem;

//assign done_norm_div = done_div;
//assign done_norm_div = en_norm_div&&(count_addr_mem-1==count_addr_dout) ? 1'b1 : 1'b0;
//assign done_norm_div = en_norm_div&&(count_addr_mem-1==addr_dout_attention) ? 1'b1 : 1'b0;
assign done_norm_div = en_norm_div&&(count_addr_mem-1==addr_dout_attention) ? done_div : 1'b0;



// should modify later
assign rst_n_addr_mem = rst_n && rst_n_soft;
assign en_addr_mem = we_mem_a;

assign rst_n_addr_dout = rst_n && rst_n_soft && rst_n_hop && !(en_fwd_path_sync&&((en_dot_product&&done_dot_product)||(en_norm_div_init&&(!en_norm_div)))) && !en_bwd_path && !(en_bwd_path_sm_sum_grad&&done_bwd_path_sm_sum_grad) && !(en_bwd_path_sm_grad&&done_bwd_path_sm_grad);

assign en_addr_dout_div = div_din_valid;
assign en_addr_dout = (en_dot_product&&en_addr_dot_product) || en_addr_dout_div || en_addr_exp || (en_bwd_path_sm_sum_grad && !done_bwd_path_sm_sum_grad) || (en_bwd_path_sm_grad&&!done_bwd_path_sm_grad) || (en_bwd_path_dot_grad&&!done_bwd_path_dot_grad);


assign done_fwd_path = en_fwd_path_sync && done_norm_div;

assign we_dout = done_div;

assign _reg_dot_product = tree_adder_5th;

assign tree_adder_valid = tree_adder_5th_valid;

//assign div_din_valid = (count_addr_mem-1==addr_dout_attention) ? 1'b0 : en_norm_div&&div_din_ready;
//assign div_din_valid = (count_addr_mem>addr_dout_attention) ? en_norm_div&&div_din_ready : 1'b0;

assign _div_din_valid = en_norm_div&&div_din_ready;

always@(*)
begin
    //if(addr_dout_attention=={(BW_MEM_ADDR){1'b0}})
    //    div_din_valid = _div_din_valid;
    //else
        /*
        if(count_addr_mem-1==addr_dout_attention)
            div_din_valid = 1'b0;
        else
            div_din_valid = _div_din_valid;
        */
        if(count_addr_mem==count_addr_dout)
            div_din_valid = 1'b0;
        else
            div_din_valid = _div_din_valid;
end


always@(*)
begin
    _dout_attention <= {div_norm_q[BW_DATA-1], div_norm_q[BW_IWL-1-:BW_IWL], div_norm_f[BW_DATA-1-:(BW_WL-BW_IWL-1)]};
    //_dout_attention <= {div_norm_q[BW_IWL:0], div_norm_f[BW_DATA-1-:(BW_WL-BW_IWL-1)]};

end

////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_mem_w ==1'b1)
    if(rst_n==1'b0)
        en_mem_w_sync <= 1'b0;
    else
        if(done_mem_w==1'b1)
            en_mem_w_sync <= 1'b0;
        else if(en_mem_w_sync==1'b0)
            en_mem_w_sync <= en_mem_w;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_mem_w==1'b1)
    if(rst_n==1'b0)
        we_mem_a <= 1'b0;
    else
        if(done_mem_w==1'b1)
            we_mem_a <= 1'b0;
        else
            we_mem_a <= en_mem_w_sync;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_fwd_path==1'b1)
    if(rst_n==1'b0)
        en_fwd_path_sync <= 1'b0;
    else
        if(done_fwd_path==1'b1)
            en_fwd_path_sync <= 1'b0;
        else if(en_fwd_path_sync==1'b0)
            en_fwd_path_sync <= en_fwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path==1'b1)
    if(rst_n==1'b0)
        en_bwd_path_sync <= 1'b0;
    else    
        if(done_bwd_path==1'b1)
            en_bwd_path_sync <= 1'b0;
        else if(en_bwd_path_sync==1'b0)
            en_bwd_path_sync <= en_bwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path_grad==1'b1)
    if(rst_n==1'b0)
        en_bwd_path_grad_sync <= 1'b0;
    else    
        if(done_bwd_path_grad==1'b1)
            en_bwd_path_grad_sync <= 1'b0;
        else if(en_bwd_path_grad_sync==1'b0)
            en_bwd_path_grad_sync <= en_bwd_path_grad;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path_sm_sum_grad==1'b1)
    if(rst_n==1'b0)
        en_bwd_path_sm_sum_grad <= 1'b0;
    else
        if(done_bwd_path_sm_sum_grad==1'b1)
            en_bwd_path_sm_sum_grad <= 1'b0;
        else
            en_bwd_path_sm_sum_grad <= en_bwd_path_sync;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path==1'b1)
    if(rst_n==1'b0)
        done_bwd_path_sm_sum_grad <= 1'b0;
    else
        if(done_bwd_path==1'b1)
            done_bwd_path_sm_sum_grad <= 1'b0;
        else if(en_bwd_path_sm_sum_grad==1'b1 && count_addr_mem-1==count_addr_dout)
            done_bwd_path_sm_sum_grad <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path_sm_grad==1'b1)
    if(rst_n==1'b0)
        en_bwd_path_sm_grad <= 1'b0;
    else
        if(done_bwd_path_sm_grad==1'b1)
            en_bwd_path_sm_grad <= 1'b0;
        else if(en_bwd_path_sm_sum_grad==1'b1 && done_bwd_path_sm_sum_grad==1'b1)
            en_bwd_path_sm_grad <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path==1'b1)
    if(rst_n==1'b0)
        done_bwd_path_sm_grad <= 1'b0;
    else
        if(done_bwd_path==1'b1)
            done_bwd_path_sm_grad <= 1'b0;
        //else if(en_bwd_path_sm_grad==1'b1 && count_addr_mem-1==count_addr_dout)
        else if(en_bwd_path_sm_grad==1'b1 && count_addr_mem-1==addr_sm_grad_latch)
            done_bwd_path_sm_grad <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_bwd_path_dot_grad_pre <= 1'b0;
    else
        if(done_bwd_path==1'b1)
            done_bwd_path_dot_grad_pre <= 1'b0;
        //else if(en_bwd_path_dot_grad==1'b1 && count_addr_mem-1==addr_mem_a)
        else if(en_bwd_path_dot_grad==1'b1 && count_addr_mem-1==addr_mem_a_bwd_path)
            done_bwd_path_dot_grad_pre <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_bwd_path_dot_grad <= 1'b0;
    else
        if(done_bwd_path==1'b1)
            done_bwd_path_dot_grad <= 1'b0;
        else
            done_bwd_path_dot_grad <= done_bwd_path_dot_grad_pre;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_dot_grad <= 1'b0;
    else
        //if(done_bwd_path_dot_grad==1'b1)
        if(done_bwd_path==1'b1)
            en_bwd_path_dot_grad <= 1'b0;
        else if(en_bwd_path_sm_grad==1'b1 && done_bwd_path_sm_grad==1'b1)
            en_bwd_path_dot_grad <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_bwd_path <= 1'b0;
    else
        if(done_bwd_path==1'b1)
            done_bwd_path <= 1'b0;
        else 
            done_bwd_path <= done_bwd_path_dot_grad;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_addr_dot_product <= 1'b0;
    else
        /*
        if(done_dot_product==1'b1)
            en_addr_dot_product <= 1'b0;
        else if(en_addr_dot_product ==1'b0)
            //en_addr_dot_product <= en_fwd_path_sync;
            en_addr_dot_product <= en_dot_product;
        */
        if(en_addr_dot_product == 1'b1||done_dot_product==1'b1)
            en_addr_dot_product <= 1'b0;
        else
            /*
            if(count_addr_dout=={BW_MEM_ADDR{1'b0}}&&addr_dot_product!={BW_COUNTER_IN{1'b1}})
                en_addr_dot_product <= en_dot_product;
            else
                if(tree_adder_5th_valid==1'b1&&addr_dot_product!={BW_COUNTER_IN{1'b1}})
                    en_addr_dot_product <= en_dot_product;
                else
                    en_addr_dot_product <= 1'b0;
            */
            //if(count_addr_dout=={(BW_MEM_ADDR+1){1'b0}}&&count_addr_dout!=count_addr_mem-1)
            if(count_addr_dout=={(BW_MEM_ADDR+1){1'b0}})
                en_addr_dot_product <= en_dot_product;
            else
                //if(tree_adder_valid==1'b1&&addr_dot_product!=count_addr_mem-1)
                //if(tree_adder_valid==1'b1&&count_addr_dout!=count_addr_mem)
                //if(tree_adder_valid==1'b1&&addr_mem_a!=count_addr_mem)
                //if(tree_adder_valid==1'b1&&addr_mem_a<count_addr_mem)
                //    en_addr_dot_product <= en_dot_product ;
                //else
                //    en_addr_dot_product <= 1'b0;
                
                //if(addr_mem_a<count_addr_mem)
                if(addr_mem_a_fwd_path<count_addr_mem)
                    en_addr_dot_product <= tree_adder_valid && en_dot_product ;
                else
                    en_addr_dot_product <= 1'b0;
end


/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_addr_dot_product <= 1'b0;
    else
        if(en_addr_dot_product == 1'b1||done_dot_product==1'b1)
            en_addr_dot_product <= 1'b0;
        else
        begin
            if(addr_mem_a<count_addr_mem)

        end
            if(count_addr_dout=={(BW_MEM_ADDR+1){1'b0}})
                en_addr_dot_product <= en_dot_product;
            else
                //if(tree_adder_valid==1'b1&&addr_dot_product!=count_addr_mem-1)
                //if(tree_adder_valid==1'b1&&count_addr_dout!=count_addr_mem)
                //if(tree_adder_valid==1'b1&&addr_mem_a!=count_addr_mem)
                //if(tree_adder_valid==1'b1&&addr_mem_a<count_addr_mem)
                //    en_addr_dot_product <= en_dot_product ;
                //else
                //    en_addr_dot_product <= 1'b0;
                
                if(addr_mem_a<count_addr_mem)
                    en_addr_dot_product <= tree_adder_valid && en_dot_product ;
                else
                    en_addr_dot_product <= 1'b0;
end
*/





//assign en_addr_exp = en_exp && !done_exp;
assign en_addr_exp = en_exp;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_mem_a_mem_w <= {(BW_MEM_ADDR-1){1'b0}};
    else
        if(en_mem_w_sync==1'b1)
            addr_mem_a_mem_w <= count_addr_mem[BW_MEM_ADDR-1:0];
        else
            addr_mem_a_mem_w <= {(BW_MEM_ADDR-1){1'b0}};
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_mem_a_fwd_path <= {(BW_MEM_ADDR-1){1'b0}};
    else
        if(en_fwd_path_sync==1'b1)
            addr_mem_a_fwd_path <= count_addr_dout[BW_MEM_ADDR-1:0];
        else
            addr_mem_a_fwd_path <= {(BW_MEM_ADDR-1){1'b0}};
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_mem_a_bwd_path <= {(BW_MEM_ADDR-1){1'b0}};
    else
        if(en_bwd_path_sync==1'b1)
            addr_mem_a_bwd_path <= count_addr_dout[BW_MEM_ADDR-1:0];
        else
            addr_mem_a_bwd_path <= {(BW_MEM_ADDR-1){1'b0}};
end

//always@(posedge clk or negedge rst_n)
always@(*)
begin
    if(rst_n==1'b0)
        addr_mem_a = 'b0;
    else
    begin
        case({en_mem_w_sync,en_fwd_path_sync,en_bwd_path_sync})
            3'b100 :
            begin
                addr_mem_a = addr_mem_a_mem_w;
            end
            3'b010 :
            begin
                addr_mem_a = addr_mem_a_fwd_path;
            end
            3'b001 :
            begin
                addr_mem_a = addr_mem_a_bwd_path;
            end
            default
            begin
                addr_mem_a = 'b0;
            end
        endcase
    end
end


//assign en_addr_dout_div = en_fwd_path_sync&&en_norm_div&&done_div;
//assign en_addr_dout_div = en_fwd_path_sync&&en_norm_div&&div_din_ready;

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_addr_dout_div <= 1'b0;
    else
        //en_addr_dout_div <= div_din_valid;
        en_addr_dout_div <= done_div;
end
*/

//assign en_addr_dout_div = en_fwd_path_sync&&en_norm_div&&done_div;



always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_dot_product <= 1'b0;
    else
        if(done_dot_product==1'b1)
            en_dot_product <= 1'b0;
        else if(en_fwd_path_sync==1'b1 && en_dot_product==1'b0)
            //en_dot_product<=en_addr_dot_product;
            en_dot_product<=en_fwd_path_sync;
end


/*
reg en_dot_product_max_scan;
reg done_dot_product_max_scan;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_dot_product_max_scan==1'b1)
        en_dot_product_max_scan <= 1'b0;
    else
        if(en_fwd_path_sync == 1'b1 && en_dot_product_max_scan==1'b0)
            en_dot_product_max_scan <= en_dot_product;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_fwd_path==1'b1)
        done_dot_product_max_scan <= 1'b0;
    else
        if(en_dot_product_max_scan==1'b1&&count_addr_mem-1==count_addr_dout)
            done_dot_product_max_scan <= 1'b1;
end
*/



always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_dot_product <= {BW_MEM_ADDR{1'b0}};
    else
        if(en_dot_product==1'b0)
            addr_dot_product <= {BW_MEM_ADDR{1'b0}};
        else 
            if(tree_adder_valid==1'b1)
                //addr_dot_product <= addr_mem_a;
                addr_dot_product <= addr_mem_a_fwd_path;
end

generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin : assign_reg_dot_product
        always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_hop)
        begin
            if(rst_n==1'b0 || rst_n_soft==1'b0 || rst_n_hop==1'b0)
                reg_dot_product[i] <= {BW_DATA{1'b0}};
            else
                if(en_dot_product==1'b1&&i==addr_dot_product&&tree_adder_valid==1'b1)
                    reg_dot_product[i] <= _reg_dot_product;
        end
    end
endgenerate



always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_hop)
begin
    if(rst_n==1'b0 || rst_n_soft==1'b0 || rst_n_hop==1'b0)
        reg_dot_product_max <= {1'b1, {(BW_DATA-2){1'b0}}, 1'b1};
        //reg_dot_product_max <= {1'b0, {(BW_DATA-2){1'b0}}, 1'b0};
    else
        //if(en_dot_product==1'b1 && ($signed(reg_dot_product_max) < $signed(_reg_dot_product)) || (addr_dot_product=='b1) )
        //if(en_dot_product==1'b1 && $signed(reg_dot_product_max) < $signed(_reg_dot_product))
        if(en_dot_product==1'b1 && tree_adder_valid==1'b1 && $signed(reg_dot_product_max) < $signed(_reg_dot_product))
            reg_dot_product_max <= _reg_dot_product;
end


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_exp <= 1'b0;
    else
        if(done_exp==1'b1)
            en_exp <= 1'b0;
        else if(en_fwd_path_sync==1'b1 && en_exp==1'b0)
            //en_exp <= en_dot_product;
            en_exp <= en_dot_product && done_dot_product;

end

always@(*)
begin
    //if( (en_dot_product==1'b1) && (addr_mem_a==count_addr_mem) )
    if( (en_dot_product==1'b1) && (addr_mem_a_fwd_path==count_addr_mem) )
        _done_dot_product = 1'b1;
    else
        _done_dot_product = 1'b0;
end


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_dot_product <= 1'b0;
    else
        if(done_fwd_path==1'b1)
            done_dot_product <= 1'b0;
        //else if(en_dot_product==1'b1&&count_addr_mem==addr_mem_a&&tree_adder_valid==1'b1)
        //else if(en_dot_product==1'b1&&addr_dot_product==count_addr_mem-1&&tree_adder_valid==1'b1)
        //else if(en_dot_product==1'b1&&count_addr_dout==count_addr_mem&&tree_adder_valid==1'b1)
        //else if(en_dot_product==1'b1&&addr_mem_a==count_addr_mem&&tree_adder_valid==1'b1)
            //done_dot_product <= 1'b1;
        else
            if(done_dot_product == 1'b1)
                done_dot_product <= done_dot_product;
            else
                done_dot_product <= tree_adder_valid && _done_dot_product;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_exp_load <= 1'b0;
    else
        if(done_fwd_path==1'b1)
            done_exp_load <= 1'b0;
        else if(en_exp==1'b1&&count_addr_mem-1'b1==addr_exp_load)
            done_exp_load <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_exp_load_1d <= 1'b0;
    else
        done_exp_load_1d <= done_exp_load;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_exp_load_2d <= 1'b0;
    else
        done_exp_load_2d <= done_exp_load_1d;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_exp <= 1'b0;
    else
        done_exp <= done_exp_load_2d;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_exp_latch <= 1'b0;
    else
        done_exp_latch <= done_exp;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_exp_latch_pre <= 1'b0;
    else
        if(done_exp_latch==1'b1)
            en_exp_latch_pre <= 1'b0;
        else if(en_exp_latch_pre ==1'b0)
            en_exp_latch_pre <= en_exp;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_exp_latch_pre_1d <= 1'b0;
    else
        en_exp_latch_pre_1d <= en_exp_latch_pre;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_exp_latch_pre_2d <= 1'b0;
    else
        en_exp_latch_pre_2d <= en_exp_latch_pre_1d;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_exp_latch <= 1'b0;
    else
        if(done_exp_latch==1'b1)
            en_exp_latch <= 1'b0;
        else if(en_exp_latch ==1'b0)
            //en_exp_latch <= en_exp_latch_pre;
            en_exp_latch <= en_exp_latch_pre_2d;
end

/*
always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_exp_latch==1'b1)
    if(rst_n==1'b0)
        en_exp_sum <= 1'b0;
    else
        if(done_exp_latch==1'b1)
            en_exp_sum <= 1'b0;
        else if(en_exp_sum==1'b0)
            en_exp_sum <= en_exp;
end
*/


/*
always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_fwd_path==1'b1)
    if(rst_n==1'b0)
        done_exp_latch <= 1'b0;
    else
        if(done_fwd_path==1'b1)
            done_exp_latch <= 1'b0;
        else 
            done_exp_latch <= done_exp;
end
*/




/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_exp <= 1'b0;
    else
        if(done_fwd_path==1'b1)
            done_exp <= 1'b0;
        //else if(en_exp==1'b1&&count_addr_mem-1==count_addr_dout)
        //else if(en_exp==1'b1&&count_addr_mem-1==addr_exp)
        else if(en_exp==1'b1&&count_addr_mem-1==addr_exp_latch)
            done_exp <= 1'b1;
end
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_norm_sum <= 'b0;
    else
        if(done_fwd_path==1'b1)
            done_norm_sum <= 'b0;
        else if(en_fwd_path_sync==1'b1)
            //done_norm_sum <= done_exp;
            done_norm_sum <= done_exp_latch;
end

/*
always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_mem_w==1'b1)
    if(rst_n==1'b0)
        done_mem_w <= 'b0;
    else
        if(done_mem_w==1'b1)
            done_mem_w <= 1'b0;
        else if(en_mem_w_sync==1'b1)
            done_mem_w <= en_mem_w_sync;
end
*/

assign done_mem_w = done_mem_w_1 && !done_mem_w_2;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_mem_w_1 <= 1'b0;
    else
        done_mem_w_1 <= en_mem_w_sync;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_mem_w_2 <= 1'b0;
    else
        done_mem_w_2 <= done_mem_w_1;
end


/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_fwd_path <= 1'b0;
    else
        //if(en_fwd_path_sync==1'b1 && count_addr_mem-1==count_addr_dout)
        if(en_fwd_path_sync==1'b1 && done_norm_div==1'b1)
            done_fwd_path <= 1'b1;
end
*/


always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_norm_div==1'b1)
    if(rst_n==1'b0)
        en_norm_div_init <= 1'b0;
    else
        if(done_norm_div==1'b1)
            en_norm_div_init <= 1'b0;
        else if(en_fwd_path_sync==1'b1)
            en_norm_div_init <= done_norm_sum;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_norm_div==1'b1)
    if(rst_n==1'b0)
        en_norm_div <= 1'b0;
    else
        if(done_norm_div==1'b1)
            en_norm_div <= 1'b0;
        else if(en_fwd_path_sync==1'b1)
            en_norm_div <= en_norm_div_init;
end

//always@(posedge clk or negedge rst_n or negedge rst_n_soft )
always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || rst_n_soft==1'b0)
    if(rst_n==1'b0)
        addr_exp <= 'b0;
    else
        if(en_exp==1'b1)
            addr_exp <= addr_exp_load;
end

//assign addr_exp = (en_exp==1'b1)? count_addr_dout : {BW_MEM_ADDR{1'b0}};
//assign addr_exp_load = (en_exp==1'b1)? count_addr_dout : {BW_MEM_ADDR{1'b0}};
assign addr_exp_load = count_addr_dout;



/*
//always@(posedge clk or negedge rst_n or negedge rst_n_soft )
always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || rst_n_soft==1'b0)
    if(rst_n==1'b0)
        addr_exp_latch <= 'b0;
    else
        if(en_fwd_path_sync==1'b1)
            addr_exp_latch <= addr_exp;
end
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_exp_1d <= 'b0;
    else
        addr_exp_1d <= addr_exp;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_exp_2d <= 'b0;
    else
        addr_exp_2d <= addr_exp_1d;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_exp_latch <= 'b0;
    else
        if(en_fwd_path_sync==1'b1)
            addr_exp_latch <= addr_exp_2d;
end




generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin
        always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_hop)
        begin
            if(rst_n==1'b0 || rst_n_soft==1'b0 || rst_n_hop==1'b0)
                reg_exp[i] <= {BW_DATA{1'b0}};
            else
                //if(en_exp==1'b1 && done_exp==1'b0 && i==addr_exp)
                //if(en_exp_latch==1'b1 && done_exp==1'b0 && i==addr_exp)
                //if(en_exp_latch==1'b1 && done_exp==1'b0 && i==addr_exp_latch)
                if(en_exp_latch==1'b1 && done_exp_latch==1'b0 && i==addr_exp_latch)
                    reg_exp[i] <= dout_exp;
                    //reg_exp[addr_exp] <= dout_exp;
        end
    end
endgenerate

always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_hop)
begin
    if(rst_n==1'b0 || rst_n_soft==1'b0 || rst_n_hop==1'b0)
        reg_sum_exp <= 'b0;
    else
        //if(en_exp==1'b1 && done_exp==1'b0)
        //if(en_exp_latch==1'b1 && done_exp==1'b0)
        if(en_exp_latch==1'b1 && done_exp_latch==1'b0)
            reg_sum_exp <= _reg_sum_exp;
            //reg_sum_exp <= dout_exp;
end

generate
    for(i=0;i<NUM_HOP;i=i+1)
    begin
        for(j=0;j<NUM_MEM;j=j+1)
        begin
            always@(posedge clk or negedge rst_n or negedge rst_n_soft)
            begin
                if(rst_n==1'b0 || rst_n_soft==1'b0)
                    dout_attention_buf[i][j] <= {BW_DATA{1'b0}};
                else
                    //if(done_fwd_path==1'b1 && i==hop)
                    if(we_dout==1'b1 && i==hop && j==addr_dout_attention)
                        //dout_attention_buf[i][(addr_dout_attention+1)*BW_DATA-1-:BW_DATA] <= _dout_attention;
                        dout_attention_buf[i][j] <= _dout_attention;
            end
        end
    end
endgenerate


/*
always@(posedge clk or negedge rst_n or negedge rst_n_soft)
begin
    if(rst_n==1'b0 || rst_n_soft==1'b0)
        dout_attention <= 'b0;
    else
        //if(done_norm_div==1'b1)
        if(we_dout==1'b1)
        //if(en_addr_dout_div==1'b1)
            //dout_attention[(count_addr_dout+1)*BW_DATA-1-:BW_DATA] <= _dout_attention;
            dout_attention[(addr_dout_attention+1)*BW_DATA-1-:BW_DATA] <= _dout_attention;
end
*/

//assign dout_attention = dout_attention_buf[hop];

generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin
        assign dout_attention[(i+1)*BW_DATA-1-:BW_DATA] = dout_attention_buf[hop][i];
    end
endgenerate




always@(posedge clk or negedge rst_n or negedge rst_n_soft)
//always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || rst_n_soft==1'b0)
    //if(rst_n==1'b0)
        addr_dout_attention_pre <= 'b0;
    else
        if(en_norm_div==1'b1 && en_addr_dout == 1'b1)
            addr_dout_attention_pre <= count_addr_dout;
end

always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_hop)
begin
    if(rst_n==1'b0 || rst_n_soft==1'b0 || rst_n_hop==1'b0)
        addr_dout_attention <= 'b0;
    else
        if(en_norm_div==1'b1)
            addr_dout_attention <= addr_dout_attention_pre;
end


/*
generate 
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_gout_vec
        //always@(posedge clk or negedge rst_n or negedge rst_n_soft)
        always@(posedge clk or negedge rst_n)
        begin
            //if(rst_n==1'b0 || rst_n_soft==1'b0)
            if(rst_n==1'b0)
                gout_vec[(i+1)*BW_DATA-1-:BW_DATA] <= {BW_DATA{1'b0}};
            else    
                if(done_bwd_path==1'b1)
                    gout_vec[(i+1)*BW_DATA-1-:BW_DATA] <= dout_mac[i];
        end
    end
endgenerate
*/

generate 
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign__gout_vec
        //always@(posedge clk or negedge rst_n or negedge rst_n_soft)
        always@(posedge clk or negedge rst_n)
        begin
            //if(rst_n==1'b0 || rst_n_soft==1'b0)
            if(rst_n==1'b0)
                _gout_vec[i] <= {BW_DATA{1'b0}};
            else    
                if(done_bwd_path==1'b1)
                    _gout_vec[i] <= dout_mac[i];
        end
    end
endgenerate


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign gout_vec[(i+1)*BW_DATA-1-:BW_DATA] = _gout_vec[i];   
    end
endgenerate

////////////////////////////////////////////////////////////
// instances
////////////////////////////////////////////////////////////
always@(*)
begin
    if(en_bwd_path_sm_grad==1'b1)
        _mult_in_a_1 = _add_out_bwd_path;
    else
        _mult_in_a_1 = {BW_DATA{1'b0}};
end

always@(*)
begin
    if(en_bwd_path_sm_grad==1'b1)
        _mult_in_b_1 = dout_attention[(addr_sm_grad+1)*BW_DATA-1-:BW_DATA];
    else
        _mult_in_b_1 = {BW_DATA{1'b0}};
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        mult_in_a_1 <= {BW_DATA{1'b0}};
    else
        mult_in_a_1 <= _mult_in_a_1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        mult_in_b_1 <= {BW_DATA{1'b0}};
    else
        mult_in_b_1 <= _mult_in_b_1;
end

/*
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_mult_in_a
        always@(*)
        begin
            case({en_fwd_path_sync,en_bwd_path_dot_grad})
                2'b10: 
                begin
                    _mult_in_a[i] = data_out_mem_a[i];
                end
                2'b01:
                begin
                    //_mult_in_a[i] = _gin[addr_mem_grad];
                    _mult_in_a[i] = _gin[addr_mem_a];
                end
                default
                begin
                    _mult_in_a[i] = {BW_DATA{1'b0}};
                end
            endcase
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_mult_in_b
        always@(*)
        begin
            case({en_fwd_path_sync,en_bwd_path_dot_grad})
                2'b10:
                begin
                    _mult_in_b[i] = question[i];
                end
                2'b01:
                begin
                    _mult_in_b[i] = question[i];
                end
                default
                begin
                    _mult_in_b[i] = {BW_DATA{1'b0}};
                end
            endcase
        end
    end
endgenerate
*/



generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_mult_in_a_fwd_path
        assign _mult_in_a_fwd_path[i] = data_out_mem_a[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_mult_in_b_fwd_path
        assign _mult_in_b_fwd_path[i] = question[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_mult_in_a_bwd_path
        //assign _mult_in_a_bwd_path[i] = _gin[addr_mem_a];
        assign _mult_in_a_bwd_path[i] = _gin[addr_mem_a_bwd_path];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_mult_in_b_bwd_path
        assign _mult_in_b_bwd_path[i] = question[i];
    end
endgenerate




generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                grad_out_sm[i] <= {BW_DATA{1'b0}};
            else
                //if(en_bwd_path_sm_grad==1'b1 && done_bwd_path_sm_grad==1'b0 && i==addr_sm_grad)
                if(en_bwd_path_sm_grad==1'b1 && done_bwd_path_sm_grad==1'b0 && i==addr_sm_grad_latch)
                    grad_out_sm[i] <= _grad_out_sm;
                //if(en_bwd_path_sm_grad==1'b1 && done_bwd_path_sm_grad==1'b0)
                    //grad_out_sm[i] <= _grad_out_sm[i];
        end
    end
endgenerate

assign _grad_out_sm = _mult_out_1;
//assign _grad_out_sm[addr_sm_grad] = _mult_out_1;

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        //assign _reg_mult[i] = (en_fwd_path_sync==1'b1)? _mult_out[i]:{BW_DATA{1'b0}};
        //assign _reg_mult[i] = (en_dot_product==1'b1)? _mult_out[i]:{BW_DATA{1'b0}};
        assign _reg_mult[i] = (en_dot_product==1'b1)? mult_out_fwd_path[i]:{BW_DATA{1'b0}};
    end
endgenerate


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        _en_accum_grad <= 1'b0;
    else
        _en_accum_grad <= en_bwd_path_dot_grad && !done_bwd_path_dot_grad;
end




always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_accum_grad <= 1'b0;
    else
        en_accum_grad <= _en_accum_grad && !done_bwd_path_dot_grad;
end

//assign sum_grad = dout_mac[0];
assign sum_grad = dout_mac_bwd_path_sm_sum_grad;

//assign enable_mac[0] = en_bwd_path_sm_sum_grad && !done_bwd_path_sm_sum_grad || en_bwd_path_dot_grad && !done_bwd_path_dot_grad;

//assign enable_mac[0] = en_bwd_path_sm_sum_grad && !done_bwd_path_sm_sum_grad || en_accum_grad;
//assign enable_mac_bwd_path_sm_sum_grad = en_bwd_path_sm_sum_grad && !done_bwd_path_sm_sum_grad || en_accum_grad;
assign enable_mac_bwd_path_sm_sum_grad = en_bwd_path_sm_sum_grad && !done_bwd_path_sm_sum_grad;

/*
generate
    for(i=1;i<DIM_EMB;i=i+1)
    begin : assign_en_accum
        //assign enable_mac[i] = en_bwd_path_dot_grad && !done_bwd_path_dot_grad;
        assign enable_mac[i] = en_accum_grad;
    end
endgenerate
*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_en_accum
        //assign enable_mac[i] = en_bwd_path_dot_grad && !done_bwd_path_dot_grad;
        assign enable_mac[i] = en_accum_grad;
    end
endgenerate


//assign din_a_mac[0] = (en_bwd_path_sm_sum_grad==1'b1)? _gin[addr_sm_grad] : grad_out_sm[addr_grad];

//assign din_a_mac[0] = (en_bwd_path_sm_sum_grad==1'b1)? _gin[addr_sm_grad] : grad_out_sm[addr_mem_grad];
assign din_a_mac_bwd_path_sm_sum_grad = (en_bwd_path_sm_sum_grad==1'b1)? _gin[addr_sm_grad] : {BW_DATA{1'b0}};

/*
generate
    for(i=1;i<DIM_EMB;i=i+1)
    begin
        //assign din_a_mac[i] = (en_bwd_path_sm_sum_grad==1'b1)? {BW_DATA{1'b0}} : grad_out_sm[addr_grad];
        assign din_a_mac[i] = (en_bwd_path_sm_sum_grad==1'b1)? {BW_DATA{1'b0}} : grad_out_sm[addr_mem_grad];
    end
endgenerate
*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        //assign din_a_mac[i] = (en_bwd_path_sm_sum_grad==1'b1)? {BW_DATA{1'b0}} : grad_out_sm[addr_grad];
        //assign din_a_mac[i] = (en_bwd_path_sm_sum_grad==1'b1)? {BW_DATA{1'b0}} : grad_out_sm[addr_mem_grad];
        //assign din_a_mac[i] = (en_bwd_path_dot_grad==1'b1)? grad_out_sm[addr_mem_grad] : {BW_DATA{1'b0}};
        //assign din_a_mac[i] = (en_bwd_path_dot_grad==1'b1)? grad_out_sm[addr_mem_grad_bwd_path_dot_grad] : {BW_DATA{1'b0}};
        //assign _din_a_mac[i] = grad_out_sm[addr_mem_a];
        assign _din_a_mac[i] = grad_out_sm[addr_mem_a_bwd_path];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                din_a_mac[i] <= {BW_DATA{1'b0}};
            else
                din_a_mac[i] <= _din_a_mac[i];
        end
    end
endgenerate

//assign din_b_mac[0] = (en_bwd_path_sm_sum_grad==1'b1) ? dout_attention[(addr_sm_grad+1)*BW_DATA-1-:BW_DATA] : data_out_mem_a[0];
assign din_b_mac_bwd_path_sm_sum_grad = (en_bwd_path_sm_sum_grad==1'b1) ? dout_attention[(addr_sm_grad+1)*BW_DATA-1-:BW_DATA] : {BW_DATA{1'b0}};

/*
generate
    for(i=1;i<DIM_EMB;i=i+1)
    begin
        assign din_b_mac[i] = (en_bwd_path_sm_sum_grad==1'b1) ? {BW_DATA{1'b0}} : data_out_mem_a[i];
    end
endgenerate
*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        //assign din_b_mac[i] = (en_bwd_path_sm_sum_grad==1'b1) ? {BW_DATA{1'b0}} : data_out_mem_a[i];
        //assign din_b_mac[i] = (en_bwd_path_dot_grad==1'b1) ? data_out_mem_a[i] : {BW_DATA{1'b0}};
        assign din_b_mac[i] = data_out_mem_a[i];
    end
endgenerate


assign en_addr_sm_grad = en_bwd_path_sm_sum_grad&&!done_bwd_path_sm_sum_grad || (en_bwd_path_sm_grad&&!done_bwd_path_sm_grad);

//assign addr_sm_grad = (en_bwd_path_sm_sum_grad==1'b1)? count_addr_dout : {BW_DATA{1'b0}};
assign addr_sm_grad = (en_addr_sm_grad==1'b1)? count_addr_dout : {BW_MEM_ADDR{1'b0}};

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_sm_grad_latch <= {BW_MEM_ADDR{1'b0}};
    else
        addr_sm_grad_latch <= addr_sm_grad;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_grad <= {BW_MEM_ADDR{1'b0}};
    else
        //if(en_bwd_path_dot_grad==1'b1)
            //addr_grad <= addr_mem_a;
            
        //addr_grad <= addr_mem_a;
        addr_grad <= addr_mem_a_bwd_path;
end


//assign rst_n_mac = rst_n && !(en_bwd_path_sm_grad&&done_bwd_path_sm_grad) && en_bwd_path_sync;
assign rst_n_mac = rst_n && !(en_bwd_path_sm_grad&&done_bwd_path_sm_grad) && en_bwd_path_sync;
//assign rst_n_mac_bwd_path_sm_sum_grad = rst_n && !(en_bwd_path_sm_sum_grad&&done_bwd_path_sm_sum_grad) && en_bwd_path_sync;
assign rst_n_mac_bwd_path_sm_sum_grad = rst_n && en_bwd_path_sync;


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : accum_for_bwd
        mult_accumulator_fixed
        #(
            .BW_DATA(BW_DATA),
            .DIM_EMB(1),
            .BW_WL(BW_WL),
            .BW_IWL(BW_IWL)
        )
        mac
        (
            .clk(clk),
            .rst_n(rst_n_mac),
            .enable(enable_mac[i]),
            .din_a(din_a_mac[i]),
            .din_b(din_b_mac[i]),
            .dout(dout_mac[i])
        );
    end
endgenerate

mult_accumulator_fixed
#(
    .BW_DATA(BW_DATA),
    .DIM_EMB(1),
    .BW_WL(BW_WL),
    .BW_IWL(BW_IWL)
)
mac_bwd_path_sm_sum_grad
(
    .clk(clk),
    .rst_n(rst_n_mac_bwd_path_sm_sum_grad),
    .enable(enable_mac_bwd_path_sm_sum_grad),
    .din_a(din_a_mac_bwd_path_sm_sum_grad),
    .din_b(din_b_mac_bwd_path_sm_sum_grad),
    .dout(dout_mac_bwd_path_sm_sum_grad)
);


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : multiplier_fwd_path
        fixed_mult
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_multiplier_fwd_path
        (
            .a(_mult_in_a_fwd_path[i]),
            .b(_mult_in_b_fwd_path[i]),
            .c(_mult_out_fwd_path[i]),
            .overflow(overflow_mult_fwd_path[i]),
            .underflow(underflow_mult_fwd_path[i])
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                mult_out_fwd_path[i] <= {BW_DATA{1'b0}};
            else
                mult_out_fwd_path[i] <= _mult_out_fwd_path[i];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : multiplier_bwd_path
        fixed_mult
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_multiplier_bwd_path
        (
            .a(_mult_in_a_bwd_path[i]),
            .b(_mult_in_b_bwd_path[i]),
            .c(_mult_out_bwd_path[i]),
            .overflow(overflow_mult_bwd_path[i]),
            .underflow(underflow_mult_bwd_path[i])
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                mult_out_bwd_path[i] <= {BW_DATA{1'b0}};
            else
                mult_out_bwd_path[i] <= _mult_out_bwd_path[i];
        end
    end
endgenerate


fixed_mult
#(
    .WL(BW_WL),
    .IWL(BW_IWL)
)
fixed_multiplier_1
(
    .a(mult_in_a_1),
    .b(mult_in_b_1),
    .c(_mult_out_1),
    .overflow(overflow_mult_1),
    .underflow(underflow_mult_1)
);


generate
    for(i=0;i<DIM_EMB/2;i=i+1)
    begin : assign_add_in_a
        always@(*)
        begin
            _add_in_a[i] = {BW_DATA{1'b0}};

            //if(en_fwd_path_sync==1'b1)
            if(en_dot_product==1'b1)
                _add_in_a[i] = _reg_mult[i*2];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB/2;i=i+1)
    begin : assign_add_in_b
        always@(*)
        begin
            _add_in_b[i] = {BW_DATA{1'b0}};

            //if(en_fwd_path_sync==1'b1)
            if(en_dot_product==1'b1)
                _add_in_b[i] = _reg_mult[i*2+1];
        end
    end
endgenerate

always@(*)
begin
    //_add_in_a_exp_sub_max = (en_fwd_path_sync==1&&en_exp==1) ? $signed($signed(reg_dot_product[addr_exp]) >>> (BW_IWL_EXP-BW_IWL)) : {BW_DATA{1'b0}};
    //_add_in_a_exp_sub_max = (en_fwd_path_sync==1&&en_exp==1) ? $signed($signed(reg_dot_product[addr_exp_load]) >>> (BW_IWL_EXP-BW_IWL)) : {BW_DATA{1'b0}};
    //_add_in_a_exp_sub_max = (en_exp==1) ? $signed($signed(reg_dot_product[addr_exp_load]) >>> (BW_IWL_EXP-BW_IWL)) : {BW_DATA{1'b0}};
    
    //_add_in_a_exp_sub_max = $signed($signed(reg_dot_product[addr_exp_load]) >>> (BW_IWL_EXP-BW_IWL));
    _add_in_a_exp_sub_max = reg_dot_product[addr_exp_load];     // shift value ealier stage - at input of tree adder
end

always@(*)
begin
    //_add_in_b_exp_sub_max = (en_fwd_path_sync==1&&en_exp==1) ? $signed($signed(~reg_dot_product_max+1'b1) >>> (BW_IWL_EXP-BW_IWL)) : {BW_DATA{1'b0}};
    //_add_in_b_exp_sub_max = (en_exp==1) ? $signed($signed(~reg_dot_product_max+1'b1) >>> (BW_IWL_EXP-BW_IWL)) : {BW_DATA{1'b0}};

    //_add_in_b_exp_sub_max = $signed($signed(~reg_dot_product_max+1'b1) >>> (BW_IWL_EXP-BW_IWL));
    _add_in_b_exp_sub_max = $signed(~reg_dot_product_max+1'b1);     // shift value elaier stage - at input of tree adder
end

//assign _add_in_a_bwd_path = (en_bwd_path_sync==1'b1) ? _gin[addr_sm_grad] : {BW_DATA{1'b0}};
//assign _add_in_b_bwd_path = (en_bwd_path_sync==1'b1) ? ~sum_grad+1'b1 : {BW_DATA{1'b0}};
assign _add_in_a_bwd_path = _gin[addr_sm_grad];
assign _add_in_b_bwd_path = ~sum_grad+1'b1;

fixed_adder
#(
    .WL(BW_WL),
    .IWL(BW_IWL)
)
adder_exp_sub_max
(
    .a(_add_in_a_exp_sub_max),
    .b(_add_in_b_exp_sub_max),
    .c(_add_out_exp_sub_max),
    .overflow(overflow_adder_exp_sub_max),
    .underflow(underflow_adder_exp_sub_max)
);

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        add_out_exp_sub_max <= {BW_DATA{1'b0}};
    else
        add_out_exp_sub_max <= _add_out_exp_sub_max;
end

fixed_adder
#(
    .WL(BW_WL),
    .IWL(BW_IWL)
)
adder_bwd_path
(
    .a(_add_in_a_bwd_path),
    .b(_add_in_b_bwd_path),
    .c(_add_out_bwd_path),
    .overflow(overflow_adder_bwd_path),
    .underflow(underflow_adder_bwd_path)
);




generate
    for(i=0;i<DIM_EMB/2;i=i+1)
    begin : assign_tree_adder_1st
        assign _tree_adder_1st[i] = (en_dot_product==1'b1)? _add_out[i]:{BW_DATA{1'b0}};
    end
endgenerate

// tree adder
generate
    for(i=0;i<DIM_EMB/2;i=i+1)
    begin : tree_adder_1st_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_1st_stage
        (   
            //.a(_add_in_a[i]),
            //.b(_add_in_b[i]),
            //.a($signed($signed(_add_in_a[i])>>>(BW_IWL_EXP-BW_IWL))),
            //.b($signed($signed(_add_in_b[i])>>>(BW_IWL_EXP-BW_IWL))),
            .a($signed($signed(_add_in_a[i])>>>(1))),
            .b($signed($signed(_add_in_b[i])>>>(1))),
            .c(_add_out[i]),
            .overflow(),
            .underflow()
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                tree_adder_1st[i] <= {BW_DATA{1'b0}};
            else
                tree_adder_1st[i] <= _tree_adder_1st[i];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB/2;i=i+2)
    begin : tree_adder_2nd_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_2nd_stage
        (
            //.a(tree_adder_1st[i]),
            //.b(tree_adder_1st[i+1]),
            .a($signed(tree_adder_1st[i])>>>(1)),
            .b($signed(tree_adder_1st[i+1])>>>(1)),
            .c(_tree_adder_2nd[i/2]),
            .overflow(),
            .underflow()
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                tree_adder_2nd[i/2] <= {BW_DATA{1'b0}};
            else
                tree_adder_2nd[i/2] <= _tree_adder_2nd[i/2];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB/4;i=i+2)
    begin : tree_adder_3rd_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_3rd_stage
        (
            //.a(tree_adder_2nd[i]),
            //.b(tree_adder_2nd[i+1]),
            .a($signed(tree_adder_2nd[i])>>>(1)),
            .b($signed(tree_adder_2nd[i+1])>>>(1)),
            .c(_tree_adder_3rd[i/2]),
            .overflow(),
            .underflow()
        );
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                tree_adder_3rd[i/2] <= {BW_DATA{1'b0}};
            else
                tree_adder_3rd[i/2] <= _tree_adder_3rd[i/2];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB/8;i=i+2)
    begin : tree_adder_4th_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_4th_stage
        (
            //.a(tree_adder_3rd[i]),
            //.b(tree_adder_3rd[i+1]),
            .a($signed(tree_adder_3rd[i])>>>(1)),
            .b($signed(tree_adder_3rd[i+1])>>>(1)),
            .c(_tree_adder_4th[i/2]),
            .overflow(),
            .underflow()
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                tree_adder_4th[i/2] <= {BW_DATA{1'b0}};
            else
                tree_adder_4th[i/2] <= _tree_adder_4th[i/2];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB/16;i=i+2)
    begin : tree_adder_5th_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_5th_stage
        (
            //.a(tree_adder_4th[i]),
            //.b(tree_adder_4th[i+1]),
            .a($signed(tree_adder_4th[i])>>>(1)),
            .b($signed(tree_adder_4th[i+1])>>>(1)),
            .c(_tree_adder_5th),
            .overflow(overflow_tree_adder_5th),
            .underflow(underflow_tree_adder_5th)
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                tree_adder_5th <= {BW_DATA{1'b0}};
            else
                tree_adder_5th <= _tree_adder_5th;
        end
    end
endgenerate

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_1st_input_valid <= 1'b0;
    else
        tree_adder_1st_input_valid <= en_addr_dot_product;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_1st_valid <= 1'b0;
    else
        tree_adder_1st_valid <= tree_adder_1st_input_valid;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_2nd_valid <= 1'b0;
    else
        tree_adder_2nd_valid <= tree_adder_1st_valid;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_3rd_valid <= 1'b0;
    else
        tree_adder_3rd_valid <= tree_adder_2nd_valid;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_4th_valid <= 1'b0;
    else
        tree_adder_4th_valid <= tree_adder_3rd_valid;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_5th_valid <= 1'b0;
    else
        tree_adder_5th_valid <= tree_adder_4th_valid;
end




//
exp_fixed
#
(
    .BW_WL(BW_WL),
    .BW_IWL(BW_IWL_EXP)
)
exp
(
    .clk(clk),
    .rst_n(rst_n),
    .din(din_exp),
    .dout(_dout_exp)
);

always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_hop)
begin
    if(rst_n==1'b0 || rst_n_soft==1'b0 || rst_n_hop==1'b0)
        dout_exp <= {BW_DATA{1'b0}};
    else
        if(en_exp==1'b1)
            dout_exp <= _dout_exp;
        else
            dout_exp <= {BW_DATA{1'b0}};
end


fixed_adder
#(
    .WL(BW_WL),
    .IWL(BW_IWL_EXP)
)
accu_exp
(
    .a(reg_sum_exp),
    .b(dout_exp),
    .c(_reg_sum_exp),
    .overflow(overflow_accu_exp),
    .underflow(underflow_acdu_exp)
);


div_32
div_32_norm
(
    .aclk(clk),
    .s_axis_dividend_tvalid(div_din_valid),
    .s_axis_dividend_tready(div_din_ready),
    //.s_axis_dividend_tdata(reg_exp[(count_addr_dout+1)*BW_DATA-1-:BW_DATA]),
    .s_axis_dividend_tdata(reg_exp[count_addr_dout]),
    .s_axis_divisor_tvalid(en_norm_div),
    .s_axis_divisor_tready(),
    .s_axis_divisor_tdata(reg_sum_exp),
    .m_axis_dout_tvalid(done_div),
    .m_axis_dout_tdata({div_norm_q, div_norm_f})
);



//
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : memory_a
        ram_sync
        #(
            .BW_DATA(BW_DATA),
            .BW_ADDR(BW_MEM_ADDR)
        )
        mem_a
        (
            // clk
            .clk(clk),
            // reset_n
            .rst_n(rst_n),
            // input
            .addr(addr_mem_a),
            .oe(!we_mem_a),
            .we(we_mem_a),
            .data_in(data_in_mem_a[i]),
            // inout
            .data_out(data_out_mem_a[i])
        );
    end
endgenerate

/*
ram_sync
#(
    .BW_DATA(BW_MEM_DATA),
    .BW_ADDR(BW_MEM_ADDR)
)
mem_a
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    .addr(addr_mem_a),
    .oe(!we_mem_a),
    .we(we_mem_a),
    .data_in(data_in_mem_a),
    // inout
    .data_out(data_out_mem_a)
);
*/




generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_data_in_mem_grad
        //assign data_in_mem_grad[i] = (en_bwd_path_sync==1'b1)? _mult_out[i]:{BW_DATA{1'b0}};
        //assign data_in_mem_grad[i] = (en_bwd_path_sync==1'b1)? mult_out[i]:{BW_DATA{1'b0}};
        //assign data_in_mem_grad[i] = (en_bwd_path_dot_grad==1'b1)? _mult_out[i]:{BW_DATA{1'b0}};
        assign data_in_mem_grad[i] = (en_bwd_path_dot_grad==1'b1)? mult_out_bwd_path[i]:{BW_DATA{1'b0}};
    end
endgenerate

//assign we_mem_grad = en_bwd_path_dot_grad && enable_mac[0];
//assign we_mem_grad = en_bwd_path_dot_grad && enable_mac;
assign we_mem_grad = en_bwd_path_dot_grad && en_accum_grad;

//assign addr_mem_grad = addr_grad;


assign addr_mem_grad_bwd_path_dot_grad = addr_grad;
assign addr_mem_grad_bwd_path_grad_sync = ain_bwd_path_grad;

always@(*)
begin
    case({en_bwd_path_dot_grad,en_bwd_path_grad_sync})
        2'b10:
        begin
            addr_mem_grad = addr_mem_grad_bwd_path_dot_grad;
        end
        2'b01:
        begin
            addr_mem_grad = addr_mem_grad_bwd_path_grad_sync;
        end
        default
        begin
            addr_mem_grad = {BW_MEM_ADDR{1'b0}};
        end
    endcase
end


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign _gout_mat[i] = (en_bwd_path_grad_sync==1'b1)? data_out_mem_grad[i] : {BW_DATA{1'b0}};
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign gout_mat[(i+1)*BW_DATA-1-:BW_DATA] = _gout_mat[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        ram_sync
        #(
            .BW_DATA(BW_DATA),
            .BW_ADDR(BW_MEM_ADDR)
        )
        mem_grad
        (
            // clk
            .clk(clk),
            // reset_n
            .rst_n(rst_n),
            // input
            .addr(addr_mem_grad),
            .oe(!we_mem_grad),
            .we(we_mem_grad),
            .data_in(data_in_mem_grad[i]),
            // inout
            .data_out(data_out_mem_grad[i])
        );
    end
endgenerate


//
counter
#(
    .BW(BW_MEM_ADDR+1),
    .COUNT_VALUE(COUNT_VALUE_IN+1)
)
addr_mem
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_addr_mem),
    // input
    .en(en_addr_mem),
    .en_hold_max(1'b1),
    // output
    .count(count_addr_mem),
    //.done(done_addr_mem)
    .done()
);

//
counter
#(
    .BW(BW_MEM_ADDR+1),
    .COUNT_VALUE(COUNT_VALUE_IN+1)
)
addr_dout
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_addr_dout),
    // input
    .en(en_addr_dout),
    .en_hold_max(1'b0),
    // output
    .count(count_addr_dout),
    .done()
);

////////////////////////////////////////////////////////////
// debug
////////////////////////////////////////////////////////////

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        debug_out <= {`BW_DEBUG_ATT_MEM{1'b0}};
    else
        debug_out <= {overflow_adder_exp_sub_max,overflow_adder_bwd_path,overflow_tree_adder_5th,overflow_accu_exp,underflow_adder_exp_sub_max,underflow_adder_bwd_path,underflow_tree_adder_5th,underflow_accu_exp};
end


/*
`ifdef DEBUG
wire [BW_DATA-1:0] debug_dout_attention [0:NUM_MEM-1];

generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin : debugger_attention
        assign debug_dout_attention[i] = dout_attention[(i+1)*BW_WL-1-:BW_WL];
    end
endgenerate

wire [BW_DATA-1:0] debug_gout_vec [0:DIM_EMB-1];

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : debugger_gout_vec
        assign debug_gout_vec[i] = _gout_vec[i];
    end
endgenerate

wire [BW_DATA-1:0] debug_gout_mat [0:DIM_EMB-1];

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : debugger_gout_mat
        assign debug_gout_mat[i] = gout_mat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

`endif
*/

`ifdef DEBUG_ILA
ila
ila_attention_mem
(
    .clk(clk),

    // 1 bit
    .probe0(en_exp),
    .probe1(rst_n_hop),
    .probe2(rst_n_mac),
    .probe3(rst_n_mac_bwd_path_sm_sum_grad),
    .probe4(rst_n_addr_mem),
    .probe5(rst_n_addr_dout),
    .probe6(en_mem_w_sync),
    .probe7(en_fwd_path_sync),

    // 1 bit
    .probe8(en_bwd_path_sync),
    .probe9(en_bwd_path_grad_sync),
    .probe10(en_dot_product),
    .probe11(),
    .probe12(en_bwd_path_sm_sum_grad),
    .probe13(en_bwd_path_sm_grad),
    .probe14(en_bwd_path_dot_grad),
    .probe15(en_addr_exp),

    // 16 bit
    .probe16(count_addr_dout),
    .probe17(count_addr_mem),
    .probe18(addr_mem_a),
    .probe19(addr_mem_grad_bwd_path_grad_sync),
    .probe20(addr_mem_grad_bwd_path_dot_grad),
    .probe21(ain_bwd_path_grad),
    .probe22(addr_dot_product),
    .probe23(hop),

    // 32 bit
    .probe24(din_exp),
    .probe25(dout_exp),
    .probe26(reg_dot_product_max),
    .probe27(_reg_dot_product),
    .probe28(reg_sum_exp),
    .probe29(_dout_attention),
    .probe30(_grad_out_sm),
    .probe31(sum_grad),

    // 1 bit
    .probe32(en_accum_grad),
    .probe33(en_addr_sm_grad),
    .probe34(done_dot_product),
    .probe35(done_exp),
    .probe36(done_norm_sum),
    .probe37(en_addr_mem),
    .probe38(en_addr_dout),
    .probe39(en_addr_dot_product),

    // 1 bit
    .probe40(en_addr_dout_div),
    .probe41(tree_adder_valid),
    .probe42(overflow_mult_1),
    .probe43(underflow_mult_1),
    .probe44(),
    .probe45(),
    .probe46(),
    .probe47(),

    // 1 bit
    .probe48(overflow_adder_exp_sub_max),
    .probe49(overflow_adder_bwd_path),
    .probe50(overflow_tree_adder_5th),
    .probe51(overflow_accu_exp),
    .probe52(underflow_adder_exp_sub_max),
    .probe53(underflow_adder_bwd_path),
    .probe54(underflow_tree_adder_5th),
    .probe55(underflow_accu_exp)

);
`endif //DEBUG_ILA

endmodule
