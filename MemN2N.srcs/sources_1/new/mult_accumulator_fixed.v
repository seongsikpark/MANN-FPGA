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

module mult_accumulator_fixed
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

output wire [BW_DATA*DIM_EMB-1:0] dout;

//
genvar i;

reg [BW_DATA-1:0] reg_accu [0:DIM_EMB-1];

wire [BW_DATA-1:0] _mult [0:DIM_EMB-1];
reg [BW_DATA-1:0] mult [0:DIM_EMB-1];

wire [BW_DATA-1:0] _reg_accu [0:DIM_EMB-1];

wire [BW_DATA-1:0] _din_a [0:DIM_EMB-1];
wire [BW_DATA-1:0] _din_b [0:DIM_EMB-1];

reg en_latch;

//
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign__din_a
        //assign _din_a[i] = (enable==1'b1)? din_a[(i+1)*BW_DATA-1-:BW_DATA] : {BW_DATA{1'b0}};
        assign _din_a[i] = din_a[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign__din_b
        //assign _din_b[i] = (enable==1'b1)? din_b[(i+1)*BW_DATA-1-:BW_DATA] : {BW_DATA{1'b0}};
        assign _din_b[i] = din_b[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

//
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_latch <= 1'b0;
    else
        en_latch <= enable;
end

//
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_reg_accu
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                reg_accu[i] <= {BW_DATA{1'b0}};
            else
                //if(enable==1'b1)
                if(en_latch==1'b1)
                    reg_accu[i] <= _reg_accu[i];
        end
    end
endgenerate

//
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_dout
        assign dout[(i+1)*BW_DATA-1-:BW_DATA] = reg_accu[i];
    end
endgenerate

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
            .a(_din_a[i]),
            .b(_din_b[i]),
            .c(_mult[i]),
            .overflow(),
            .underflow()
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                mult[i] <= {BW_DATA{1'b0}};
            else
                if(enable==1'b1)
                    mult[i] <= _mult[i];
        end
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
            .a(reg_accu[i]),
            .b(mult[i]),
            //.b(_mult[i]),
            .c(_reg_accu[i]),
            .overflow(),
            .underflow()
        );
    end
endgenerate



endmodule
