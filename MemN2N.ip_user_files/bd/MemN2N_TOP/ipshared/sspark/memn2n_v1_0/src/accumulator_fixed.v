//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/04/17 19:23:26
// Design Name: 
// Module Name: accumulator_fixed
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

module accumulator_fixed
(
    // clock
    clk,
    // rst_n
    rst_n,
    // input
    enable,
    din_a,
    din_b,
    // output
    dout
);

//
parameter BW_DATA = `BW_DATA;
parameter DIM_EMB = 1<<`BW_DIM_EMB;
parameter BW_WL = `BW_WL;
parameter BW_IWL = `BW_IWL;


//
input wire clk;
input wire rst_n;

input wire enable;
input wire [BW_DATA*DIM_EMB-1:0] din_a;
input wire [BW_DATA*DIM_EMB-1:0] din_b;

output reg [BW_DATA*DIM_EMB-1:0] dout;

//
genvar i;

wire [BW_DATA*DIM_EMB-1:0] _mult;
wire [BW_DATA*DIM_EMB-1:0] _dout;

//
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        dout <= 'b0;
    else
        if(enable==1'b1)
            dout <= _dout;
end

//
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : multiplier 
        fixed_mult
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_multiplier
        (
            .a(din_a[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(din_b[(i+1)*BW_DATA-1-:BW_DATA]),
            .c(_mult[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : adder
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_accum
        (
            .a(dout[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(_mult[(i+1)*BW_DATA-1-:BW_DATA]),
            .c(_dout[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate


endmodule
