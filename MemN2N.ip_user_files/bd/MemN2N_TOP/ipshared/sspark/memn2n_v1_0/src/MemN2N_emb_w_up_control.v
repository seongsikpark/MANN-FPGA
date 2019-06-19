//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/22 15:53:29
// Design Name: 
// Module Name: MemN2N_emb_w_up_control
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

module MemN2N_emb_w_up_control
(
    // clock
    clk,
    // rst_n
    rst_n,
    // input
    enable,
    // output
    ctrl_buf_out_in,
    we,
    en_counter
);

parameter NUM_STATE = 5;

parameter STATE_IDLE = 'b00001;
parameter STATE_INIT = 'b00010;
parameter STATE_G_TO_O = 'b00100;
parameter STATE_M_ACCU_O = 'b01000;
parameter STATE_O_TO_M = 'b10000;

    // clock
input wire clk;
    // rst_n
input wire rst_n;
    // input
input wire enable;
    // output
output reg ctrl_buf_out_in;
output reg we;
output reg en_counter;


// internal
reg [NUM_STATE-1:0] state;
reg [NUM_STATE-1:0] state_next;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
    begin
        state <= STATE_IDLE;
        //state_next <= STATE_INIT;
    end
    else
    begin
        if(enable==1'b1)
            state <= state_next;
        else
        begin
           state <= STATE_IDLE;
           //state_next <= STATE_INIT;
        end
    end
end

always@(*)
begin
    case(state)
        STATE_IDLE :
        begin
            state_next <= STATE_INIT;
            ctrl_buf_out_in <= 1'b0;
            we <= 1'b0;
            en_counter <= 1'b0;        
        end
        STATE_INIT :
        begin
            state_next <= STATE_G_TO_O;
            ctrl_buf_out_in <= 1'b1;
            we <= 1'b0;
            en_counter <= 1'b0;
        end
        STATE_G_TO_O :
        begin
            state_next <= STATE_M_ACCU_O;
            ctrl_buf_out_in <= 1'b0;
            we <= 1'b0;
            en_counter <= 1'b0;        
        end
        STATE_M_ACCU_O :
        begin
            state_next <= STATE_O_TO_M;
            ctrl_buf_out_in <= 1'b0;
            we <= 1'b1;
            en_counter <= 1'b0;         
        end
        STATE_O_TO_M :
        begin
            state_next <= STATE_G_TO_O;
            ctrl_buf_out_in <= 1'b1;
            we <= 1'b0;
            en_counter <= 1'b1;              
        end
        default :
        begin
            state_next <= STATE_INIT;
            ctrl_buf_out_in <= 1'b0;
            we <= 1'b0;
            en_counter <= 1'b0;            
        end
    endcase
end


endmodule
