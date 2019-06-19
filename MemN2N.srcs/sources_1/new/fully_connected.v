//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/04 06:07:09
// Design Name: 
// Module Name: fully_connected
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

module fully_connected
(
    // clock
    clk,
    // rst_n
    rst_n,
    rst_n_soft,
    rst_n_batch,
    rst_n_hop,
    // input
    en_init_w,
    data_in_init_w,
    addr_in_init_w,
    en_fwd_path,
    en_bwd_path,
    en_bwd_path_w_up,
    data_in,
    grad_in,
    lr_l2,
    hop,

    // output
    data_out,
    grad_out,
    done_init_w,
    done_fwd_path,
    done_bwd_path,
    done_bwd_path_w_up,

    // debug
    debug_out
);

//
parameter BW_WL = `BW_WL;
parameter BW_IWL = `BW_IWL;

parameter BW_DIM_OUT = `BW_DIM_EMB;
parameter BW_DIM_IN = `BW_DIM_EMB;

parameter DIM_OUT = 1<<BW_DIM_OUT;
parameter DIM_IN = 1<<BW_DIM_IN;

parameter BW_DATA = `BW_DATA_EMB_W;
//parameter BW_ADDR = `CLOG2(BW_DIM_OUT);        // should make it parameter
//parameter COUNT_VALUE_IN = (1 << BW_COUNTER_IN) - 1;
//parameter BW_COUNTER_IN = `CLOG2(BW_DIM_OUT);
//parameter COUNT_VALUE_IN = DIM_OUT-1;

parameter BW_ADDR = BW_DIM_OUT;        // should make it parameterable
parameter BW_COUNTER_IN = BW_DIM_OUT;
parameter COUNT_VALUE_IN = DIM_OUT-1;

parameter BW_MEM_ADDR = `BW_MEM_ADDR;

parameter LEARNING_RATE_SHIFT_BITS = `LEARNING_RATE_SHIFT_BITS;
parameter REG_L2_NORM_SHIFT_BITS = `REG_L2_NORM_SHIFT_BITS;
parameter BW_BATCH_SIZE = `BW_BATCH_SIZE;

parameter BW_HOP = `BW_HOP;
parameter NUM_HOP = `NUM_HOP;

parameter INIT_FILE = "";

parameter BW_ADDR_W_INIT = `BW_ADDR_W_INIT;


//
input wire clk;
input wire rst_n;
input wire rst_n_soft;
input wire rst_n_batch;
input wire rst_n_hop;
input wire en_init_w;
input wire [BW_DATA*DIM_IN-1:0] data_in_init_w;
input wire [BW_ADDR_W_INIT-1:0] addr_in_init_w;
input wire en_fwd_path;
input wire en_bwd_path;
input wire en_bwd_path_w_up;
input wire [BW_DATA*DIM_IN-1:0] data_in;
input wire [BW_DATA*DIM_OUT-1:0] grad_in; 
input wire [7:0] lr_l2;
input wire [BW_HOP-1:0] hop;

output reg [BW_DATA*DIM_OUT-1:0] data_out;
output reg [BW_DATA*DIM_IN-1:0] grad_out;
output reg done_init_w;
output reg done_fwd_path;
output reg done_bwd_path;
output reg done_bwd_path_w_up;
output reg [`BW_DEBUG_FC-1:0] debug_out;

// internal
genvar i;
genvar j;

reg [BW_DATA-1:0] _grad_out [0:DIM_IN-1];

reg en_init_w_sync;
reg en_fwd_path_sync;
reg en_bwd_path_sync;


wire [BW_DATA-1:0] data_in_w [0:DIM_IN-1];
wire [BW_DATA-1:0] data_out_w [0:DIM_IN-1];
wire [BW_DATA-1:0] data_write [0:DIM_IN-1];
wire [BW_DATA-1:0] data_in_w_del [0:DIM_IN-1];
wire [BW_DATA-1:0] data_out_w_del [0:DIM_IN-1];
reg [BW_DATA-1:0] data_w_del_write [0:DIM_IN-1];
wire we_w;
//wire we_w_del;
reg we_w_del;

wire rst_n_addr_w;
wire en_addr_w;
wire en_hold_max_addr_w;
wire [BW_COUNTER_IN-1:0] count_addr_w;
reg [BW_COUNTER_IN-1:0] addr_dot_product;
wire [BW_COUNTER_IN-1:0] addr_w;

wire [BW_COUNTER_IN-1:0] addr_dout;
reg [BW_COUNTER_IN-1:0] addr_dout_sm_pre;
reg [BW_COUNTER_IN-1:0] addr_dout_sm;

wire done_addr_w;

reg done_addr_w_reg;

wire [BW_DATA*DIM_IN-1:0] data_init_w;

reg en_dot_product;
reg done_dot_product;

wire [BW_DATA-1:0] _reg_dot_product;

wire en_addr_w_fwd_path;


reg en_addr_w_dot_product;




wire [BW_DATA-1:0] _data_in [0:DIM_IN-1];

wire [BW_DATA-1:0] _grad_in [0:DIM_OUT-1];

reg [BW_COUNTER_IN-1:0] addr_w_bwd_grad_in;
wire [BW_COUNTER_IN-1:0] addr_w_del;


reg en_bwd_path_w_up_sync;

reg f_1st_in_batch;


reg en_w_up;
reg en_w_up_d;
reg done_w_up;
reg [BW_DATA-1:0] data_w_up [0:DIM_IN-1];
wire en_w_up_latch;

wire rst_n_w_del;

wire [BW_DATA-1:0] _reg_mult [0:DIM_IN-1];

wire [BW_DATA-1:0] _tree_adder_1st [0:DIM_IN/2-1];
wire [BW_DATA-1:0] _tree_adder_2nd [0:DIM_IN/4-1];
wire [BW_DATA-1:0] _tree_adder_3rd [0:DIM_IN/8-1];
wire [BW_DATA-1:0] _tree_adder_4th [0:DIM_IN/16-1];
wire [BW_DATA-1:0] _tree_adder_5th;

reg [BW_DATA-1:0] tree_adder_1st [0:DIM_IN/2-1];
reg [BW_DATA-1:0] tree_adder_2nd [0:DIM_IN/4-1];
reg [BW_DATA-1:0] tree_adder_3rd [0:DIM_IN/8-1];
reg [BW_DATA-1:0] tree_adder_4th [0:DIM_IN/16-1];
reg [BW_DATA-1:0] tree_adder_5th;

reg tree_adder_1st_valid;
reg tree_adder_2nd_valid;
reg tree_adder_3rd_valid;
reg tree_adder_4th_valid;
reg tree_adder_5th_valid;
wire tree_adder_valid;


//reg [BW_DATA*DIM_IN-1:0] din_a_mult;
//reg [BW_DATA*DIM_IN-1:0] din_b_mult;
reg [BW_DATA-1:0] din_a_mult [0:DIM_IN-1];
reg [BW_DATA-1:0] din_b_mult [0:DIM_IN-1];
wire [BW_DATA-1:0] dout_mult [0:DIM_IN-1];

wire [BW_DATA-1:0] din_a_mult_2 [0:DIM_IN-1];
wire [BW_DATA-1:0] din_b_mult_2 [0:DIM_IN-1];
wire [BW_DATA-1:0] _dout_mult_2 [0:DIM_IN-1];
reg [BW_DATA-1:0] dout_mult_2 [0:DIM_IN-1];


wire [BW_DATA-1:0] _reg_accum_grad [0:DIM_IN-1];
reg [BW_DATA-1:0] reg_accum_grad [0:DIM_IN-1];

wire rst_n_init_bwd;
reg [BW_DATA-1:0] _add_in_a [0:DIM_IN-1];
reg [BW_DATA-1:0] _add_in_b [0:DIM_IN-1];
wire [BW_DATA-1:0] _add_out [0:DIM_IN-1];

reg [BW_DATA-1:0] _add_in_reg_l2_a [0:DIM_IN-1];
reg [BW_DATA-1:0] _add_in_reg_l2_b [0:DIM_IN-1];
reg [BW_DATA-1:0] add_in_reg_l2_a [0:DIM_IN-1];
reg [BW_DATA-1:0] add_in_reg_l2_b [0:DIM_IN-1];
wire [BW_DATA-1:0] _add_out_reg_l2 [0:DIM_IN-1];

reg [BW_DATA-1:0] add_in_w_del_a[0:DIM_IN-1];
reg [BW_DATA-1:0] add_in_w_del_b[0:DIM_IN-1];
wire [BW_DATA-1:0] _add_out_w_del [0:DIM_IN-1];


wire _done_init_w;
wire _done_fwd_path;
wire _done_bwd_path;


reg en_w_del_latch_pre;
reg en_w_del_latch;

reg [3:0] lr;
reg [3:0] l2;

//
wire overflow_adder_sub_max;
wire overflow_tree_adder_5th;
wire [DIM_IN-1:0] overflow_mult;
wire [DIM_IN-1:0] overflow_mult_2;

wire underflow_adder_sub_max;
wire underflow_tree_adder_5th;
wire [DIM_IN-1:0] underflow_mult;
wire [DIM_IN-1:0] underflow_mult_2;


wire [BW_DATA*DIM_OUT-1:0] _data_out;
reg [BW_DATA-1:0] data_out_buf [0:NUM_HOP-1][0:DIM_OUT-1];

//
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        lr <= 4'b0;
    else
        lr <= lr_l2[7:4];
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        l2 <= 4'b0;
    else
        l2 <= lr_l2[3:0];
end

// combinational logic
assign en_addr_w_fwd_path = en_dot_product&&en_addr_w_dot_product;

always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_batch or negedge rst_n_hop)
begin
    if( (rst_n&&rst_n_soft&&rst_n_batch&&rst_n_hop)==1'b0 )
        en_addr_w_dot_product <= 1'b0;
    else
        if(en_addr_w_dot_product == 1'b1||done_dot_product==1'b1)
            en_addr_w_dot_product <= 1'b0;
        else
            //if(count_addr_w=={BW_COUNTER_IN{1'b0}}&&addr_dot_product!={BW_COUNTER_IN{1'b1}})
            if(count_addr_w=={BW_COUNTER_IN{1'b0}}&&addr_dot_product<{BW_COUNTER_IN{1'b1}})
                en_addr_w_dot_product <= en_dot_product;
            else
                //if(tree_adder_valid==1'b1&&addr_dot_product!={BW_COUNTER_IN{1'b1}})
                if(tree_adder_valid==1'b1&&addr_dot_product<{BW_COUNTER_IN{1'b1}})
                    en_addr_w_dot_product <= en_dot_product;
                else
                    en_addr_w_dot_product <= 1'b0;
end


assign _done_init_w = en_init_w_sync && done_addr_w;

always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_batch or negedge rst_n_hop)
begin
    if( (rst_n&&rst_n_soft&&rst_n_batch&&rst_n_hop)==1'b0 )
        done_init_w <= 1'b0;
    else
        done_init_w <= _done_init_w;
end

//assign rst_n_addr_w = rst_n && (en_init_w_sync || (en_fwd_path_sync&&(!(en_dot_product&&done_dot_product))) || en_bwd_path_sync || en_bwd_path_w_up_sync) && rst_n_soft && rst_n_hop;
assign rst_n_addr_w = rst_n && ((en_fwd_path_sync&&(!(en_dot_product&&done_dot_product))) || en_bwd_path_sync || en_bwd_path_w_up_sync) && rst_n_soft && rst_n_hop;
//assign en_addr_w = en_init_w_sync || en_addr_w_fwd_path || en_bwd_path_sync&&en_w_del_latch || en_bwd_path_w_up_sync&&done_w_up;
assign en_addr_w = en_addr_w_fwd_path || en_bwd_path_sync&&en_w_del_latch || en_bwd_path_w_up_sync&&done_w_up;

assign en_hold_max_addr_w = 1'b1;

//assign data_init_w = `INIT_WEIGHT_W;
assign data_init_w = data_in_init_w;

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : assign_data_write
        assign data_write[i] = (en_init_w_sync==1'b1) ? data_init_w[(i+1)*BW_DATA-1-:BW_DATA] : ((en_bwd_path_w_up_sync==1'b1&&done_w_up==1'b1)? data_w_up[i] : {BW_DATA{1'b0}});
    end
endgenerate


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : assign_data_w
        //assign data_in_w[i] = (we_w==1'b1)? data_write[i] : {BW_DATA{1'b0}};
        assign data_in_w[i] = data_write[i];
    end
endgenerate


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : assign_data_w_del
        //assign data_w_del[i] = (we_w_del==1'b1) ? dout_mult_2[i] : {BW_DATA{1'bz}};
        assign data_in_w_del[i] = (we_w_del==1'b1) ? data_w_del_write[i] : {BW_DATA{1'b0}};
    end
endgenerate

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_del_latch <= 1'b0;
    else
        if(en_w_del_latch==1'b1)
            en_w_del_latch <= 1'b0;
        else if(en_w_del_latch==1'b0&&we_w_del==1'b0)
            en_w_del_latch <= en_bwd_path_sync;
end
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_del_latch_pre <= 1'b0;
    else
        if(en_w_del_latch_pre==1'b1)
            en_w_del_latch_pre <= 1'b0;
        else if(en_w_del_latch_pre==1'b0&&en_w_del_latch==1'b0&&we_w_del==1'b0)
            en_w_del_latch_pre <= en_bwd_path_sync;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_del_latch <= 1'b0;
    else
        en_w_del_latch <= en_w_del_latch_pre;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        we_w_del <= 1'b0;
    else
        if(en_bwd_path_sync==1'b1)
        we_w_del <= en_w_del_latch;
end


//assign we_w_del = en_w_del_latch;

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : assign_data_w_del_write
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                data_w_del_write[i] <= {BW_DATA{1'b0}};
            else
                if(en_w_del_latch==1'b1)
                    //data_w_del_write[i] <= _add_out_reg_l2[i];
                    data_w_del_write[i] <= _add_out_w_del[i];
                    
        end
    end
endgenerate


assign we_w = en_init_w_sync || en_bwd_path_w_up_sync&&done_w_up;
//assign we_w_del = en_bwd_path_sync; // should modify for batch SGD



assign _done_fwd_path = en_fwd_path_sync && done_dot_product;

always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_batch or negedge rst_n_hop)
begin
    if( (rst_n&&rst_n_soft&&rst_n_batch&&rst_n_hop)==1'b0 )
        done_fwd_path <= 1'b0;
    else
        done_fwd_path <= _done_fwd_path;
end


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        assign _data_in[i] = data_in[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_OUT;i=i+1)
    begin
        assign _grad_in[i] = grad_in[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate


// sequential logic
/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_init_w_sync <= 1'b0;
    else 
        if(_done_init_w==1'b1)
            en_init_w_sync <= 1'b0;
        else if(en_init_w_sync==1'b0)
            en_init_w_sync <= en_init_w;
end
*/
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_init_w_sync <= 1'b0;
    else 
        en_init_w_sync <= en_init_w;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path_sync <= 1'b0;
    else
        if(_done_fwd_path==1'b1)
            en_fwd_path_sync <= 1'b0;
        else if(en_fwd_path_sync==1'b0)
            en_fwd_path_sync <= en_fwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_sync <= 1'b0;
    else
        if(_done_bwd_path==1'b1)
            en_bwd_path_sync <= 1'b0;
        else if(en_bwd_path_sync==1'b0)
            en_bwd_path_sync <= en_bwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_dot_product <= 1'b0;
    else
        if(done_dot_product==1'b1)
            en_dot_product <= 1'b0;
        else if(en_fwd_path_sync==1'b1 && en_dot_product==1'b0)
            //en_dot_product<=en_addr_dout;
            en_dot_product<=en_fwd_path_sync;
end

/*
generate
    for(i=0;i<DIM_OUT;i=i+1)
    begin
        always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_hop)
        begin
            if(rst_n==1'b0 || rst_n_soft==1'b0 || rst_n_hop==1'b0)
                data_out[i] <= {BW_DATA{1'b0}};
            else
                if(en_dot_product==1'b1 && i==addr_dot_product && tree_adder_valid==1'b1)
                    data_out[i] <= _reg_dot_product;
        end
    end
endgenerate
*/

generate
    for(i=0;i<NUM_HOP;i=i+1)
    begin
        for(j=0;j<DIM_OUT;j=j+1)
        begin
            always@(posedge clk or negedge rst_n or negedge rst_n_soft)
            begin
                if(rst_n==1'b0 || rst_n_soft==1'b0)
                    data_out_buf[i][j] <= {BW_DATA{1'b0}};
                else
                    if(en_dot_product==1'b1 && i==hop && j==addr_dot_product && tree_adder_valid==1'b1)
                        data_out_buf[i][j] <= _reg_dot_product;
            end
        end
    end
endgenerate

generate
    for(i=0;i<DIM_OUT;i=i+1)
    begin
        assign _data_out[(i+1)*BW_DATA-1-:BW_DATA] = data_out_buf[hop][i];
    end
endgenerate

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        data_out <= {(BW_DATA*DIM_OUT-1){1'b0}};
    else
        if(done_fwd_path==1'b1)
            data_out <= _data_out;
end


assign _reg_dot_product = tree_adder_5th;

assign tree_adder_valid = tree_adder_5th_valid;


always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_hop)
begin
    if(rst_n==1'b0 || rst_n_soft==1'b0 || rst_n_hop==1'b0)
        addr_dot_product <= 'b0;
    else
        if(en_dot_product==1'b1 && tree_adder_valid==1'b1)
        //if(en_dot_product==1'b1)
            addr_dot_product <= count_addr_w;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_dot_product <= 1'b0;
    else
        if(_done_fwd_path==1'b1)
            done_dot_product <= 1'b0;
        else if(en_dot_product==1'b1&&done_dot_product==1'b0&&(COUNT_VALUE_IN==addr_dot_product)&&tree_adder_valid==1'b1)
            done_dot_product <= 1'b1;
end


reg [BW_DATA-1:0] reg_dot_product_max;

always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_hop)
begin
    if(rst_n==1'b0 || rst_n_soft==1'b0 || rst_n_hop==1'b0)
        reg_dot_product_max <= {1'b1, {(BW_DATA-2){1'b0}}, 1'b1};
    else
        //if(en_dot_product==1'b1 && ($signed(reg_dot_product_max) < $signed(_reg_dot_product)) || (addr_dot_product=='b1) )
        if(en_dot_product==1'b1 && tree_adder_valid==1'b1 && $signed(reg_dot_product_max) < $signed(_reg_dot_product))
            reg_dot_product_max <= _reg_dot_product;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_w_bwd_grad_in <= {BW_COUNTER_IN{1'b0}};
    else
        if(en_bwd_path_sync==1'b1)
            addr_w_bwd_grad_in <= count_addr_w;
        else
            addr_w_bwd_grad_in <= {BW_COUNTER_IN{1'b0}};
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_w_up_sync <= 1'b0;
    else
        if(done_bwd_path_w_up==1'b1)
            en_bwd_path_w_up_sync <= 1'b0;
        else if(en_bwd_path_w_up_sync==1'b0)
            en_bwd_path_w_up_sync <= en_bwd_path_w_up;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_bwd_path_w_up <= 1'b0;
    else
        if(done_bwd_path_w_up==1'b1)
            done_bwd_path_w_up <= 1'b0;
        else if(en_bwd_path_w_up_sync==1'b1)
            done_bwd_path_w_up <= done_addr_w;
end

// test_170810_2
//assign en_w_up_latch = en_w_up && !done_w_up;
assign en_w_up_latch = en_w_up_d && !done_w_up;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_up <= 1'b0;
    else
        if(done_w_up==1'b1)
            en_w_up <= 1'b0;
        //else if(en_bwd_path_sync==1'b1 || en_bwd_path_w_up_sync==1'b1)
        else if(en_bwd_path_w_up_sync==1'b1)
            en_w_up <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_up_d <= 1'b0;
    else
        if(done_w_up==1'b1)
            en_w_up_d <= 1'b0;
        else
            en_w_up_d <= en_w_up;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_w_up <= 1'b0;
    else
        if(done_w_up==1'b1)
            done_w_up <= 1'b0;
        else if(en_w_up_d==1'b1)
            done_w_up <= 1'b1;
end

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : assign_data_w_up
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                data_w_up[i] <= {BW_DATA{1'b0}};
            else
                if(en_w_up_latch==1'b1)
                    //data_w_up[i] <= $signed(_add_out[i]) >>> LEARNING_RATE_SHIFT_BITS; 
                    //data_w_up[i] <= _add_out[i]; 
                    data_w_up[i] <= _add_out_reg_l2[i]; 
        end
    end
endgenerate

/*
reg [BW_COUNTER_IN-1:0] addr_w_up;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_w_up <= {BW_COUNTER_IN{1'b0}};
    else
        if(en_w_up_latch==1'b1)
            addr_w_up <= addr_w;
end
*/


//assign addr_w = (en_fwd_path_sync==1'b1)? count_addr_w : count_addr_w;
assign addr_w = (en_fwd_path_sync==1'b1)? count_addr_w : ((en_init_w_sync==1'b1)? addr_in_init_w:count_addr_w);


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_addr_w_reg <= 1'b0;
    else
        if(en_bwd_path_sync == 1'b1)
            if(done_addr_w == 1'b1)
                done_addr_w_reg <= 1'b1;
        else
            done_addr_w_reg <= 1'b0;
end


// instance
generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : weight
        ram_sync
        #(
            .BW_DATA(BW_DATA),
            .BW_ADDR(BW_ADDR),
            .INIT_FILE(`FILE_NAME_INIT_W_FC(i))
        )
        weight
        (
            // clk
            .clk(clk),
            // reset_n
            .rst_n(rst_n),
            // input
            .addr(addr_w),
            .oe(!we_w),
            .we(we_w),      
            .data_in(data_in_w[i]),
            // inout
            .data_out(data_out_w[i])
        );
    end
endgenerate





assign rst_n_w_del = rst_n && rst_n_batch;


always@(posedge clk or negedge rst_n_w_del) 
begin
    if(rst_n_w_del==1'b0)
        f_1st_in_batch <= 1'b1;
    else
        if(_done_bwd_path==1'b1)
            f_1st_in_batch <= 1'b0;
end

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : weight_del
        ram_sync
        #(
            .BW_DATA(BW_DATA),
            .BW_ADDR(BW_ADDR)
        )
        weight_del
        (
            // clk
            .clk(clk),
            // reset_n
            .rst_n(rst_n_w_del),
            // input
            .addr(addr_w_del),
            .oe(!we_w_del),
            .we(we_w_del),      
            .data_in(data_in_w_del[i]),
            // 
            .data_out(data_out_w_del[i])
        );
    end
endgenerate

//
counter
#(
    .BW(BW_COUNTER_IN),
    .COUNT_VALUE(COUNT_VALUE_IN)
)
addr_weight
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_addr_w),
    // input
    .en(en_addr_w),
    //.en_hold_max(1'b0),
    .en_hold_max(en_hold_max_addr_w),
    // output
    .count(count_addr_w),
    .done(done_addr_w)
);




generate
    //for(i=0;i<DIM_OUT;i=i+1)
    for(i=0;i<DIM_IN;i=i+1)
    begin : assign_din_mult
        always@(*)
        begin
            case({en_fwd_path_sync, en_bwd_path_sync})
                2'b10 :     // fwd path
                begin
                    din_a_mult[i] <= data_out_w[i];
                    din_b_mult[i] <= _data_in[i];
                end
                2'b01:      // bwd path
                begin
                    din_a_mult[i] <= data_out_w[i];
                    din_b_mult[i] <= _grad_in[addr_w_bwd_grad_in];
                end
                default
                begin
                    din_a_mult[i] <= {BW_DATA{1'b0}};
                    din_b_mult[i] <= {BW_DATA{1'b0}};
                end
            endcase
        end
    end
endgenerate


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : assign__reg_mult
        //assign _reg_mult[i] = (en_fwd_path_sync==1'b1)? dout_mult[i] : {BW_DATA{1'b0}};
        assign _reg_mult[i] = (en_fwd_path_sync==1'b1 && en_dot_product==1'b1)? dout_mult[i] : {BW_DATA{1'b0}};
    end
endgenerate


// multiplier
generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : multiplier 
        fixed_mult
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_multiplier
        (
            .a(din_a_mult[i]),
            .b(din_b_mult[i]),
            .c(dout_mult[i]),
            .overflow(overflow_mult[i]),
            .underflow(underflow_mult[i])
        );
    end
endgenerate


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        assign din_a_mult_2[i] = (en_bwd_path_sync==1'b1) ? data_in[(i+1)*BW_DATA-1-:BW_DATA]: {BW_DATA{1'b0}};
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        assign din_b_mult_2[i] = (en_bwd_path_sync==1'b1) ? _grad_in[addr_w_del]: {BW_DATA{1'b0}};
    end
endgenerate

assign addr_w_del = (en_bwd_path_sync==1'b1) ? addr_w_bwd_grad_in : ((en_bwd_path_w_up_sync==1'b1)? addr_w:{BW_COUNTER_IN{1'b0}});

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : multiplier_2
        fixed_mult
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_multiplier_2
        (
            .a(din_a_mult_2[i]),
            .b(din_b_mult_2[i]),
            //.c(dout_mult_2[i]),
            .c(_dout_mult_2[i]),
            .overflow(overflow_mult_2[i]),
            .underflow(underflow_mult_2[i])
        );
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                dout_mult_2[i] <= {BW_DATA{1'b0}};
            else
                dout_mult_2[i] <= _dout_mult_2[i];
        end
    end
endgenerate


// tree adder
generate
    for(i=0;i<DIM_IN;i=i+2)
    begin : tree_adder_1st_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_1st_stage
        (
            .a(_reg_mult[i]),
            .b(_reg_mult[i+1]),
            .c(_tree_adder_1st[i/2]),
            .overflow(),
            .underflow()
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                tree_adder_1st[i/2] <= {BW_DATA{1'b0}};
            else
                tree_adder_1st[i/2] <= _tree_adder_1st[i/2];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_IN/2;i=i+2)
    begin : tree_adder_2nd_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_2nd_stage
        (
            .a(tree_adder_1st[i]),
            .b(tree_adder_1st[i+1]),
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
    for(i=0;i<DIM_IN/4;i=i+2)
    begin : tree_adder_3rd_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_3rd_stage
        (
            .a(tree_adder_2nd[i]),
            .b(tree_adder_2nd[i+1]),
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
    for(i=0;i<DIM_IN/8;i=i+2)
    begin : tree_adder_4th_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_4th_stage
        (
            .a(tree_adder_3rd[i]),
            .b(tree_adder_3rd[i+1]),
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
    for(i=0;i<DIM_IN/16;i=i+2)
    begin : tree_adder_5th_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_5th_stage
        (
            .a(tree_adder_4th[i]),
            .b(tree_adder_4th[i+1]),
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
        tree_adder_1st_valid <= 1'b0;
    else
        tree_adder_1st_valid <= en_addr_w_dot_product;
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





assign rst_n_init_bwd = !en_bwd_path;

assign _done_bwd_path = (en_bwd_path_sync==1'b1)? done_addr_w_reg && we_w_del : 1'b0;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_bwd_path <= 1'b0;
    else
        done_bwd_path <= _done_bwd_path;
end


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                _grad_out[i] <= {BW_DATA{1'b0}};
            else
                if(_done_bwd_path==1'b1)
                    _grad_out[i] <= reg_accum_grad[i];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                grad_out[(i+1)*BW_DATA-1-:BW_DATA] <= {BW_DATA{1'b0}};
            else
                grad_out[(i+1)*BW_DATA-1-:BW_DATA] <= _grad_out[i];
        end
    end
endgenerate





generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(posedge clk or negedge rst_n or negedge rst_n_init_bwd)
        begin
            if(rst_n==1'b0 || rst_n_init_bwd==1'b0)
                reg_accum_grad[i] <= {BW_DATA{1'b0}};
            else
                if(en_bwd_path_sync==1'b1 && _done_bwd_path==1'b0 && en_addr_w==1'b1)
                    reg_accum_grad[i] <= _reg_accum_grad[i];
        end
    end
endgenerate


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : assign__add_in_a
        always@(*)
        begin
            case({en_fwd_path_sync,en_bwd_path_sync,en_bwd_path_w_up_sync})
                3'b100 :
                begin
                    _add_in_a[i] = {BW_DATA{1'b0}};
                end
                3'b010 :
                begin
                    _add_in_a[i] = dout_mult[i];
                end
                3'b001 :
                begin
                    _add_in_a[i] = data_out_w[i];
                    //_add_in_a[i] = $signed(~shifted_lr_data_out_w_del[i]+1'b1);
                    _add_in_b[i] = $signed(~data_out_w_del[i]+1'b1);
                end
                default
                begin
                    _add_in_b[i] = {BW_DATA{1'b0}};
                end
            endcase
        end
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : assign__reg_accum_grad
        assign _reg_accum_grad[i] = (en_bwd_path_sync==1'b1)? _add_out[i] : {BW_DATA{1'b0}};
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : add_bwd_path
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        adder_bwd_path
        (
            .a(_add_in_a[i]),
            .b(_add_in_b[i]),
            .c(_add_out[i]),
            .overflow(),
            .underflow()
        );

    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                add_in_w_del_a[i] <= {BW_DATA{1'b0}};
            else
                //add_in_w_del_a[i] <= _add_in_reg_l2_a[i];

                if(f_1st_in_batch == 1'b1) 
                    add_in_w_del_a[i] <= {BW_DATA{1'b0}};
                else
                    add_in_w_del_a[i] <= data_out_w_del[i];
        end
    end
endgenerate


reg [BW_DATA-1:0] shifted_lr_dout_mult_2 [0:DIM_IN-1];

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(*)
        begin
            case(lr)
                4'b0000:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (0+BW_BATCH_SIZE);
                end
                4'b0001:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (1+BW_BATCH_SIZE);
                end
                4'b0010:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (2+BW_BATCH_SIZE);
                end
                4'b0011:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (3+BW_BATCH_SIZE);
                end
                4'b0100:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (4+BW_BATCH_SIZE);
                end
                4'b0101:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (5+BW_BATCH_SIZE);
                end
                4'b0110:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (6+BW_BATCH_SIZE);
                end
                4'b0111:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (7+BW_BATCH_SIZE);
                end
                4'b1000:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (8+BW_BATCH_SIZE);
                end
                4'b1001:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (9+BW_BATCH_SIZE);
                end
                4'b1010:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (10+BW_BATCH_SIZE);
                end
                4'b1011:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (11+BW_BATCH_SIZE);
                end
                4'b1100:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (12+BW_BATCH_SIZE);
                end
                4'b1101:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (13+BW_BATCH_SIZE);
                end
                4'b1110:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (14+BW_BATCH_SIZE);
                end
                4'b1111:
                begin
                    shifted_lr_dout_mult_2[i] = $signed(dout_mult_2[i]) >>> (15+BW_BATCH_SIZE);
                end
            endcase
        end
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                add_in_w_del_b[i] <= {BW_DATA{1'b0}};
            else
                //add_in_w_del_b[i] <= _add_in_reg_l2_b[i];
                //add_in_w_del_b[i] <= dout_mult_2[i];

                /*
                if(shifted_lr_dout_mult_2[i][BW_DATA-1]==1'b0)
                    add_in_w_del_b[i] <= shifted_lr_dout_mult_2[i];
                else
                    add_in_w_del_b[i] <= $signed(shifted_lr_dout_mult_2[i]+1'b1);
                */

                if(shifted_lr_dout_mult_2[i][BW_DATA-1]==1'b0)
                    add_in_w_del_b[i] <= $signed(shifted_lr_dout_mult_2[i]) >>> 3;
                else
                    add_in_w_del_b[i] <= $signed(shifted_lr_dout_mult_2[i]+1'b1) >>> 3;

        end
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                add_in_reg_l2_a[i] <= {BW_DATA{1'b0}};
            else
                add_in_reg_l2_a[i] <= _add_out[i];
        end
    end
endgenerate

reg [BW_DATA-1:0] shifted_lr_data_out_w [0:DIM_IN-1];
reg [BW_DATA-1:0] shifted_lr_l2_data_out_w [0:DIM_IN-1];
reg [BW_DATA-1:0] shifted_lr_l2_2s_data_out_w [0:DIM_IN-1];

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(*)
        begin
            case(lr)
                4'b0000:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]);
                end
                4'b0001:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (1);
                end
                4'b0010:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (2);
                end
                4'b0011:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (3);
                end
                4'b0100:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (4);
                end
                4'b0101:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (5);
                end
                4'b0110:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (6);
                end
                4'b0111:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (7);
                end
                4'b1000:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (8);
                end
                4'b1001:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (9);
                end
                4'b1010:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (10);
                end
                4'b1011:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (11);
                end
                4'b1100:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (12);
                end
                4'b1101:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (13);
                end
                4'b1110:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (14);
                end
                4'b1111:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (15);
                end
            endcase
        end
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(*)
        begin
            case(l2)
                4'b0000:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]);
                end
                4'b0001:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (1);
                end
                4'b0010:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (2);
                end
                4'b0011:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (3);
                end
                4'b0100:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (4);
                end
                4'b0101:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (5);
                end
                4'b0110:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (6);
                end
                4'b0111:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (7);
                end
                4'b1000:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (8);
                end
                4'b1001:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (9);
                end
                4'b1010:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (10);
                end
                4'b1011:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (11);
                end
                4'b1100:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (12);
                end
                4'b1101:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (13);
                end
                4'b1110:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (14);
                end
                4'b1111:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> (15);
                end
            endcase
        end
    end
endgenerate


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(*)
        begin
            if(shifted_lr_l2_data_out_w[i][BW_DATA-1]==1'b0)
                //shifted_lr_l2_2s_data_out_w[i] = shifted_lr_l2_data_out_w[i];
                shifted_lr_l2_2s_data_out_w[i] = $signed(shifted_lr_l2_data_out_w[i]) >>> 3;
                //shifted_lr_l2_2s_data_out_w[i] = $signed(shifted_lr_l2_data_out_w[i]) >>> 8;
            else
                //shifted_lr_l2_2s_data_out_w[i] = shifted_lr_l2_data_out_w[i]+1'b1;
                //shifted_lr_l2_2s_data_out_w[i] = $signed(shifted_lr_l2_data_out_w[i] + 1'b1);
                shifted_lr_l2_2s_data_out_w[i] = $signed(shifted_lr_l2_data_out_w[i]) >>> 3  + 1'b1;
                //shifted_lr_l2_2s_data_out_w[i] = $signed($signed(shifted_lr_l2_data_out_w[i]) >>> 8)+1'b1;
        end
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                add_in_reg_l2_b[i] <= {BW_DATA{1'b0}};
            else
                //add_in_reg_l2_b[i] <= $signed(~data_out_w[i]+1'b1) >>> (LEARNING_RATE_SHIFT_BITS + REG_L2_NORM_SHIFT_BITS);
                //add_in_reg_l2_b[i] <= $signed(~data_out_w[i]+1'b1) >>> (lr + l2);
                
                add_in_reg_l2_b[i] <= $signed(~shifted_lr_l2_2s_data_out_w[i]+1'b1);
                //add_in_reg_l2_b[i] <= data_out_w[i];
        end
    end
endgenerate


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : fix_adder_w_del
        fixed_adder
        #(
            .WL(`BW_WL),
            .IWL(`BW_IWL)
        )
        adder_w_del
        (
            // test_170810
            //.a(_add_in_reg_l2_a[i]),
            //.b(_add_in_reg_l2_b[i]),
            //.a(add_in_reg_l2_a[i]),
            //.b(add_in_reg_l2_b[i]),
            .a(add_in_w_del_a[i]),
            .b(add_in_w_del_b[i]),
            .c(_add_out_w_del[i]),
            .overflow(),
            .underflow()
        );
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : fix_adder_w_up_reg_l2
        fixed_adder
        #(
            .WL(`BW_WL),
            .IWL(`BW_IWL)
        )
        adder_w_up_reg_l2
        (
            // test_170810_2
            //.a(_add_in_reg_l2_a[i]),
            //.b(_add_in_reg_l2_b[i]),
            .a(add_in_reg_l2_a[i]),
            .b(add_in_reg_l2_b[i]),
            .c(_add_out_reg_l2[i]),
            .overflow(),
            .underflow()
        );
    end
endgenerate



assign addr_dout = addr_dot_product;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        debug_out <= {`BW_DEBUG_FC{1'b0}};
    else
        debug_out <= {overflow_adder_sub_max,overflow_tree_adder_5th,underflow_adder_sub_max,underflow_tree_adder_5th};
end


`ifdef DEBUG

wire [BW_DATA-1:0] debug_data_out [0:DIM_OUT];

generate
    for(i=0;i<DIM_OUT;i=i+1)
    begin
        assign debug_data_out[i] = data_out[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate


`ifdef DEBUG_ILA
ila
ila_fully_connected
(
    .clk(clk),

    // 1 bit
    // input
    .probe0(rst_n_w_del),
    .probe1(rst_n_init_bwd),
    .probe2(rst_n_addr_w),
    .probe3(en_init_w_sync),
    .probe4(en_fwd_path_sync),
    .probe5(en_bwd_path_sync),
    .probe6(en_dot_product),
    .probe7(),

    // 1 bit
    // output
    .probe8(),
    .probe9(en_addr_w_fwd_path),
    .probe10(en_addr_w_dot_product),
    .probe11(),
    .probe12(en_bwd_path_w_up_sync),
    .probe13(en_w_up),
    .probe14(),
    .probe15(en_w_up_latch),

    // 16 bit
    .probe16(count_addr_w),
    .probe17(addr_dot_product),
    .probe18(addr_w),
    .probe19(addr_in_init_w),
    .probe20(addr_dout),
    .probe21(addr_dout_sm),
    .probe22(addr_w_bwd_grad_in),
    .probe23(addr_w_del),

    // 32 bit
    /*
    .probe24(_reg_dot_product),
    .probe24(),
    .probe25(),
    .probe26(),
    .probe27(),
    .probe28(),
    .probe29(),
    .probe30(),
    .probe31(),
    .probe30(overflow_mult),
    .probe31(overflow_mult_2),
    */

    .probe24(data_init_w[(0+1)*BW_DATA-1-:BW_DATA]),
    .probe25(data_init_w[(1+1)*BW_DATA-1-:BW_DATA]),
    .probe26(data_init_w[(31+1)*BW_DATA-1-:BW_DATA]),
    .probe27(data_write[0]),
    .probe28(data_write[1]),
    .probe29(data_write[31]),
    .probe30(),
    .probe31(),

    // 1 bit
    .probe32(en_addr_w),
    .probe33(en_hold_max_addr_w),
    .probe34(en_w_del_latch),
    .probe35(done_addr_w),
    .probe36(done_addr_w_reg),
    .probe37(done_dot_product),
    .probe38(),
    .probe39(),

    // 1 bit
    .probe40(),
    .probe41(),
    .probe42(done_w_up),
    .probe43(_done_init_w),
    .probe44(_done_fwd_path),
    .probe45(_done_bwd_path),
    .probe46(f_1st_in_batch),
    .probe47(tree_adder_valid),

    // 1 bit
    .probe48(overflow_adder_sub_max),
    .probe49(overflow_tree_adder_5th),
    .probe50(underflow_adder_sub_max),
    .probe51(underflow_tree_adder_5th),
    .probe52(we_w),
    .probe53(),
    .probe54(),
    .probe55()
);
`endif  // DEBUG_ILA

/*
ila_1x4x2048
ila_fully_connected
(
    .clk(clk),

    // 1 bit
    // input
    .probe0(overflow_tree_adder_5th),
    .probe1(underflow_tree_adder_5th)
    //.probe2(overflow_adder_sub_max),
    //.probe3(underflow_adder_sub_max)

);
*/

`endif  // DEBUG

endmodule
