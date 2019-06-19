//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/18 11:23:54
// Design Name: 
// Module Name: cross_entropy
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

module cross_entropy
(
    // clock
    clk,
    // reset_n
    rst_n,
    // input
    en,
    ans_in,
    inference_in,
    // output
    done,
    cost_out,
    grad_out
);
////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter BW_WL = `BW_WL;
parameter BW_IWL = `BW_IWL;

parameter BW_DATA = `BW_DATA;
parameter DIM_IN = `BW_DIM_IN;

////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clock
input wire clk;
// reset_n
input wire rst_n;
// input
input wire en;
input wire [DIM_IN-1:0] ans_in;
input wire [BW_DATA*DIM_IN-1:0] inference_in;
// output
output reg done;
output reg [BW_DATA-1:0] cost_out;
output reg [BW_DATA*DIM_IN-1:0] grad_out;

////////////////////////////////////////////////////////////
// internal signals
////////////////////////////////////////////////////////////
genvar i;
reg en_sync;

wire [BW_DATA-1:0] _cost;
reg [BW_DATA-1:0] _grad_out [0:DIM_IN-1];

wire [BW_DATA-1:0] _grad_out_ans [0:DIM_IN-1];
wire [BW_DATA-1:0] _grad_out_n_ans [0:DIM_IN-1];

wire [BW_DATA-1:0] inference_in_neg [0:DIM_IN-1];

////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        //assign inference_in_neg[i] = (en_sync==1'b1) ? ~inference_in[(i+1)*BW_DATA-1-:BW_DATA]+1'b1 : {BW_DATA{1'b0}};
        assign inference_in_neg[i] = ~inference_in[(i+1)*BW_DATA-1-:BW_DATA]+1'b1;
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        assign _cost = (en_sync==1'b1&&ans_in[i]==1'b1)? inference_in_neg[i]:{BW_DATA{1'bz}};
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        assign _grad_out_ans[i] = $signed(inference_in[(i+1)*BW_DATA-1-:BW_DATA] - (32'b1<<(`BW_WL-`BW_IWL-1)));
    end
endgenerate

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        assign _grad_out_n_ans[i] = inference_in[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                grad_out[(i+1)*BW_DATA-1-:BW_DATA] <= {BW_DATA{1'b0}};
            else
                if(en_sync==1'b1)
                    grad_out[(i+1)*BW_DATA-1-:BW_DATA] <= _grad_out[i];
        end
    end
endgenerate

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_sync <= 1'b0;
    else
        if(done==1'b1)
            en_sync <= 1'b0;
        else if(en_sync==1'b0)
            en_sync <= en;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done <= 1'b0;
    else
        if(done==1'b1)
            done <= 1'b0;
        else 
            done <= en_sync;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        cost_out <= {BW_DATA{1'b0}};
    else
        if(en_sync==1'b1)
            cost_out <= _cost;
end

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        /*
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                _grad_out[i] <= {BW_DATA{1'b0}};
            else
            begin
                if(en_sync==1'b1)
                begin
                    //if(ans_in[i]==1'b1) 
                    //    _grad_out[i] <= $signed(inference_in_neg[i])+(32'b1<<(`BW_WL-`BW_IWL-1));
                    //else
                    //    _grad_out[i] <= inference_in_neg[i];

                    if(ans_in[i]==1'b1) 
                        _grad_out[i] <= $signed(inference_in[(i+1)*BW_DATA-1-:BW_DATA] - (32'b1<<(`BW_WL-`BW_IWL-1)));
                    else
                        _grad_out[i] <= inference_in[(i+1)*BW_DATA-1-:BW_DATA];
                end
                
                //_grad_out[i] <= ({BW_DATA{en_sync}})&&({BW_DATA{ans_in[i]}}&&_grad_out_ans[i])||({BW_DATA{!ans_in[i]}}&&_grad_out_n_ans[i]);
            end
        end
        */

        always@(*)
        begin
            if(ans_in[i]==1'b1) 
                _grad_out[i] = $signed(inference_in[(i+1)*BW_DATA-1-:BW_DATA] - (32'b1<<(`BW_WL-`BW_IWL-1)));
            else
                _grad_out[i] = inference_in[(i+1)*BW_DATA-1-:BW_DATA];
        end

    end
endgenerate

////////////////////////////////////////////////////////////
// instances
////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
// debug
////////////////////////////////////////////////////////////
`ifdef DEBUG
wire [BW_DATA-1:0] debug_inference_in [0:DIM_IN-1];


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        assign debug_inference_in[i] = inference_in[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate


`endif


endmodule
