//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/12 11:59:06
// Design Name: 
// Module Name: w_init
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

module w_init
(
    // clock
    clk,
    // rst_n
    rst_n,
    // input
    en_w_init,
    data_in,
    addr_in,

    // output
    en_w_init_emb_a,
    en_w_init_emb_c,
    en_w_init_emb_q,
    en_w_init_fc,
    en_w_init_fc_w_sm,
    data_out,
    addr_out

    // debug
);

////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter BW_DATA_IN = `BW_DATA_IN;
parameter BW_DATA = `BW_DATA;
parameter NUM_W_MODULE = `NUM_W_MODULE;
parameter BW_DIM_EMB = `BW_DIM_EMB;
parameter DIM_EMB = `DIM_EMB;
parameter BW_ADDR_W_INIT_SEL_MODULE = `BW_ADDR_W_INIT_SEL_MODULE;
parameter BW_ADDR_W_INIT = `BW_ADDR_W_INIT;

////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clk
input wire clk;
// rst_n
input wire rst_n;
// input
input wire en_w_init;
input wire [BW_DATA*DIM_EMB-1:0] data_in;
input wire [BW_DATA_IN-1:0] addr_in;

// output
output reg en_w_init_emb_a;
output reg en_w_init_emb_c;
output reg en_w_init_emb_q;
output reg en_w_init_fc;
output reg en_w_init_fc_w_sm;

output reg [BW_DATA*DIM_EMB-1:0] data_out;
output reg [BW_ADDR_W_INIT-1:0] addr_out;

////////////////////////////////////////////////////////////
// internal signals
////////////////////////////////////////////////////////////
wire [BW_ADDR_W_INIT_SEL_MODULE-1:0] w_init_sel_module;

wire _en_w_init_emb_a;
wire _en_w_init_emb_c;
wire _en_w_init_emb_q;
wire _en_w_init_fc;
wire _en_w_init_fc_w_sm;


////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
assign w_init_sel_module = addr_in[`RANGE_ADDR_W_INIT_SEL_MODULE];

assign _en_w_init_emb_a     = (w_init_sel_module==4'b0000)? 1'b1:1'b0;
assign _en_w_init_emb_c     = (w_init_sel_module==4'b0001)? 1'b1:1'b0;
assign _en_w_init_emb_q     = (w_init_sel_module==4'b0010)? 1'b1:1'b0;
assign _en_w_init_fc        = (w_init_sel_module==4'b0011)? 1'b1:1'b0;
assign _en_w_init_fc_w_sm   = (w_init_sel_module==4'b0100)? 1'b1:1'b0;


////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        data_out <= {(BW_DATA*DIM_EMB){1'b0}};
    else
        if(en_w_init==1'b1)
            data_out <= data_in;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_out <= {BW_ADDR_W_INIT{1'b0}};
    else
        if(en_w_init==1'b1)
            addr_out <= addr_in[`RANGE_ADDR_W_INIT];
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_init_emb_a <= 1'b0;
    else
        //if(en_w_init_emb_a==1'b1)
        //    en_w_init_emb_a <= 1'b0;
        //else 
        if((en_w_init==1'b1)&&(en_w_init_emb_a==1'b0))
            en_w_init_emb_a <= _en_w_init_emb_a;
        else
            en_w_init_emb_a <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_init_emb_c <= 1'b0;
    else
        //if(en_w_init_emb_c==1'b1)
        //    en_w_init_emb_c <= 1'b0;
        //else

        if((en_w_init==1'b1)&&(en_w_init_emb_c==1'b0))
            en_w_init_emb_c <= _en_w_init_emb_c;
        else
            en_w_init_emb_c <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_init_emb_q <= 1'b0;
    else
        //if(en_w_init_emb_q==1'b1)
        //    en_w_init_emb_q <= 1'b0;
        //else

        if((en_w_init==1'b1)&&(en_w_init_emb_q==1'b0))
            en_w_init_emb_q <= _en_w_init_emb_q;
        else
            en_w_init_emb_q <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_init_fc <= 1'b0;
    else
        if((en_w_init==1'b1)&&(en_w_init_fc==1'b0))
            en_w_init_fc <= _en_w_init_fc;
        else
            en_w_init_fc <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_init_fc_w_sm <= 1'b0;
    else
        //if(en_w_init_fc_w_sm==1'b1)
        //    en_w_init_fc_w_sm <= 1'b0;
        if((en_w_init==1'b1)&&(en_w_init_fc_w_sm==1'b0))
            en_w_init_fc_w_sm <= _en_w_init_fc_w_sm;
        else
            en_w_init_fc_w_sm <= 1'b0;
end





////////////////////////////////////////////////////////////
// instance
////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
// debug
////////////////////////////////////////////////////////////
`ifdef DEBUG
`ifdef DEBUG_ILA
// ila
ila
w_init
(
    .clk(clk),

    // 1 bit
    .probe0(en_w_init),
    .probe1(en_w_init_emb_a),
    .probe2(en_w_init_emb_c),
    .probe3(en_w_init_emb_q),
    .probe4(en_w_init_fc),
    .probe5(en_w_init_fc_w_sm),
    .probe6(_en_w_init_emb_a),
    .probe7(_en_w_init_emb_c),

    // 1 bit
    .probe8(_en_w_init_emb_q),
    .probe9(_en_w_init_fc),
    .probe10(_en_w_init_fc_w_sm),
    .probe11(),
    .probe12(),
    .probe13(),
    .probe14(),
    .probe15(),

    // 16 bit
    .probe16(addr_out),
    .probe17(addr_in),
    .probe18(w_init_sel_module),
    .probe19(),
    .probe20(),
    .probe21(),
    .probe22(),
    .probe23(),

    // 32 bit
    .probe24(data_in[BW_DATA*(0+1)-1-:32]),
    .probe25(data_in[BW_DATA*(1+1)-1-:32]),
    .probe26(data_in[BW_DATA*DIM_EMB-1-:32]),
    .probe27(data_out[BW_DATA*(0+1)-1-:32]),
    .probe28(data_out[BW_DATA*(1+1)-1-:32]),
    .probe29(data_out[BW_DATA*DIM_EMB-1-:32]),
    .probe30(),
    .probe31(),

    // 1 bit
    .probe32(),
    .probe33(),
    .probe34(),
    .probe35(),
    .probe36(),
    .probe37(),
    .probe38(),
    .probe39(),

    // 1 bit
    .probe40(),
    .probe41(),
    .probe42(),
    .probe43(),
    .probe44(),
    .probe45(),
    .probe46(),
    .probe47(),

    // 1 bit
    .probe48(),
    .probe49(),
    .probe50(),
    .probe51(),
    .probe52(),
    .probe53(),
    .probe54(),
    .probe55(),

    // 1 bit
    .probe56(),
    .probe57(),
    .probe58(),
    .probe59(),
    .probe60(),
    .probe61(),
    .probe62(),
    .probe63()
);
`endif  // DEBUG_ILA
`endif




endmodule
