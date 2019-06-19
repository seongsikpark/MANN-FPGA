//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/02/05 12:58:06
// Design Name: 
// Module Name: MemN2N_phase_controller
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

module MemN2N_phase_controller
(
    // clock
    clk,
    // rst_n
    rst_n,
    // input
    enable,
    done_phase,
    // output
    memn2n_phase
);

parameter NUM_STATE = 10;
parameter BW_STATE = NUM_STATE;

parameter STATE_IDLE                = `PHASE_IDLE;
parameter STATE_INIT                = `PHASE_INIT;
parameter STATE_EMB_Q               = `PHASE_EMB_Q;
parameter STATE_DOT_PROD_MEM_EMB_Q  = `PHASE_DOT_PROD_MEM_EMB_Q;
parameter STATE_ATTENTION           = `PHASE_ATTENTION;
parameter STATE_WEIGHTED_SUM        = `PHASE_WEIGHTED_SUM;
parameter STATE_SUM_U_Q             = `PHASE_SUM_U_Q;
parameter STATE_FULLY_CONNECTED     = `PHASE_FULLY_CONNECTED;
parameter STATE_SOFT_MAX            = `PHASE_SOFT_MAX;
parameter STATE_END_FWD             = `PHASE_END_FWD;




// clock
input wire clk;
// rst_n
input wire rst_n;
// input
input wire enable;
input wire done_phase;
// output
output wire [BW_STATE-1:0] memn2n_phase;

// internal
reg [NUM_STATE-1:0] state;
reg [NUM_STATE-1:0] state_next;

//
assign memn2n_phase = state;

//
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
    begin
        state <= STATE_IDLE;
        state_next <= STATE_INIT;
    end
    else
        if(enable==1'b1)
            state <= state_next;
        else
        begin
            state <= STATE_IDLE;
            state_next <= STATE_INIT;
        end
end

always@(*)
begin
    case(state)
        STATE_IDLE :
        begin
            state_next <= STATE_INIT;
        end
        STATE_INIT :
        begin
            state_next <= STATE_EMB_Q;
        end
        STATE_EMB_Q :
        begin
            if(done_phase==1'b1)
                state_next <= STATE_DOT_PROD_MEM_EMB_Q;
            else
                state_next <= STATE_EMB_Q;
        end
        STATE_DOT_PROD_MEM_EMB_Q :
        begin
            if(done_phase==1'b1)
                state_next <= STATE_ATTENTION;
            else
                state_next <= STATE_DOT_PROD_MEM_EMB_Q;
        end
        STATE_ATTENTION :
        begin
            if(done_phase==1'b1)
                state_next <= STATE_WEIGHTED_SUM;
            else
                state_next <= STATE_ATTENTION;
        end
        STATE_WEIGHTED_SUM :
        begin
            if(done_phase==1'b1)
                state_next <= STATE_SUM_U_Q;
            else
                state_next <= STATE_WEIGHTED_SUM;
        end
        STATE_SUM_U_Q :
        begin
            state_next <= STATE_FULLY_CONNECTED;
        end
        STATE_FULLY_CONNECTED :
        begin
            if(done_phase==1'b1)
                state_next <= STATE_SOFT_MAX;
            else
                state_next <= STATE_FULLY_CONNECTED;
        end
        STATE_SOFT_MAX :
        begin
            if(done_phase==1'b1)
                state_next <= STATE_END_FWD;
            else
                state_next <= STATE_SOFT_MAX;
        end
        STATE_END_FWD :
        begin
            state_next <= STATE_IDLE;     // TMP
        end
        default :
        begin
            state_next <= STATE_IDLE;
        end
    endcase
end







endmodule
