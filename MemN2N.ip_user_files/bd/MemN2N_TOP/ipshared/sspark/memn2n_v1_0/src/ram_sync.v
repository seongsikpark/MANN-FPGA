//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/20 13:09:19
// Design Name: 
// Module Name: ram_sync
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

module ram_sync
(
    // clk
    clk,
    // reset_n
    rst_n,
    // input
    addr,
    oe,
    we,
    // inout
    data
);

parameter BW_DATA = 8;
parameter BW_ADDR = 8;
parameter DEPTH_RAM = 1 << BW_ADDR;

  
// input
input wire clk;
input wire rst_n;
input wire [BW_ADDR-1:0] addr;
input wire oe;
input wire we;

// inout
inout wire [BW_DATA-1:0] data;

// internal
reg [BW_DATA-1:0] data_out;
reg [BW_DATA-1:0] mem [0:DEPTH_RAM-1];
//reg we_syn;
//reg oe_syn;

// code
// write & read
always@(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
    begin
        //we_syn <= 1'b0;
        //oe_syn <= 1'b0;
    end
    else
    begin
        if(we==1'b1) 
        begin
            mem[addr] <= data;
        end
        else
        begin
            if(oe==1'b1)
            begin
                data_out <= mem[addr];   
            end
        end
        
        //we_syn <= we;
        //oe_syn <= oe; 
    end
end


//assign data = (oe_syn && !we_syn) ? data_out : {BW_DATA{1'bz}};
assign data = (oe && !we) ? data_out : {BW_DATA{1'bz}};

    
endmodule
