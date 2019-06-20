//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/04/13 13:04:38
// Design Name: 
// Module Name: exp_fixed
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

module exp_fixed
(
    clk,
    rst_n,
    din,
    dout
);

parameter BW_WL = `BW_WL;
parameter BW_IWL = `BW_IWL;
parameter NUM_EXP_PWLA = `NUM_EXP_PWLA;


genvar i;
//
input wire clk;
input wire rst_n;
input wire [BW_WL-1:0] din;

output wire [BW_WL-1:0] dout;

//
wire [BW_WL*NUM_EXP_PWLA-1:0] _const_a;
wire [BW_WL*NUM_EXP_PWLA-1:0] _const_b;
wire [BW_WL*NUM_EXP_PWLA-1:0] const_a;
wire [BW_WL*NUM_EXP_PWLA-1:0] const_b;
//wire [BW_WL*NUM_EXP_PWLA-1:0] _mult;
wire [BW_WL-1:0] _mult [NUM_EXP_PWLA-1:0];
reg [BW_WL-1:0] mult [NUM_EXP_PWLA-1:0];
//wire [BW_WL*NUM_EXP_PWLA-1:0] pwla;
wire [BW_WL-1:0] _pwla [NUM_EXP_PWLA-1:0];
reg [BW_WL-1:0] pwla [NUM_EXP_PWLA-1:0];

/*
wire [BW_WL-1:0] const_a [0:NUM_EXP_PWLA-1];
wire [BW_WL-1:0] const_b [0:NUM_EXP_PWLA-1];
wire [BW_WL-1:0] mult [0:NUM_EXP_PWLA-1];
*/

wire [BW_WL-1:0] pwla_debug [NUM_EXP_PWLA-1:0];
wire [BW_WL-1:0] const_a_debug [NUM_EXP_PWLA-1:0];
wire [BW_WL-1:0] const_b_debug [NUM_EXP_PWLA-1:0];

wire [BW_WL-1:0] _const_a_debug [NUM_EXP_PWLA-1:0];
wire [BW_WL-1:0] _const_b_debug [NUM_EXP_PWLA-1:0];

//
assign _const_a = `CONST_EXP_A;
assign _const_b = `CONST_EXP_B;

generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : shift_const
        assign const_a[(i+1)*BW_WL-1-:BW_WL] = _const_a[(i+1)*BW_WL-1-:BW_WL];
        assign const_b[(i+1)*BW_WL-1-:BW_WL] = _const_b[(i+1)*BW_WL-1-:BW_WL];
    end
endgenerate



//
generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : multiplier 
        fixed_mult
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_multiplier
        (
            .a(din),
            .b(const_a[(i+1)*BW_WL-1-:BW_WL]),
            .c(_mult[i]),
            .overflow(),
            .underflow()
        );
    end
endgenerate


generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                mult[i] <= {BW_WL{1'b0}};
            else
                mult[i] <= _mult[i];
        end
    end
endgenerate

generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : adder
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_adder_to_pwla
        (
            .a(mult[i]),
            .b(const_b[(i+1)*BW_WL-1-:BW_WL]),
            .c(_pwla[i]),
            .overflow(),
            .underflow()
        );
    end
endgenerate

generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                pwla[i] <= {BW_WL{1'b0}};
            else
                pwla[i] <= _pwla[i];
        end
    end
endgenerate




generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : p_debug
        //assign pwla_debug[i] = pwla[(i+1)*BW_WL-1-:BW_WL];
        assign pwla_debug[i] = pwla[i];
    end
endgenerate


generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : a_debug
        assign const_a_debug[i] = const_a[(i+1)*BW_WL-1-:BW_WL];
    end
endgenerate

generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : b_debug
        assign const_b_debug[i] = const_b[(i+1)*BW_WL-1-:BW_WL];
    end
endgenerate

generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : _a_debug
        assign _const_a_debug[i] = _const_a[(i+1)*BW_WL-1-:BW_WL];
    end
endgenerate

generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : _b_debug
        assign _const_b_debug[i] = _const_b[(i+1)*BW_WL-1-:BW_WL];
    end
endgenerate


wire [BW_WL-1:0] max;

wire [BW_WL-1:0] max_1;
wire [BW_WL-1:0] max_2;

wire [BW_WL-1:0] max_3;
wire [BW_WL-1:0] max_4;
wire [BW_WL-1:0] max_5;
wire [BW_WL-1:0] max_6;

wire [BW_WL-1:0] max_7;
wire [BW_WL-1:0] max_8;
wire [BW_WL-1:0] max_9;
wire [BW_WL-1:0] max_10;
wire [BW_WL-1:0] max_11;
wire [BW_WL-1:0] max_12;
wire [BW_WL-1:0] max_13;
wire [BW_WL-1:0] max_14;


assign max_7 = ($signed(pwla_debug[0]) > $signed(pwla_debug[1]))? pwla_debug[0]:pwla_debug[1];
assign max_8 = ($signed(pwla_debug[2]) > $signed(pwla_debug[3]))? pwla_debug[2]:pwla_debug[3];
assign max_9 = ($signed(pwla_debug[4]) > $signed(pwla_debug[5]))? pwla_debug[4]:pwla_debug[5];
assign max_10 = ($signed(pwla_debug[6]) > $signed(pwla_debug[7]))? pwla_debug[6]:pwla_debug[7];
assign max_11 = ($signed(pwla_debug[8]) > $signed(pwla_debug[9]))? pwla_debug[8]:pwla_debug[9];
assign max_12 = ($signed(pwla_debug[10]) > $signed(pwla_debug[11]))? pwla_debug[10]:pwla_debug[11];
assign max_13 = ($signed(pwla_debug[12]) > $signed(pwla_debug[13]))? pwla_debug[12]:pwla_debug[13];
assign max_14 = ($signed(pwla_debug[14]) > $signed(pwla_debug[15]))? pwla_debug[14]:pwla_debug[15];

assign max_3 = ($signed(max_7) > $signed(max_8))? max_7:max_8;
assign max_4 = ($signed(max_9) > $signed(max_10))? max_9:max_10;
assign max_5 = ($signed(max_11) > $signed(max_12))? max_11:max_12;
assign max_6 = ($signed(max_13) > $signed(max_14))? max_13:max_14;

assign max_1 = ($signed(max_3) > $signed(max_4))? max_3:max_4;
assign max_2 = ($signed(max_5) > $signed(max_6))? max_5:max_6;

assign max = ($signed(max_1) > $signed(max_2))? max_1:max_2;

assign dout = max;


endmodule
