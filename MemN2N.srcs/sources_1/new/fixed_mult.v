//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/02/05 09:58:26
// Design Name: 
// Module Name: fixed_mult
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

module fixed_mult
(
    // input
    a,
    b,
    // output
    c,
    overflow,
    underflow
);

parameter WL = 32;
parameter IWL = 7;

// input
input wire signed [WL-1:0] a;
input wire signed [WL-1:0] b;

// output
output wire signed [WL-1:0] c;
output wire overflow;
output wire underflow;

assign overflow = 1'b0;
assign underflow = 1'b0;

// internal
//wire signed [2*WL-1:0] ext_a;
//wire signed [2*WL-1:0] ext_b;
//wire signed [2*WL-1:0] ext_result;
wire signed [2*WL-1:0] result;

/*
wire [2*(WL-1)-1:0] result;
wire sign;
wire overflow;

assign result = a[WL-2:0] * b[WL-2:0];
assign sign = a[WL-1]^b[WL-1];

assign c = {sign,result[IWL+2*(WL-IWL-1)-1-:WL-1]};

assign overflow = (result[2*(WL-1)-1:IWL+2*(WL-IWL)] > 'b0) ? 1'b1 : 1'b0;

*/

//assign ext_a = $signed(a);
//assign ext_b = $signed(b);

//assign ext_result = ext_a*ext_b;

assign result = a*b;

//assign c = result[IWL+1+2*(WL-IWL-1)-1-:WL];
assign c = {result[2*WL-1],result[IWL+2*(WL-IWL-1)-1-:(WL-1)]};

endmodule
