//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/21 10:10:45
// Design Name: 
// Module Name: tb_fixed_adder
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


module tb_fixed_adder();   

parameter WL = 32;
parameter IWL = 8;

// ipnut
reg [WL-1:0] a;
reg [WL-1:0] b;

// output
wire [WL-1:0] c;


//


//
fixed_adder
#(
    .WL(WL),
    .IWL(IWL)
)
fixed_adder_i 
(
    // input
    .a(a),
    .b(b),
    // output
    .c(c)
);




//
initial
begin
    a = 'b0;
    b = 'b0;
end


initial
begin
    #30
   
    // 
    #100
    a = 'b0_00000001_10000000000000000000000;
    b = 'b0_00000010_01000000000000000000000;


end


endmodule

