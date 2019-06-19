//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/27 13:07:53
// Design Name: 
// Module Name: io_top
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

module io_top
(
    // clk
    clk,
    // input
    rst_sys,
    en_init_sys,
    // output
    rst,
    rst_n,
    en_init
);

////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
input wire clk;

input wire rst_sys;
input wire en_init_sys;

//output reg rst;
//output reg rst_n;
output wire rst;
output wire rst_n;
output reg en_init;



////////////////////////////////////////////////////////////
// internals
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////


/*
always@(posedge clk)
begin
    rst <= rst_sys;
end

always@(posedge clk)
begin
    rst_n <= !rst_sys;
end
*/

assign rst = rst_sys;
assign rst_n = !rst_sys;


always@(posedge clk)
begin
    en_init <= en_init_sys;
end



endmodule