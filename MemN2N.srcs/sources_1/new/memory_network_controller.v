//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/22 12:05:59
// Design Name: 
// Module Name: memory_network_controller
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

module memory_network_controller
(
    // clk
    clk,
    // rst_n
    rst_n,
    // input
    rb_n_memory_network,
    valid_fifo_in,
    done_init_memn2n,
    data_fifo_in,
    data_out,
    // output
    en_memory_network,
    done_init,
    data_in,
    data_in_fifo_out,
    lr_l2,
    din_exp_shift_bit,
    rst_n_memn2n_cmd,
    set_mode,
    en_w_load_to_fpga
);

////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter BW_DATA_IN = `BW_DATA_IN;

////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clk
input wire clk;
// rst_n
input wire rst_n;
// input
input wire rb_n_memory_network;
input wire valid_fifo_in;
input wire done_init_memn2n;
input wire [BW_DATA_IN-1:0] data_fifo_in;
input wire [BW_DATA_IN-1:0] data_out;
// output
output reg en_memory_network;
output reg done_init;
output reg [BW_DATA_IN-1:0] data_in;
output reg [BW_DATA_IN-1:0] data_in_fifo_out;
output reg [7:0] lr_l2;
output reg [7:0] din_exp_shift_bit;
output reg rst_n_memn2n_cmd;
output reg set_mode;
output reg en_w_load_to_fpga;

////////////////////////////////////////////////////////////
// internal signals
////////////////////////////////////////////////////////////
wire [`BW_TYPE_CODE-1:0] type_code;
wire [BW_DATA_IN-1:0] type_code_16;

wire [BW_DATA_IN-1:0] _data_in;
wire [BW_DATA_IN-1:0] _data_in_fifo_out;


reg en_rst_n_memn2n_cmd;
reg rst_n_count_rst_n_memn2n;
wire en_count_rst_n_memn2n;
reg done_rst_n_memn2n_cmd;
wire done_count_rst_n_memn2n_cmd;

wire _set_mode_on;
reg set_mode_on_0;
reg set_mode_on_1;
reg set_mode_on_2;

reg set_mode_off;
wire _set_mode_off;
reg set_mode_off_0;
reg set_mode_off_1;
reg set_mode_off_2;

reg _en_memory_network;
//reg _en_w_load_to_fpga;

////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
//assign data_in[BW_DATA_IN/2-1:0] = data_fifo_in[BW_DATA_IN-1-:8];
//assign data_in[BW_DATA_IN-1-:8] = data_fifo_in[BW_DATA_IN/2-1:0];


/*
assign data_in[8-1:0] = data_fifo_in[16-1:8];
assign data_in[16-1:8] = data_fifo_in[8-1:0];

assign data_in_fifo_out[BW_DATA_IN/2-1:0] = data_out[BW_DATA_IN-1-:8];
assign data_in_fifo_out[BW_DATA_IN-1-:8] = data_out[BW_DATA_IN/2-1:0];
*/

assign type_code = data_fifo_in[`RANGE_TYPE_CODE];
assign type_code_16 = data_fifo_in;

assign _data_in = data_fifo_in;
assign _data_in_fifo_out = data_out;


////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_memory_network <= 1'b0;
    else 
        en_memory_network <= valid_fifo_in && rb_n_memory_network && _en_memory_network;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_init <= 1'b0;
    else
        if(done_init==1'b0)
            done_init <= done_init_memn2n;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        data_in <= {BW_DATA_IN{1'b0}};
    else
        if(_en_memory_network==1'b1)
            data_in <= _data_in;
end

always@(*)
begin
    //if((type_code!=`TYPE_CODE_SET_LR_L2)&&(type_code!=`TYPE_CODE_DIN_EXP_SHIFT_BIT)&&(type_code!=`TYPE_CODE_RST_MEMN2N)&&(type_code!=`TYPE_CODE_DUMMY)&&(type_code!=`TYPE_CODE_SET_MODE_ON)&&(type_code!=`TYPE_CODE_SET_MODE_OFF)&&(set_mode_on_0==1'b0)&&(set_mode_off_0==1'b0)&&(set_mode==1'b0))
    if((type_code!=`TYPE_CODE_SET_LR_L2)&&(type_code!=`TYPE_CODE_DIN_EXP_SHIFT_BIT)&&(type_code!=`TYPE_CODE_RST_MEMN2N)&&(type_code!=`TYPE_CODE_DUMMY)&&(type_code!=`TYPE_CODE_SET_MODE_ON)&&(type_code!=`TYPE_CODE_SET_MODE_OFF)&&(set_mode==1'b0))
    begin
        _en_memory_network = 1'b1;
    end
    else
    begin
        _en_memory_network = 1'b0;
    end
end

/*
always@(*)
begin
    if((set_mode==1'b1)&&(type_code_16==`TYPE_CODE_SET_MODE_W_LOAD_TO_FPGA)&&(valid_fifo_in==1'b1))
        _en_w_load_to_fpga = 1'b1;
    else
        _en_w_load_to_fpga = 1'b0;
end
*/



always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        data_in_fifo_out <= {BW_DATA_IN{1'b0}};
    else
        data_in_fifo_out <= _data_in_fifo_out;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        lr_l2 <= 8'b0;
    else
        if((type_code == `TYPE_CODE_SET_LR_L2)&&(set_mode_on_0==1'b0)&&(set_mode==1'b0))
        begin
            lr_l2 <= _data_in[7:0];
        end
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        din_exp_shift_bit <= 8'b0;
    else
        if((type_code == `TYPE_CODE_DIN_EXP_SHIFT_BIT)&&(set_mode_on_0==1'b0)&&(set_mode==1'b0))
        begin
            din_exp_shift_bit <= _data_in[7:0];
        end
end

//
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        set_mode_on_0 <= 1'b0;
    else
        if(set_mode==1'b1)
            set_mode_on_0 <= 1'b0;
        else
            if(type_code == `TYPE_CODE_SET_MODE_ON)
                set_mode_on_0 <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        set_mode_on_1 <= 1'b0;
    else
        if(set_mode==1'b1)
            set_mode_on_1 <= 1'b0;
        else 
            if((set_mode_on_0==1'b1)&&(type_code_16==`TYPE_CODE_SET_MODE_ON_1))
                set_mode_on_1 <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        set_mode_on_2 <= 1'b0;
    else
        if(set_mode==1'b1)
            set_mode_on_2 <= 1'b0;
        else
            if((set_mode_on_1==1'b1)&&(type_code_16==`TYPE_CODE_SET_MODE_ON_2))
                set_mode_on_2 <= 1'b1;
end

assign _set_mode_on = set_mode_on_0&&set_mode_on_1&&set_mode_on_2;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        set_mode <= 1'b0;
    else
        if(set_mode_off==1'b1)
            set_mode <= 1'b0;
        else
            if(set_mode==1'b0)
                set_mode <= _set_mode_on;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        set_mode_off_0 <= 1'b0;
    else
        if(set_mode_off==1'b1)
            set_mode_off_0 <= 1'b0;
        else
            if(type_code == `TYPE_CODE_SET_MODE_OFF)
                set_mode_off_0 <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        set_mode_off_1 <= 1'b0;
    else
        if(set_mode_off==1'b1)
            set_mode_off_1 <= 1'b0;
        else 
            if((set_mode_off_0==1'b1)&&(type_code_16==`TYPE_CODE_SET_MODE_OFF_1))
                set_mode_off_1 <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        set_mode_off_2 <= 1'b0;
    else
        if(set_mode_off==1'b1)
            set_mode_off_2 <= 1'b0;
        else
            if((set_mode_off_1==1'b1)&&(type_code_16==`TYPE_CODE_SET_MODE_OFF_2))
                set_mode_off_2 <= 1'b1;
end

assign _set_mode_off = set_mode_off_0&&set_mode_off_1&&set_mode_off_2;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        set_mode_off <= 1'b0;
    else
        if(set_mode_off==1'b1)
            set_mode_off <= 1'b0;
        else
            set_mode_off <= _set_mode_off;
end

//
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_load_to_fpga <= 1'b0;
    else
        //if((en_w_load_to_fpga==1'b1)||(set_mode==1'b0))
        //    en_w_load_to_fpga <= 1'b0;
        //else
        if((set_mode==1'b1)&&(type_code_16==`TYPE_CODE_SET_MODE_W_LOAD_TO_FPGA)&&(valid_fifo_in==1'b1))
            en_w_load_to_fpga <= 1'b1;
        else
            en_w_load_to_fpga <= 1'b0;
        //en_w_load_to_fpga <= _en_w_load_to_fpga;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        rst_n_memn2n_cmd <= 1'b1;
    else
        if(done_rst_n_memn2n_cmd==1'b1)
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
            if(type_code != `TYPE_CODE_RST_MEMN2N)
                done_rst_n_memn2n_cmd <= 1'b0;
end

assign en_count_rst_n_memn2n = en_rst_n_memn2n_cmd;

always@(*)
begin
    if((type_code == `TYPE_CODE_RST_MEMN2N)&&(done_rst_n_memn2n_cmd==1'b0)&&(set_mode==1'b0))
        en_rst_n_memn2n_cmd = 1'b1;
    else
        en_rst_n_memn2n_cmd = 1'b0;
end

always@(*)
begin
    if((type_code!=`TYPE_CODE_RST_MEMN2N)||(rst_n==1'b0)||(set_mode==1'b1))
        rst_n_count_rst_n_memn2n = 1'b0;
    else
        rst_n_count_rst_n_memn2n = 1'b1;
end

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

// debug
`ifdef DEBUG
`ifdef DEBUG_ILA
// ila
ila
ila_memn2n_controller
(
    .clk(clk),

    // 1 bit
    .probe0(rb_n_memory_network),
    .probe1(valid_fifo_in),
    .probe2(done_init_memn2n),
    .probe3(en_memory_network),
    .probe4(done_init),
    .probe5(rst_n_memn2n_cmd),
    .probe6(set_mode),
    .probe7(en_w_load_to_fpga),

    // 1 bit
    .probe8(en_rst_n_memn2n_cmd),
    .probe9(rst_n_count_rst_n_memn2n),
    .probe10(en_count_rst_n_memn2n),
    .probe11(done_rst_n_memn2n_cmd),
    .probe12(_set_mode_on),
    .probe13(_en_memory_network),
    .probe14(),
    .probe15(),

    // 16 bit
    .probe16(data_fifo_in),
    .probe17(data_out),
    .probe18(data_in),
    .probe19(data_in_fifo_out),
    .probe20(_data_in),
    .probe21(_data_in_fifo_out),
    .probe22(lr_l2),
    .probe23(din_exp_shift_bit),

    // 32 bit
    .probe24(),
    .probe25(data_out),
    .probe26(type_code),
    .probe27(type_code_16),
    .probe28(),
    .probe29(),
    .probe30(),
    .probe31(),

    // 1 bit
    .probe32(set_mode_on_0),
    .probe33(set_mode_on_1),
    .probe34(set_mode_on_2),
    .probe35(set_mode_off),
    .probe36(_set_mode_off),
    .probe37(set_mode_off_0),
    .probe38(set_mode_off_1),
    .probe39(set_mode_off_2),

    // 1 bit
    .probe40(),
    .probe41(),
    .probe42(),
    .probe43(),
    .probe44(),
    .probe45(),
    .probe46(),
    .probe47(),

    // 1 bit
    .probe48(),
    .probe49(),
    .probe50(),
    .probe51(),
    .probe52(),
    .probe53(),
    .probe54(),
    .probe55(),

    // 1 bit
    .probe56(),
    .probe57(),
    .probe58(),
    .probe59(),
    .probe60(),
    .probe61(),
    .probe62(),
    .probe63()
);
`endif  // DEBUG_ILA
`endif

endmodule




