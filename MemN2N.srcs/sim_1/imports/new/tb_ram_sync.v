//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/18 18:23:25
// Design Name: 
// Module Name: tb_top
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


module tb_ram_sync();   

parameter BW_DATA = `BW_DATA_EMB_W;
parameter BW_ADDR = `BW_DIM_EMB;



parameter DEPTH_RAM = 1 << BW_ADDR;

// input
reg clk;
reg rst_n;
reg [BW_ADDR-1:0] addr;
reg oe;
reg we;
reg oe_syn; // for simulation sync

// inout
wire [BW_DATA-1:0] data;

reg [BW_DATA-1:0] data_in;

//
assign data = (oe_syn==1'b1) ? {BW_DATA{1'bz}} : data_in;

always@(posedge clk)
begin
    oe_syn <= oe;
end


//
ram_sync
#(
    .BW_DATA(BW_DATA),
    .BW_ADDR(BW_ADDR)
)
ram_sync_i
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    .addr(addr),
    .oe(oe),
    .we(we),
    // inout
    .data(data)
);

//

   
always
begin
    #50 clk = ~clk;
end
   
initial
begin
    clk = 1'b0;
    rst_n = 1'b1;
    addr = {BW_ADDR{1'bz}};
    data_in = {BW_DATA{1'bz}};
    oe = 1'b0;
    we = 1'b0;
end


initial
begin
    #30
    oe = 1'b0;
    addr = {BW_ADDR{1'b0}};
    data_in = 'b0000_0000;

   
    // write
    #100
    we = 1'b1;
    addr = 'b0000_0000;
    data_in = 'b0000_0000;
        
    #100
    addr = 'b0000_0001;
    data_in = 'b0000_0001;
    
    #100
    addr = 'b0000_0010;
    data_in = 'b0000_0010;
    
    #100
    addr = 'b0000_0011;
    data_in = 'b0000_0011;
    
    
    // read
    #100
    we = 1'b0;
    oe = 1'b1;
    addr = 'b0000_0000;
    data_in = {BW_DATA{1'bz}};
    
    #100
    addr = 'b0000_0001;

    #100
    addr = 'b0000_0010;

    #100
    addr = 'b0000_0011;
    
    #100
    we = 1'b0;
    oe = 1'b0;
    addr = 'b0000_0000;

end

endmodule
