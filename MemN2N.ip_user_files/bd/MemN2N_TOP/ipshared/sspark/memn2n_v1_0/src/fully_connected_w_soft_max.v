`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/04/18 10:12:18
// Design Name: 
// Module Name: fully_connected_w_soft_max
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

module fully_connected_w_soft_max
(
    // clock
    clk,
    // rst_n
    rst_n,
    // input
    en_init_w,
    en_fwd_path,
    en_bwd_path,
    data_in,
    grad_in,
    // output
    data_out,
    grad_out,
    done_init_w,
    done_fwd_path,
    done_bwd_path
);

//
parameter BW_WL = `BW_WL;
parameter BW_IWL = `BW_IWL;
parameter BW_IWL_EXP = `BW_IWL_EXP;

parameter BW_DIM_IN = `BW_DIM_IN;
//parameter BW_DIM_IN = `BW_WORD_VEC;
parameter BW_DIM_EMB = `BW_DIM_EMB;

parameter DIM_IN = BW_DIM_IN;
parameter DIM_EMB = 1<<BW_DIM_EMB;

parameter BW_DATA = `BW_DATA_EMB_W;
//parameter BW_ADDR = `CLOG2(BW_DIM_IN);        // should make it parameter
//parameter COUNT_VALUE_IN = (1 << BW_COUNTER_IN) - 1;
//parameter BW_COUNTER_IN = `CLOG2(BW_DIM_IN);
//parameter COUNT_VALUE_IN = DIM_IN-1;

parameter BW_ADDR = 7;        // should make it parameterable
parameter BW_COUNTER_IN = 7;
parameter COUNT_VALUE_IN = 127;

parameter BW_MEM_ADDR = `BW_MEM_ADDR;


//
input wire clk;
input wire rst_n;
input wire en_init_w;
input wire en_fwd_path;
input wire en_bwd_path;
input wire [BW_DATA*DIM_EMB-1:0] data_in;
input wire [BW_DATA*DIM_IN-1:0] grad_in; 

output reg [BW_DATA*DIM_IN-1:0] data_out;
output reg [BW_DATA*DIM_EMB-1:0] grad_out;
output wire done_init_w;
output wire done_fwd_path;
output wire done_bwd_path;

// internal
genvar i;

reg en_init_w_sync;
reg en_fwd_path_sync;
reg en_bwd_path_sync;


wire [BW_DATA*DIM_EMB-1:0] data_w;
wire we_w;

wire rst_n_addr_w;
wire en_addr_w;
wire [BW_COUNTER_IN-1:0] count_addr_w;
//reg [BW_COUNTER_IN-1:0] addr_dot_product;
reg [BW_COUNTER_IN-1:0] addr_exp;
reg [BW_COUNTER_IN-1:0] addr_sum_exp;
wire [BW_COUNTER_IN-1:0] addr_dout;
reg [BW_COUNTER_IN-1:0] addr_dout_sm_pre;
reg [BW_COUNTER_IN-1:0] addr_dout_sm;

wire done_addr_w;

wire [BW_DATA*DIM_EMB-1:0] data_init_w;

reg en_dot_product;
reg done_dot_product;
wire _done_dot_product;

//reg [BW_DATA*DIM_IN-1:0] reg_dot_product;
wire [BW_DATA-1:0] reg_dot_product;
reg [BW_DATA*DIM_IN-1:0] reg_exp;

wire [BW_DATA-1:0] din_exp;
wire [BW_DATA-1:0] dout_exp;

reg [BW_DATA-1:0] reg_sum_exp;
wire [BW_DATA-1:0] _reg_sum_exp;

reg _en_exp;
reg en_exp;

reg en_norm_div;

reg done_exp;
reg done_norm_sum;
wire done_div;
wire done_norm_div;

wire [BW_DATA-1:0] div_norm_q;
wire [BW_DATA-1:0] div_norm_f;

wire [BW_DATA-1:0] _data_out;

wire en_addr_w_fwd_path;
wire en_addr_w_div;

wire we_dout;



// combinational logic
assign en_addr_w_fwd_path = en_dot_product;
assign en_addr_w_div = div_din_valid;

assign done_init_w = en_init_w_sync && done_addr_w;

assign rst_n_addr_w = rst_n && (en_init_w_sync || en_fwd_path_sync&&!(done_norm_sum&&!en_norm_div) || en_bwd_path_sync);
//assign en_addr_w = en_init_w_sync || en_fwd_path_sync;  // should add bwd path
assign en_addr_w = en_init_w_sync || en_addr_w_fwd_path || en_addr_w_div;  // should add bwd path

assign data_init_w = `INIT_WEIGHT;

assign data_w = (en_init_w_sync==1'b1) ? data_init_w : 'bz;     // should add bwd path

assign we_w = en_init_w_sync;       // should add bwd path

//assign din_exp = reg_dot_product [(addr_exp+1)*BW_DATA-1-:BW_DATA] >> (BW_IWL_EXP-BW_IWL);
assign din_exp = reg_dot_product >> (BW_IWL_EXP-BW_IWL);

assign done_fwd_path = en_fwd_path_sync && done_norm_div;

assign done_norm_div = en_norm_div && (COUNT_VALUE_IN-1==addr_dout_sm) ? done_div : 1'b0;

assign we_dout = done_div;


// sequential logic
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0||done_init_w==1'b1)
        en_init_w_sync <= 1'b0;
    else 
        if(en_init_w_sync==1'b0)
            en_init_w_sync <= en_init_w;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0||done_fwd_path==1'b1)
        en_fwd_path_sync <= 1'b0;
    else
        if(en_fwd_path_sync==1'b0)
            en_fwd_path_sync <= en_fwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0||done_bwd_path==1'b1)
        en_bwd_path_sync <= 1'b0;
    else
        if(en_bwd_path_sync==1'b0)
            en_bwd_path_sync <= en_bwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_dot_product==1'b1)
        en_dot_product <= 1'b0;
    else
        if(en_dot_product==1'b0)
            //en_dot_product<=en_addr_dout;
            en_dot_product<=en_fwd_path_sync;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_exp <= 1'b0;
    else
        en_exp <= en_dot_product;
end

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_dot_product <= 'b0;
    else
        if(en_fwd_path_sync&&en_dot_product==1'b1)
            reg_dot_product[(addr_dot_product+1)*BW_DATA-1-:BW_DATA] <= _tree_adder_4th;
end
*/

assign reg_dot_product = _tree_adder_4th;

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_dot_product <= 'b0;
    else
        if(en_fwd_path_sync==1'b1 && en_dot_product==1'b1)
            addr_dot_product <= count_addr_w;
end
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_exp <= 'b0;
    else
        if(en_fwd_path_sync==1'b1 && en_exp==1'b1)
            //addr_exp <= addr_dot_product;
            addr_exp <= count_addr_w;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_sum_exp <= 'b0;
    else
        if(en_fwd_path_sync==1'b1 && done_norm_sum==1'b0)
            addr_sum_exp <= addr_exp;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_exp <= 'b0;
    else
        if(en_fwd_path_sync&&en_exp)
            reg_exp[(addr_exp+1)*BW_DATA-1-:BW_DATA] <= dout_exp;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_sum_exp <= 'b0;
    else
        if(en_fwd_path_sync&&en_exp)
            reg_sum_exp <= _reg_sum_exp;
end


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        data_out <= 'b0;
    else
        //if(en_norm_div==1'b1)
        if(we_dout==1'b1)
            data_out[(addr_dout_sm+1)*BW_DATA-1-:BW_DATA] <= _data_out;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_dout_sm_pre <= 'b0;
    else
        if(en_norm_div==1'b1 && en_addr_w == 1'b1)
            addr_dout_sm_pre <= addr_dout;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_dout_sm <= 'b0;
    else
        if(en_norm_div==1'b1)
            addr_dout_sm <= addr_dout_sm_pre;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || en_fwd_path_sync==1'b0)
    if(rst_n==1'b0 || done_norm_div==1'b1)
        done_dot_product <= 'b0;
    else
        if(en_fwd_path_sync==1'b1&&done_dot_product==1'b0)
            //done_dot_product <= done_addr_w;
            done_dot_product <= _done_dot_product;
end

assign _done_dot_product = (COUNT_VALUE_IN-1==count_addr_w) ? 1'b1 : 1'b0;

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || en_fwd_path_sync==1'b0)
    if(rst_n==1'b0 || done_norm_div==1'b1)
        done_exp <= 'b0;
    else
        if(en_fwd_path_sync==1'b1)
            done_exp <= done_dot_product;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_norm_div==1'b1)
        done_norm_sum <= 'b0;
    else
        done_norm_sum <= done_exp;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_norm_div==1'b1)
        en_norm_div <= 1'b0;
    else
        if(en_fwd_path_sync==1'b1)
            en_norm_div <= done_norm_sum;
end



// instance
//
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : weight
        ram_sync
        #(
            .BW_DATA(BW_DATA),
            .BW_ADDR(BW_ADDR)
        )
        weight
        (
            // clk
            .clk(clk),
            // reset_n
            .rst_n(rst_n),
            // input
            .addr(count_addr_w),
            .oe(!we_w),
            .we(we_w),      
            // inout
            .data(data_w[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate


//
counter
#(
    .BW(BW_COUNTER_IN),
    .COUNT_VALUE(COUNT_VALUE_IN)
)
addr_w
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_addr_w),
    // input
    .en(en_addr_w),
    // output
    .count(count_addr_w),
    .done(done_addr_w)
);

wire [BW_DATA*DIM_EMB-1:0] _reg_mult;

wire [BW_DATA*DIM_EMB/2-1:0] _tree_adder_1st;
wire [BW_DATA*DIM_EMB/4-1:0] _tree_adder_2nd;
wire [BW_DATA*DIM_EMB/8-1:0] _tree_adder_3rd;
wire [BW_DATA*DIM_EMB/16-1:0] _tree_adder_4th;

// multiplier
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : multiplier 
        fixed_mult
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_multiplier
        (
            .a(data_w[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(data_in[(i+1)*BW_DATA-1-:BW_DATA]),
            .c(_reg_mult[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

// tree adder
generate
    for(i=0;i<DIM_EMB;i=i+2)
    begin : tree_adder_1st_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_1st_stage
        (
            .a(_reg_mult[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(_reg_mult[(i+2)*BW_DATA-1-:BW_DATA]),
            .c(_tree_adder_1st[(i/2+1)*BW_DATA-1-:BW_DATA])
        );
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
            .a(_tree_adder_1st[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(_tree_adder_1st[(i+2)*BW_DATA-1-:BW_DATA]),
            .c(_tree_adder_2nd[(i/2+1)*BW_DATA-1-:BW_DATA])
        );
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
            .a(_tree_adder_2nd[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(_tree_adder_2nd[(i+2)*BW_DATA-1-:BW_DATA]),
            .c(_tree_adder_3rd[(i/2+1)*BW_DATA-1-:BW_DATA])
        );
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
            .a(_tree_adder_3rd[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(_tree_adder_3rd[(i+2)*BW_DATA-1-:BW_DATA]),
            .c(_tree_adder_4th[(i/2+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

//
exp_fixed
#
(
    .BW_WL(BW_WL),
    .BW_IWL(BW_IWL_EXP)
)
exp
(
    .din(din_exp),
    .dout(dout_exp)
);


fixed_adder
#(
    .WL(BW_WL),
    .IWL(BW_IWL_EXP)
)
accu_exp
(
    .a(reg_sum_exp),
    .b(dout_exp),
    .c(_reg_sum_exp)
);

wire div_din_valid;
wire div_din_tready;
wire en_addr_dout_div;

assign en_addr_dout_div = div_din_valid;



//assign div_din_valid = (count_addr_mem-1==addr_dout_attention) ? 1'b0 : en_norm_div&&div_din_ready;
assign div_din_valid = (COUNT_VALUE_IN-1==addr_dout_sm) ? 1'b0 : en_norm_div&&div_din_ready;



assign addr_dout = (en_norm_div==1'b1)? count_addr_w : 'b0;

div_32
div_32_norm
(
    .aclk(clk),
    .s_axis_dividend_tvalid(div_din_valid),
    .s_axis_dividend_tready(div_din_ready),
    .s_axis_dividend_tdata(reg_exp[(addr_dout+1)*BW_DATA-1-:BW_DATA]),
    //.s_axis_dividend_tdata(reg_exp[(i+1)*BW_DATA-1-:BW_DATA]),
    .s_axis_divisor_tvalid(en_norm_div),
    .s_axis_divisor_tready(),
    .s_axis_divisor_tdata(reg_sum_exp),
    .m_axis_dout_tvalid(done_div),
    .m_axis_dout_tdata({div_norm_q, div_norm_f})
);

assign _data_out = {div_norm_q[BW_DATA-1], div_norm_q[BW_IWL-:BW_IWL], div_norm_f[BW_DATA-1-:(BW_WL-BW_IWL-1)]};



endmodule
