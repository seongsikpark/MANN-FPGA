//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/21 10:39:15
// Design Name: 
// Module Name: tb_counter
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

module tb_counter();

parameter BW = 10;
parameter COUNT_VALUE = 'b0001_0000;

// clk
reg clk;
// reset_n
reg rst_n;
// input
reg en;
// output
wire done;
wire [BW-1:0] count;
//


//
counter
#(
    .BW(BW),
    .COUNT_VALUE(COUNT_VALUE)
)
counter_i 
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    .en(en),
    // output
    .count(count),
    .done(done)
);

//
always
begin
    #50 clk = ~clk;
end

//
initial
begin
    clk = 1'b0;
    rst_n = 1'b1;
end


initial
begin
    #30
    rst_n = 1'b0;
    
    #100
    rst_n = 1'b1;
    
    #100
    en = 1'b1;
    
    #2000
    en = 1'b0;
   



end


endmodule


