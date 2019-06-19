//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/18 16:33:59
// Design Name: 
// Module Name: bwd_path_controller
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

module memory_network_bwd_path_controller
(
    // clock
    clk,
    // rst_n
    rst_n,
    // input
    en_bwd_path,
    
    done_bwd_path_cost,
    done_bwd_path_fc_w_sm,
    done_bwd_path_weighted_sum,
    done_bwd_path_attention,
    done_bwd_path_fc,
    done_bwd_path_emb,
    done_bwd_path_w_up,
    done_bwd_path_count_hop,
    
    // output
    en_bwd_path_cost,
    en_bwd_path_fc_w_sm,
    en_bwd_path_weighted_sum,
    en_bwd_path_attention,
    en_bwd_path_emb,
    en_bwd_path_w_up,
    en_bwd_path_end,
    en_bwd_path_count_hop

);
////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter NUM_BWD_STATE               = `NUM_BWD_STATE;
parameter STATE_BWD_IDLE              = `STATE_BWD_IDLE;
parameter STATE_BWD_INIT              = `STATE_BWD_INIT;
parameter STATE_BWD_COST              = `STATE_BWD_COST;
parameter STATE_BWD_FC_W_SM           = `STATE_BWD_FC_W_SM;
parameter STATE_BWD_WEIGHTED_SUM      = `STATE_BWD_WEIGHTED_SUM;
parameter STATE_BWD_ATTENTION         = `STATE_BWD_ATTENTION;
parameter STATE_BWD_EMB               = `STATE_BWD_EMB;
parameter STATE_BWD_W_UP              = `STATE_BWD_W_UP;
parameter STATE_BWD_END_BWD           = `STATE_BWD_END_BWD;

parameter BW_BATCH_SIZE = `BW_BATCH_SIZE;
parameter BATCH_SIZE = `BATCH_SIZE;

////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clock
input wire clk;
// rst_n
input wire rst_n;
// input
input wire en_bwd_path;

input wire done_bwd_path_cost;
input wire done_bwd_path_fc_w_sm;
input wire done_bwd_path_weighted_sum;
input wire done_bwd_path_attention;
input wire done_bwd_path_fc;
input wire done_bwd_path_emb;
input wire done_bwd_path_w_up;
input wire done_bwd_path_count_hop;

// output
output reg en_bwd_path_cost;
output reg en_bwd_path_fc_w_sm;
output reg en_bwd_path_weighted_sum;
output reg en_bwd_path_attention;
output reg en_bwd_path_emb;
output reg en_bwd_path_w_up;
output reg en_bwd_path_end;
output reg en_bwd_path_count_hop;

////////////////////////////////////////////////////////////
// internal signals
////////////////////////////////////////////////////////////
reg [NUM_BWD_STATE-1:0] state;
reg [NUM_BWD_STATE-1:0] state_next;

reg _en_bwd_path_cost;
reg _en_bwd_path_fc_w_sm;
reg _en_bwd_path_weighted_sum;
reg _en_bwd_path_attention;
reg _en_bwd_path_emb;
reg _en_bwd_path_w_up;
reg _en_bwd_path_end;
reg _en_bwd_path_count_hop;

reg count;          // for pulse
reg _count;

reg flag_done_bwd_path_attention;
reg flag_done_bwd_path_fc;

////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
always@(*)
begin
    state_next = state;
    _en_bwd_path_cost = 1'b0;
    _en_bwd_path_fc_w_sm = 1'b0;
    _en_bwd_path_weighted_sum = 1'b0;
    _en_bwd_path_attention = 1'b0;
    _en_bwd_path_emb = 1'b0;
    _en_bwd_path_w_up = 1'b0;
    _en_bwd_path_end = 1'b0;
    
    _rst_n_b_counter = 1'b1;
    en_b_counter = 1'b0;
    _count = 1'b1;

    _en_bwd_path_count_hop = 1'b0;
    
    case(state)
        STATE_BWD_IDLE :
        begin
            state_next = STATE_BWD_INIT;
            _count = 1'b0;
        end
        STATE_BWD_INIT :
        begin
            if(en_bwd_path==1'b1)
            begin
                state_next = STATE_BWD_COST;
                _count = 1'b0;
            end
        end
        STATE_BWD_COST :
        begin
            if(done_bwd_path_cost==1'b1)
            begin
                state_next = STATE_BWD_FC_W_SM;
                _count = 1'b0;
            end

            if(count==1'b0)
            begin
                _en_bwd_path_cost = 1'b1;
                _count = 1'b1;
            end
        end
        STATE_BWD_FC_W_SM :
        begin
            if(done_bwd_path_fc_w_sm==1'b1)
            begin
                state_next = STATE_BWD_WEIGHTED_SUM;
                _count = 1'b0;
            end

            if(count==1'b0)
            begin
                _en_bwd_path_fc_w_sm = 1'b1;
                _count = 1'b1;
            end
        end
        STATE_BWD_WEIGHTED_SUM :
        begin
            if(done_bwd_path_weighted_sum==1'b1)
            begin
                state_next = STATE_BWD_ATTENTION;
                _count = 1'b0;
            end

            if(count==1'b0)
            begin
                _en_bwd_path_weighted_sum = 1'b1;
                _count = 1'b1;
            end
        end
        STATE_BWD_ATTENTION :
        begin
            //if(done_bwd_path_attention==1'b1 && flag_done_bwd_path_fc==1'b1)
            if(flag_done_bwd_path_attention==1'b1 && flag_done_bwd_path_fc==1'b1)
            begin
                state_next = STATE_BWD_EMB;
                _count = 1'b0;
            end

            if(count==1'b0)
            begin
                _en_bwd_path_attention= 1'b1;
                _count = 1'b1;
            end
        end
        STATE_BWD_EMB :
        begin
            if(done_bwd_path_emb==1'b1)
            begin
                if(done_bwd_path_count_hop==1'b1)
                begin
                    if(count_b_counter==BATCH_SIZE-1)    // batch done
                    begin
                        state_next = STATE_BWD_W_UP;
                        _count = 1'b0;
                        
                    end
                    else
                    begin
                        state_next = STATE_BWD_END_BWD;
                        _count = 1'b0;
                    end

                    en_b_counter = 1'b1;
                end
                else
                begin
                    state_next = STATE_BWD_WEIGHTED_SUM;
                    _count = 1'b0;
                    _en_bwd_path_count_hop = 1'b1;
                end
            end

            if(count==1'b0)
            begin
                _en_bwd_path_emb = 1'b1;
                _count = 1'b1;

                //en_b_counter = 1'b1;
            end
        end
        STATE_BWD_W_UP :
        begin
            if(done_bwd_path_w_up==1'b1)
            begin
                state_next = STATE_BWD_END_BWD;
                _count = 1'b0;

                _rst_n_b_counter = 1'b0;
            end

            if(count==1'b0)
            begin
                _en_bwd_path_w_up = 1'b1;
                _count = 1'b1;
            end
        end
        STATE_BWD_END_BWD :
        begin
            state_next = STATE_BWD_IDLE;

            if(count==1'b0)
            begin
                _en_bwd_path_end = 1'b1;
                _count = 1'b1;
            end
        end
        default :
        begin
            state_next = STATE_BWD_IDLE;
        end
    endcase
end

////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        state <= STATE_BWD_IDLE;
    else
        if(en_bwd_path==1'b0)
            state <= STATE_BWD_IDLE;
        else 
            state <= state_next;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_cost <= 1'b0;
    else    
        en_bwd_path_cost <= _en_bwd_path_cost;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_fc_w_sm <= 1'b0;
    else    
        en_bwd_path_fc_w_sm <= _en_bwd_path_fc_w_sm;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_weighted_sum <= 1'b0;
    else    
        en_bwd_path_weighted_sum <= _en_bwd_path_weighted_sum;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_attention <= 1'b0;
    else    
        en_bwd_path_attention <= _en_bwd_path_attention;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_emb <= 1'b0;
    else    
        en_bwd_path_emb <= _en_bwd_path_emb;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_w_up <= 1'b0;
    else    
        en_bwd_path_w_up <= _en_bwd_path_w_up;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_end <= 1'b0;
    else    
        en_bwd_path_end <= _en_bwd_path_end;
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
        en_bwd_path_count_hop <= 1'b0;
    else
        en_bwd_path_count_hop <= _en_bwd_path_count_hop;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        flag_done_bwd_path_fc = 1'b0;
    else
        if(state==STATE_BWD_EMB)
            flag_done_bwd_path_fc = 1'b0;
        else
            if(flag_done_bwd_path_fc == 1'b0)
                flag_done_bwd_path_fc = done_bwd_path_fc;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        flag_done_bwd_path_attention = 1'b0;
    else
        if(state==STATE_BWD_EMB)
            flag_done_bwd_path_attention  = 1'b0;
        else
            if(flag_done_bwd_path_attention == 1'b0)
                flag_done_bwd_path_attention = done_bwd_path_attention;
end

////////////////////////////////////////////////////////////
// instances
////////////////////////////////////////////////////////////

wire rst_n_b_counter;
reg _rst_n_b_counter;
reg en_b_counter;
wire [BW_BATCH_SIZE-1:0] count_b_counter;
//wire done_b_counter;


assign rst_n_b_counter = rst_n && _rst_n_b_counter;

counter
#(
    .BW(BW_BATCH_SIZE),
    .COUNT_VALUE(BATCH_SIZE)
)
batch_counter
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_b_counter),
    // input
    .en(en_b_counter),
    .en_hold_max(1'b0),
    // output
    .count(count_b_counter),
    //.done(done_b_counter)
    .done()
);

`ifdef DEBUG

/*
`ifdef DEBUG_ILA
// ila
ila
ila_bwd_path_controller
(
    .clk(clk),

    // 1 bit
    // input
    .probe0(en_bwd_path),
    .probe1(done_bwd_path_cost),
    .probe2(done_bwd_path_fc_w_sm),
    .probe3(done_bwd_path_weighted_sum),
    .probe4(done_bwd_path_attention),
    .probe5(done_bwd_path_emb),
    .probe6(done_bwd_path_w_up),
    .probe7(done_bwd_path_count_hop),

    // 1 bit
    // output
    .probe8(en_bwd_path_cost),
    .probe9(en_bwd_path_fc_w_sm),
    .probe10(en_bwd_path_weighted_sum),
    .probe11(en_bwd_path_attention),
    .probe12(en_bwd_path_emb),
    .probe13(en_bwd_path_w_up),
    .probe14(en_bwd_path_end),
    .probe15(en_bwd_path_count_hop),

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
    .probe32(_en_bwd_path_cost),
    .probe33(_en_bwd_path_fc_w_sm),
    .probe34(_en_bwd_path_weighted_sum),
    .probe35(_en_bwd_path_attention),
    .probe36(_en_bwd_path_emb),
    .probe37(_en_bwd_path_w_up),
    .probe38(_en_bwd_path_end),
    .probe39(_en_bwd_path_count_hop),

    // 1 bit
    .probe40(count),
    .probe41(_count),
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
