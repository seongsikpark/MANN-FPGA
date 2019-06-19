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

`define BW_WL 32

`define BW_IWL_EXP 27
`define NUM_EXP_PWLA 5          // exp(x) = max(Ax+b)
`define CONST_EXP_A_1 0
`define CONST_EXP_A_2 6
`define CONST_EXP_A_3 40
`define CONST_EXP_A_4 421
`define CONST_EXP_A_5 5340

`define CONST_EXP_B_1 0
`define CONST_EXP_B_2 -3
`define CONST_EXP_B_3 -95
`define CONST_EXP_B_4 -1958
`define CONST_EXP_B_5 -38234

`define CONST_EXP_A {0, 6, 40, 421, 5340}
`define CONST_EXP_B {0, -3, -95, -1958, -38234}

module exp_fixed
(
    din,
    dout
);

parameter BW_WL = `BW_WL;
parameter BW_IWL = `BW_IWL_EXP;
parameter NUM_EXP_PWLA = `NUM_EXP_PWLA;


genvar i;
//
input wire [BW_WL-1:0] din;

output wire [BW_WL-1:0] dout;

//
wire [BW_WL*NUM_EXP_PWLA-1:0] _const_a;
wire [BW_WL*NUM_EXP_PWLA-1:0] _const_b;
wire [BW_WL*NUM_EXP_PWLA-1:0] const_a;
wire [BW_WL*NUM_EXP_PWLA-1:0] const_b;
wire [BW_WL*NUM_EXP_PWLA-1:0] mult;
wire [BW_WL*NUM_EXP_PWLA-1:0] pwla;

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

wire [BW_WL-1:0] mult_debug [NUM_EXP_PWLA-1:0];

//
assign _const_a = `CONST_EXP_A;
assign _const_b = `CONST_EXP_B;

generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : shift_const
        assign const_a[(i+1)*BW_WL-1-:BW_WL] = _const_a[(i+1)*BW_WL-1-:BW_WL]<<(BW_WL-BW_IWL-1);
        assign const_b[(i+1)*BW_WL-1-:BW_WL] = _const_b[(i+1)*BW_WL-1-:BW_WL]<<(BW_WL-BW_IWL-1);
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
            .c(mult[(i+1)*BW_WL-1-:BW_WL])
        );
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
            .a(mult[(i+1)*BW_WL-1-:BW_WL]),
            .b(const_b[(i+1)*BW_WL-1-:BW_WL]),
            .c(pwla[(i+1)*BW_WL-1-:BW_WL])
        );
    end
endgenerate

generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : p_debug
        assign pwla_debug[i] = pwla[(i+1)*BW_WL-1-:BW_WL];
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

generate
    for(i=0;i<NUM_EXP_PWLA;i=i+1)
    begin : m_debug
        assign mult_debug[i] = mult[(i+1)*BW_WL-1-:BW_WL];
    end
endgenerate





wire [BW_WL-1:0] max_1;
wire [BW_WL-1:0] max_2;
wire [BW_WL-1:0] max_3;
wire [BW_WL-1:0] max;


assign max_1 = ($signed(pwla_debug[0]) > $signed(pwla_debug[1]))? pwla_debug[0]:pwla_debug[1];
assign max_2 = ($signed(pwla_debug[2]) > $signed(pwla_debug[3]))? pwla_debug[2]:pwla_debug[3];
assign max_3 = ($signed(max_1) > $signed(max_2))? max_1:max_2;

assign max = ($signed(pwla_debug[4]) > $signed(max_3))? pwla_debug[4]:max_3;

assign dout = max;





endmodule
