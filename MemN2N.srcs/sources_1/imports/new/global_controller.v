`timescale 1ns / 1ps
`include "common.h"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/13 14:41:52
// Design Name: 
// Module Name: global_controller
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


module global_controller
(
    // clk
    clk,
    // rst_n
    rst_n,
    // input
    empty_fifo_in,
    valid_fifo_in,
    data_fifo_in,
    // output
    re_fifo_in,
    en_init_cmd,
    lr_l2,
    rst_n_memn2n_cmd
);
////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter BW_IO = 8;
/*
parameter CMD_RB_N              = 8'b0000_0001;
parameter CMD_FIFO_IN_FULL      = 8'b0000_0010;
parameter CMD_FIFO_IN_EMPTY     = 8'b0000_0011;
parameter CMD_FIFO_OUT_FULL     = 8'b0000_0100;
parameter CMD_FIFO_OUT_EMPTY    = 8'b0000_0101;
*/
parameter CMD_INIT  = `CMD_INIT;
parameter CMD_LR_L2 = `CMD_LR_L2;

////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clk
input wire clk;
// rst_n
input wire rst_n;
// input
input wire empty_fifo_in;
input wire valid_fifo_in;
input wire [BW_IO-1:0] data_fifo_in;
// output
output reg re_fifo_in;
output reg en_init_cmd;
output reg [BW_IO-1:0] lr_l2;
output reg rst_n_memn2n_cmd;

////////////////////////////////////////////////////////////
// internals
////////////////////////////////////////////////////////////
wire _re_fifo_in;
wire _reg_re_fifo_in_1;
reg reg_re_fifo_in_1;
reg reg_re_fifo_in_2;

reg en_rst_n_memn2n_cmd;
reg rst_n_count_rst_n_memn2n;
wire en_count_rst_n_memn2n;
reg done_rst_n_memn2n_cmd;

// for pulse
reg count;
reg _count;

reg latch_cmd;

reg [BW_IO-1:0] cmd;

reg _en_init_cmd;

reg en_lr_l2;
reg _en_lr_l2;



////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
assign _reg_re_fifo_in_1 = !empty_fifo_in&&!valid_fifo_in;
assign _re_fifo_in = reg_re_fifo_in_1&&!reg_re_fifo_in_2;

always@(*)
begin
    _en_init_cmd = 1'b0;
    _en_lr_l2 = 1'b0;

    _count = 1'b1;

    case(cmd)
    CMD_INIT:
    begin
        if(latch_cmd==1'b1)
        begin
            _count = 1'b0;
        end
        
        if(count==1'b0)
        begin
            _en_init_cmd = 1'b1;
            _count = 1'b1;
        end
    end
    CMD_LR_L2:
    begin
        if(latch_cmd==1'b1)
        begin
            _count = 1'b0;
        end
        
        if(count==1'b0 && en_lr_l2==1'b0)
        begin
            _en_lr_l2 = 1'b1;
            _count = 1'b1;
        end

    end
    default
        _en_init_cmd = 1'b0;
    endcase
end

////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
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
        latch_cmd <= 1'b0;
    else
        latch_cmd <= valid_fifo_in; 
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        cmd <= {BW_IO{1'b0}};
    else
        cmd <= data_fifo_in;
end

always@(posedge clk or posedge rst_n)
begin
    if(rst_n==1'b0)
        reg_re_fifo_in_1 <= 1'b0;
    else
        reg_re_fifo_in_1 <= _reg_re_fifo_in_1;
end

always@(posedge clk or posedge rst_n)
begin
    if(rst_n==1'b0)
        reg_re_fifo_in_2 <= 1'b0;
    else
        reg_re_fifo_in_2 <= reg_re_fifo_in_1;
end

always@(posedge clk or posedge rst_n)
begin
    if(rst_n==1'b0)
        re_fifo_in <= 1'b0;
    else
        re_fifo_in <= _re_fifo_in;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_init_cmd <= 1'b0;
    else
        if(en_init_cmd == 1'b0)
            en_init_cmd <= _en_init_cmd;
        else
            en_init_cmd <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_lr_l2 <= 1'b0;
    else
        if(en_lr_l2 == 1'b0)
            en_lr_l2 <= _en_lr_l2;
        else
            if(latch_cmd==1'b1)
                en_lr_l2 <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        lr_l2 <= {BW_IO{1'b0}};
    else
        if(en_lr_l2 == 1'b1 && latch_cmd==1'b1)
            lr_l2 <= data_fifo_in;
end


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_rst_n_memn2n_cmd==1'b1)
        rst_n_memn2n_cmd <= 1'b1;
    else
        if(en_rst_n_memn2n_cmd==1'b1)
            rst_n_memn2n_cmd <= 1'b0;
        else
            rst_n_memn2n_cmd <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_rst_n_memn2n_cmd <= 1'b0;
    else
        if(done_rst_n_memn2n_cmd==1'b0)
            done_rst_n_memn2n_cmd <= done_count_rst_n_memn2n;
        else
            if(cmd != `CMD_RST_MEMN2N)
                done_rst_n_memn2n_cmd <= 1'b0;
end

assign en_count_rst_n_memn2n = en_rst_n_memn2n_cmd;

always@(*)
begin
    if((cmd == `CMD_RST_MEMN2N)&&(done_rst_n_memn2n_cmd==1'b0))
        en_rst_n_memn2n_cmd = 1'b1;
    else
        en_rst_n_memn2n_cmd = 1'b0;
end

always@(*)
begin
    if((cmd !=`CMD_RST_MEMN2N)||(rst_n==1'b0))
        rst_n_count_rst_n_memn2n = 1'b0;
    else
        rst_n_count_rst_n_memn2n = 1'b1;
end




////////////////////////////////////////////////////////////
// instances
////////////////////////////////////////////////////////////
counter
#(
    .BW(9),
    .COUNT_VALUE(128)
)
count_rst_n_memn2n
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_count_rst_n_memn2n),
    // input
    .en(en_count_rst_n_memn2n),
    .en_hold_max(1'b0),
    // output
    .count(),
    .done(done_count_rst_n_memn2n)
);


endmodule
