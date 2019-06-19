//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/04/17 15:21:16
// Design Name: 
// Module Name: MemN2N_fwd_path_controller
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

module MemN2N_fwd_path_controller
(
    // clock
    clk,
    // rst_n
    rst_n,
    // input
    en_fwd_path,
    done_fwd_path_attention,
    done_fwd_path_weighted_sum,
    done_fwd_path_sum_u_q,
    done_fwd_path_fully_connected,
    done_fwd_path_soft_max,

    // output

    en_fwd_path_attention,
    en_fwd_path_weighted_sum,
    en_fwd_path_sum_u_q,
    en_fwd_path_fully_connected,
    en_fwd_path_soft_max,
    en_fwd_path_end
);

//
parameter NUM_FWD_STATE = 8;

parameter STATE_FWD_IDLE                = `STATE_FWD_IDLE;
parameter STATE_FWD_INIT                = `STATE_FWD_INIT;
parameter STATE_FWD_ATTENTION           = `STATE_FWD_ATTENTION;
parameter STATE_FWD_WEIGHTED_SUM        = `STATE_FWD_WEIGHTED_SUM;
parameter STATE_FWD_SUM_U_Q             = `STATE_FWD_SUM_U_Q;
parameter STATE_FWD_FULLY_CONNECTED     = `STATE_FWD_FULLY_CONNECTED;
parameter STATE_FWD_SOFT_MAX            = `STATE_FWD_SOFT_MAX;
parameter STATE_FWD_END_FWD             = `STATE_FWD_END;

//
input wire clk;
input wire rst_n;
input wire en_fwd_path;
input wire done_fwd_path_attention;
input wire done_fwd_path_weighted_sum;
input wire done_fwd_path_sum_u_q;
input wire done_fwd_path_fully_connected;
input wire done_fwd_path_soft_max;


output reg en_fwd_path_attention;
output reg en_fwd_path_weighted_sum;
output reg en_fwd_path_sum_u_q;
output reg en_fwd_path_fully_connected;
output reg en_fwd_path_soft_max;
output reg en_fwd_path_end;


// internal
reg [NUM_FWD_STATE-1:0] state;
reg [NUM_FWD_STATE-1:0] state_next;

reg _en_fwd_path_attention;
reg _en_fwd_path_weighted_sum;
reg _en_fwd_path_sum_u_q;
reg _en_fwd_path_fully_connected;
reg _en_fwd_path_soft_max;
reg _en_fwd_path_end;

//
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_fwd_path==1'b0)
    begin
        state <= STATE_FWD_IDLE;
        //state_next <= STATE_FWD_INIT;
    end
    else
        state <= state_next;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path_attention <= 1'b0;
    else
        en_fwd_path_attention <= _en_fwd_path_attention;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path_weighted_sum <= 1'b0;
    else
        en_fwd_path_weighted_sum <= _en_fwd_path_weighted_sum;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path_sum_u_q <= 1'b0;
    else
        en_fwd_path_sum_u_q <= _en_fwd_path_sum_u_q;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path_fully_connected <= 1'b0;
    else
        en_fwd_path_fully_connected <= _en_fwd_path_fully_connected;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path_soft_max <= 1'b0;
    else
        en_fwd_path_soft_max <= _en_fwd_path_soft_max;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path_end <= 1'b0;
    else
        en_fwd_path_end <= _en_fwd_path_end;
end


reg count;
reg _count;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        count <= 1'b0;
    else
        count <= _count;
end



always@(*)
begin
    _en_fwd_path_attention <= 1'b0;
    _en_fwd_path_weighted_sum <= 1'b0;
    _en_fwd_path_sum_u_q <= 1'b0;
    _en_fwd_path_fully_connected <= 1'b0;
    _en_fwd_path_soft_max <= 1'b0;
    _en_fwd_path_end <= 1'b0;

    case(state)
        STATE_FWD_IDLE :
        begin
            state_next <= STATE_FWD_INIT;
            _count <= 1'b0;
        end
        STATE_FWD_INIT :
        begin
            if(en_fwd_path==1'b1)
            begin
                state_next <= STATE_FWD_ATTENTION;
                _count <= 1'b0;
            end
        end
        STATE_FWD_ATTENTION :
        begin
            if(done_fwd_path_attention==1'b1)
            begin
                state_next <= STATE_FWD_WEIGHTED_SUM;
                _count <= 1'b0;
            end

            if(count==1'b0)
            begin
                _en_fwd_path_attention <= 1'b1;
                _count <= 1'b1;
            end
        end
        STATE_FWD_WEIGHTED_SUM :
        begin
            if(done_fwd_path_weighted_sum==1'b1)
            begin
                state_next <= STATE_FWD_SUM_U_Q;
                _count <= 1'b0;
            end

            if(count==1'b0)
            begin
                _en_fwd_path_weighted_sum <= 1'b1;
                _count <= 1'b1;
            end
        end
        STATE_FWD_SUM_U_Q :
        begin
            if(done_fwd_path_sum_u_q==1'b1)
            begin
                state_next <= STATE_FWD_FULLY_CONNECTED;
                _count <= 1'b0;
            end
            
            if(count==1'b0)
            begin
                _en_fwd_path_sum_u_q <= 1'b1;
                _count <= 1'b1;
            end
        end
        STATE_FWD_FULLY_CONNECTED :
        begin
            if(done_fwd_path_fully_connected==1'b1)
            begin
                //state_next <= STATE_FWD_SOFT_MAX;
                state_next <= STATE_FWD_END_FWD;
                _count <= 1'b0;
            end
            
            if(count==1'b0)
            begin
                _en_fwd_path_fully_connected <= 1'b1;
                _count <= 1'b1;
            end
        end
        STATE_FWD_SOFT_MAX :
        begin
            if(done_fwd_path_soft_max==1'b1)
            begin
                state_next <= STATE_FWD_END_FWD;
                _count <= 1'b0;
            end;
            
            if(count==1'b0)
            begin
                _en_fwd_path_soft_max <= 1'b1;
                _count <= 1'b1;
            end
        end
        STATE_FWD_END_FWD :
        begin
            state_next <= STATE_FWD_IDLE;     // TMP

            if(count==1'b0)
            begin
                _en_fwd_path_end <= 1'b1;
                _count <= 1'b1;
            end
        end
        default :
        begin
            state_next <= STATE_FWD_IDLE;
        end
    endcase
end

endmodule
