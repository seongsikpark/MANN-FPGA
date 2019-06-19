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
    c
);

parameter WL = 32;
parameter IWL = 8;

// input
input wire [WL-1:0] a;
input wire [WL-1:0] b;

// output
output wire [WL-1:0] c;


// internal
wire [2*(WL-1)-1:0] result;
wire sign;
wire overflow;

assign result = a[WL-2:0] * b[WL-2:0];
assign sign = a[WL-1]^b[WL-1];

assign c = {sign,result[IWL+2*(WL-IWL-1)-1-:WL-1]};

assign overflow = (result[2*(WL-1)-1:IWL+2*(WL-IWL)] > 'b0) ? 1'b1 : 1'b0;

endmodule
