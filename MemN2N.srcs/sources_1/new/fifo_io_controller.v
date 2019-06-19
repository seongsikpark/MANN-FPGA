//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/22 11:35:32
// Design Name: 
// Module Name: fifo_io_controller
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

module fifo_io_controller
(
    // input
    clk,
    rst,
    fifo_in_rst,
    fifo_out_rst,
    done_init_memory_network,
    rb_n_memory_network,
    en_memory_network,
    empty_fifo_in,
    valid_fifo_in,
    done_memory_network,
    // output
    rst_fifo_in,
    rst_fifo_out,
    re_fifo_in,
    we_fifo_out
);

////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// input
input wire clk;
input wire rst;
input wire fifo_in_rst;
input wire fifo_out_rst;
input wire done_init_memory_network;
input wire rb_n_memory_network;
input wire en_memory_network;
input wire empty_fifo_in;
input wire valid_fifo_in;
input wire done_memory_network;
// output
output reg rst_fifo_in;
output reg rst_fifo_out; 
output reg re_fifo_in;
output reg we_fifo_out;

////////////////////////////////////////////////////////////
// internals
////////////////////////////////////////////////////////////
wire _reg_re_fifo_in_1;
reg reg_re_fifo_in_1;
reg reg_re_fifo_in_2;

// output
wire _rst_fifo_in;
wire _rst_fifo_out; 
wire _re_fifo_in;
wire _we_fifo_out;

////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
assign _rst_fifo_in = fifo_in_rst;
assign _rst_fifo_out = fifo_out_rst;

assign _reg_re_fifo_in_1 = done_init_memory_network&&rb_n_memory_network&&!en_memory_network&&!empty_fifo_in&&!valid_fifo_in;
assign _re_fifo_in = reg_re_fifo_in_1&&!reg_re_fifo_in_2;
//assign re_fifo_in = _re_fifo_in;    // output reg exception

assign _we_fifo_out = done_memory_network;


////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////

always@(posedge clk or posedge rst)
begin
    if(rst==1'b1)
        rst_fifo_in <= 1'b0;
    else
        rst_fifo_in <= _rst_fifo_in;
end

always@(posedge clk or posedge rst)
begin
    if(rst==1'b1)
        rst_fifo_out <= 1'b0;
    else
        rst_fifo_out <= _rst_fifo_out;
end

always@(posedge clk or posedge rst)
begin
    if(rst==1'b1)
        reg_re_fifo_in_1 <= 1'b0;
    else
        reg_re_fifo_in_1 <= _reg_re_fifo_in_1;
end

always@(posedge clk or posedge rst)
begin
    if(rst==1'b1)
        reg_re_fifo_in_2 <= 1'b0;
    else
        reg_re_fifo_in_2 <= reg_re_fifo_in_1;
end

always@(posedge clk or posedge rst)
begin
    if(rst==1'b1)
        re_fifo_in <= 1'b0;
    else
        re_fifo_in <= _re_fifo_in;
end

always@(posedge clk or posedge rst)
begin
    if(rst==1'b1)
        we_fifo_out <= 1'b0;
    else
        we_fifo_out <= _we_fifo_out;
end


endmodule
