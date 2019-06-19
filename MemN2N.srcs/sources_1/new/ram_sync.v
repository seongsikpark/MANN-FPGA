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
    data_in,
    // output
    data_out
);

parameter BW_DATA = 8;
parameter BW_ADDR = 8;
parameter DEPTH_RAM = 1 << BW_ADDR;
parameter INIT_FILE = "";

  
// input
input wire clk;
input wire rst_n;
input wire [BW_ADDR-1:0] addr;
input wire oe;
input wire we;
input wire [BW_DATA-1:0] data_in;

// output
output reg [BW_DATA-1:0] data_out;

// internal
genvar i;

//wire [BW_DATA-1:0] _data_out;
reg [BW_DATA-1:0] mem [0:DEPTH_RAM-1];


/*
generate
    for(i=0;i<DEPTH_RAM;i=i+1)
    begin : ram_op
        //always@(posedge clk or negedge rst_n)
        always@(posedge clk)
        begin
            if(rst_n == 1'b0)
            begin
                mem[i] <= {BW_DATA{1'b0}};
                data_out <= {BW_DATA{1'b0}};
            end
            else
            begin
                if(we==1'b1) 
                begin
                    if(addr==i)
                        mem[addr] <= data;
                end
                else
                begin
                    if(oe==1'b1)
                    begin
                        //if(addr==i)
                        //    data_out <= mem[addr];   
                        //else
                        //    data_out <= {BW_DATA{1'bz}};   
                        data_out <= _data_out;
                    end
                end
            end
        end
    end
endgenerate

generate
    for(i=0;i<DEPTH_RAM;i=i+1)
    begin : assign__data_out
        assign _data_out = (addr==i) ? mem[addr] : {BW_DATA{1'bz}};
    end
endgenerate
*/

// initial 
generate
    if(INIT_FILE != "")
    begin : init_w_file
        initial
        begin
            $readmemh(INIT_FILE,mem,0,DEPTH_RAM-1);
        end
    end
    else
    begin : init_zero
        for(i=0;i<DEPTH_RAM;i=i+1)
        begin
            initial
            begin
                mem[i] <= {BW_DATA{1'b0}};
            end
        end
    end
endgenerate

/*
always@(posedge clk)
begin
    if(rst_n == 1'b0)
    begin
        data_out <= {BW_DATA{1'b0}};
    end
    else
    begin
        if(we==1'b1) 
            mem[addr] <= data;
        else
        begin
            if(oe==1'b1)
                data_out <= mem[addr];   
        end
    end
end
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        data_out <= {BW_DATA{1'b0}};
    else
        if(oe==1'b1)
            data_out <= mem[addr];
end

always@(posedge clk)
begin
    if(we==1'b1)
        mem[addr] <= data_in;
end

//assign data = (oe && !we) ? data_out : {BW_DATA{1'bz}};

    
endmodule
