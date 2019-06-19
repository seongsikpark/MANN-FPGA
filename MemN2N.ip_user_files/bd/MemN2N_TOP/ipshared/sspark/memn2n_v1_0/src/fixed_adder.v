//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/21 09:51:58
// Design Name: 
// Module Name: fixed_adder
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

module fixed_adder
(
    // input
    a,
    b,
    // output
    c
);

parameter WL = 32;
parameter IWL = 8;

// ipnut
input wire [WL-1:0] a;
input wire [WL-1:0] b;

// output
output reg [WL-1:0] c;

// 
wire [WL-1:0] a_2sc;
wire [WL-1:0] b_2sc;

/*
always@(a, b)
begin
    if(a[WL-1] == b[WL-1])
        c <= a+b;
    else
    begin
        if(a[WL-1] > b[WL-1])
        begin
            if(a[WL-2] > b[WL-2])
            begin
                c[WL-1] <= 1'b1;
                c[WL-2:0] <= a[WL-2:0] - b[WL-2:0];
            end
            else
            begin
                c[WL-1] <= 1'b0;
                c[WL-2:0] <= b[WL-2:0] - a[WL-2:0];
            end
        end
        else
        begin
            if(a[WL-2] > b[WL-2])
            begin
                c[WL-1] <= 1'b0;
                c[WL-2:0] <= a[WL-2:0] - b[WL-2:0];
            end
            else
            begin
                c[WL-1] <= 1'b1;
                c[WL-2:0] <= b[WL-2:0] - a[WL-2:0];
            end      
        end
    end
end
*/

assign a_2sc = ~a+1'b1;
assign b_2sc = ~b+1'b1;

always@(a,b)
begin
    if(a[WL-1] == b[WL-1])
        c <= a+b;
    else
    begin
        if( a[WL-1]==1'b1 && b[WL-1]==1'b0 )
        begin
            if( a_2sc > b )
            begin
                c[WL-1] = 1'b1;
                c[WL-2:0] = a_2sc[WL-2:0] - b[WL-2:0];
            end
            else
            begin
                c[WL-1] = 1'b0;
                c[WL-2:0] = b[WL-2:0] - a_2sc[WL-2:0];
            end
        end
        else
        begin
            if( b_2sc > a )
            begin
                c[WL-1] = 1'b1;
                c[WL-2:0] = b_2sc[WL-2:0] - a[WL-2:0];
            end
            else
            begin
                c[WL-1] = 1'b0;
                c[WL-2:0] = a[WL-2:0] - b_2sc[WL-2:0];
            end
        end
    end
end

endmodule
