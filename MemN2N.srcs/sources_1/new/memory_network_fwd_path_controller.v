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

module memory_network_fwd_path_controller
(
    // clock
    clk,
    // rst_n
    rst_n,
    // input
    en_fwd_path,
    done_fwd_path_attention,
    done_fwd_path_weighted_sum,
    done_fwd_path_fc,
    done_fwd_path_sum_u_q,
    done_fwd_path_fc_w_sm,
    done_fwd_path_soft_max,
    done_fwd_path_count_hop,

    // output

    en_fwd_path_attention,
    en_fwd_path_weighted_sum,
    en_fwd_path_sum_u_q,
    en_fwd_path_fc_w_sm,
    en_fwd_path_soft_max,
    en_fwd_path_end,
    en_fwd_path_count_hop
);

//
parameter NUM_FWD_STATE = `NUM_FWD_STATE;

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
input wire done_fwd_path_fc;
input wire done_fwd_path_sum_u_q;
input wire done_fwd_path_fc_w_sm;
input wire done_fwd_path_soft_max;
input wire done_fwd_path_count_hop;


output reg en_fwd_path_attention;
output reg en_fwd_path_weighted_sum;
output reg en_fwd_path_sum_u_q;
output reg en_fwd_path_fc_w_sm;
output reg en_fwd_path_soft_max;
output reg en_fwd_path_end;
output reg en_fwd_path_count_hop;


// internal
reg [NUM_FWD_STATE-1:0] state;
reg [NUM_FWD_STATE-1:0] state_next;

reg _en_fwd_path_attention;
reg _en_fwd_path_weighted_sum;
reg _en_fwd_path_sum_u_q;
reg _en_fwd_path_fc_w_sm;
reg _en_fwd_path_soft_max;
reg _en_fwd_path_end;

reg count;      // for pulse
reg _count;

reg _en_fwd_path_count_hop;

reg flag_done_fwd_path_weighted_sum;
reg flag_done_fwd_path_fc;


//
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        state <= STATE_FWD_IDLE;
    else
        if(en_fwd_path==1'b0)
            state <= STATE_FWD_IDLE;
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
        en_fwd_path_fc_w_sm <= 1'b0;
    else
        en_fwd_path_fc_w_sm <= _en_fwd_path_fc_w_sm;
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

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        count <= 1'b0;
    else
        count <= _count;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path_count_hop <= 1'b0;
    else
        en_fwd_path_count_hop <= _en_fwd_path_count_hop;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        flag_done_fwd_path_weighted_sum = 1'b0;
    else
        if(state==STATE_FWD_SUM_U_Q)
            flag_done_fwd_path_weighted_sum = 1'b0;
        else
            if(flag_done_fwd_path_weighted_sum == 1'b0)
                flag_done_fwd_path_weighted_sum = done_fwd_path_weighted_sum;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        flag_done_fwd_path_fc = 1'b0;
    else
        if(state==STATE_FWD_SUM_U_Q)
            flag_done_fwd_path_fc = 1'b0;
        else
            if(flag_done_fwd_path_fc == 1'b0)
                flag_done_fwd_path_fc = done_fwd_path_fc;
end


always@(*)
begin
    state_next = state;
    _en_fwd_path_attention = 1'b0;
    _en_fwd_path_weighted_sum = 1'b0;
    _en_fwd_path_sum_u_q = 1'b0;
    _en_fwd_path_fc_w_sm = 1'b0;
    _en_fwd_path_soft_max = 1'b0;
    _en_fwd_path_end = 1'b0;
    _count = 1'b1;
    _en_fwd_path_count_hop = 1'b0;

    case(state)
        STATE_FWD_IDLE :
        begin
            state_next = STATE_FWD_INIT;
            _count = 1'b0;
        end
        STATE_FWD_INIT :
        begin
            if(en_fwd_path==1'b1)
            begin
                state_next = STATE_FWD_ATTENTION;
                _count = 1'b0;
            end
        end
        STATE_FWD_ATTENTION :
        begin
            if(done_fwd_path_attention==1'b1)
            begin
                state_next = STATE_FWD_WEIGHTED_SUM;
                _count = 1'b0;
            end

            if(count==1'b0)
            begin
                _en_fwd_path_attention = 1'b1;
                _count = 1'b1;
            end
        end
        STATE_FWD_WEIGHTED_SUM :
        begin
            //if(done_fwd_path_weighted_sum==1'b1 && flag_done_fwd_path_fc==1'b1)
            if(flag_done_fwd_path_weighted_sum==1'b1 && flag_done_fwd_path_fc==1'b1)
            begin
                state_next = STATE_FWD_SUM_U_Q;
                _count = 1'b0;
            end

            if(count==1'b0)
            begin
                _en_fwd_path_weighted_sum = 1'b1;
                _count = 1'b1;
            end
        end
        STATE_FWD_SUM_U_Q :
        begin
            if(done_fwd_path_sum_u_q==1'b1)
            begin
                if(done_fwd_path_count_hop==1'b1)
                begin
                    state_next = STATE_FWD_FULLY_CONNECTED;
                end
                else
                begin
                    state_next = STATE_FWD_ATTENTION;
                    _en_fwd_path_count_hop = 1'b1;
                end
                _count = 1'b0;
            end
            
            if(count==1'b0)
            begin
                _en_fwd_path_sum_u_q = 1'b1;
                _count = 1'b1;
            end
        end
        STATE_FWD_FULLY_CONNECTED :
        begin
            if(done_fwd_path_fc_w_sm==1'b1)
            begin
                //state_next = STATE_FWD_SOFT_MAX;
                state_next = STATE_FWD_END_FWD;
                _count = 1'b0;
            end
            
            if(count==1'b0)
            begin
                _en_fwd_path_fc_w_sm = 1'b1;
                _count = 1'b1;
            end
        end
        STATE_FWD_SOFT_MAX :
        begin
            if(done_fwd_path_soft_max==1'b1)
            begin
                state_next = STATE_FWD_END_FWD;
                _count = 1'b0;
            end;
            
            if(count==1'b0)
            begin
                _en_fwd_path_soft_max = 1'b1;
                _count = 1'b1;
            end
        end
        STATE_FWD_END_FWD :
        begin
            state_next = STATE_FWD_IDLE;     // TMP

            if(count==1'b0)
            begin
                _en_fwd_path_end = 1'b1;
                _count = 1'b1;
            end
        end
        default :
        begin
            state_next = STATE_FWD_IDLE;
            _count = 1'b1;
        end
    endcase
end


`ifdef DEBUG

/*
`ifdef DEBUG_ILA
// ila
ila
ila_fwd_path_controller
(
    .clk(clk),

    // 1 bit
    // input
    .probe0(en_fwd_path),
    .probe1(done_fwd_path_attention),
    .probe2(done_fwd_path_weighted_sum),
    .probe3(done_fwd_path_sum_u_q),
    .probe4(done_fwd_path_fc_w_sm),
    .probe5(done_fwd_path_soft_max),
    .probe6(done_fwd_path_count_hop),
    .probe7(flag_done_fwd_path_fc),

    // 1 bit
    // output
    .probe8(en_fwd_path_attention),
    .probe9(en_fwd_path_weighted_sum),
    .probe10(en_fwd_path_sum_u_q),
    .probe11(en_fwd_path_fc_w_sm),
    .probe12(en_fwd_path_soft_max),
    .probe13(en_fwd_path_end),
    .probe14(en_fwd_path_count_hop),
    .probe15(),

    // 16 bit
    .probe16(),
    .probe17(),
    .probe18(),
    .probe19(),
    .probe20(),
    .probe21(),
    .probe22(),
    .probe23(),

    // 32 bit
    .probe24(state),
    .probe25(state_next),
    .probe26(),
    .probe27(),
    .probe28(),
    .probe29(),
    .probe30(),
    .probe31(),

    // 1 bit
    // internal
    .probe32(_en_fwd_path_attention),
    .probe33(_en_fwd_path_weighted_sum),
    .probe34(_en_fwd_path_sum_u_q),
    .probe35(_en_fwd_path_fc_w_sm),
    .probe36(_en_fwd_path_soft_max),
    .probe37(_en_fwd_path_end),
    .probe38(count),
    .probe39(_count),

    // 1 bit
    .probe40(_en_fwd_path_count_hop),
    .probe41(),
    .probe42(),
    .probe43(),
    .probe44(),
    .probe45(),
    .probe46(),
    .probe47()

);
`endif  // DEBUG_ILA
*/

`endif  // DEBUG



endmodule
