//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/21 10:25:29
// Design Name: 
// Module Name: counter
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

module counter
(
    // clk
    clk,
    // reset_n
    rst_n,
    // input
    en,
    en_hold_max,
    // output
    count,
    done
);

parameter BW = 8;
parameter COUNT_VALUE = 'b0000_1000;

// clk
input wire clk;
// reset_n
input wire rst_n;
// input
input wire en;
input wire en_hold_max;
// output
output reg done;
output reg [BW-1:0] count;


/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0 || (done == 1'b1)&&(en_hold_max==1'b0) )
    //if(rst_n == 1'b0)
    begin
        count <= 'b0;
        done <= 1'b0;
    end
    else
    begin
        if(en == 1'b1)
        begin
            begin
                if(count == COUNT_VALUE)
                begin
                    done <= 1'b1;
                end
                else
                begin
                    count <= count + 1'b1;        
                end
            end
        end
    end
end
*/


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        count <= {BW{1'b0}};
    else
        if( en&&!((done==1'b1)&&(en_hold_max==1'b1)) )
            count <= count + 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done <= 1'b0;
    else
        if(count==COUNT_VALUE)
            done <= 1'b1;
        else
            done <= 1'b0;
end






endmodule
