// 
// Create Date: 2016/08/27 18:04:08
// Design Name: 
// Module Name: memory_network_top
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

module memory_network_top
(
    // clk
    clk,
    // rst_sys
    rst_sys,
    en_init_sys,
    // input
    //fifo_in_rst,
    //fifo_out_rst,
    //full_fifo_out,
    empty_fifo_in,
    valid_fifo_in,
    valid_fifo_out,
    dout_fifo_in,
    done_init_memory_network,
    //lr_l2,
    // output
    rst_fifo_in,
    rst_fifo_out,
    rd_en_fifo_in,
    wr_en_fifo_out,
    din_fifo_out,
    // for debug
    rb_n_debug,
    dout_debug
);


////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter BW_DATA_IN = `BW_DATA_IN;
parameter BW_DATA = `BW_DATA;
parameter NUM_W_MODULE = `NUM_W_MODULE;
parameter DIM_EMB = `DIM_EMB;

////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clk
input wire clk;
// rst_sys
input wire rst_sys;
input wire en_init_sys;
// input
//input wire fifo_in_rst;
//input wire fifo_out_rst;
//input wire full_fifo_out;
input wire empty_fifo_in;
input wire valid_fifo_in;
input wire valid_fifo_out;
input wire [BW_DATA_IN-1:0] dout_fifo_in;
input wire done_init_memory_network;
//input wire [7:0] lr_l2;
// output
output reg rst_fifo_in;
output reg rst_fifo_out;
output reg rd_en_fifo_in;
output reg wr_en_fifo_out;
output reg [BW_DATA_IN-1:0] din_fifo_out;
// for debug
output reg rb_n_debug;
output reg [7:0] dout_debug;


////////////////////////////////////////////////////////////
// internals
////////////////////////////////////////////////////////////
wire rst_n;

wire rst_n_memn2n;
wire rst_n_memn2n_cmd;

wire en;
wire en_init;
wire [BW_DATA_IN-1:0] data_in;

wire rb_n;
wire done_init_memn2n;
wire [BW_DATA_IN-1:0] data_out;
wire done_init;

// output
wire _rst_fifo_in;
wire _rst_fifo_out;
wire _rd_en_fifo_in;
wire _wr_en_fifo_out;
wire [BW_DATA_IN-1:0] _din_fifo_out;
// for debug
wire _rb_n_debug;
wire [7:0] _dout_debug;

//
wire [7:0] lr_l2;
reg [7:0] reg_lr_l2;

wire [7:0] din_exp_shift_bit;
reg [7:0] reg_din_exp_shift_bit;


wire en_w_load_to_fpga;

wire we_w_init;
wire [BW_DATA*DIM_EMB-1:0] data_out_w_init;
wire [BW_DATA_IN-1:0] addr_out_w_init;

////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
assign _rb_n_debug = rb_n;
assign _dout_debug = data_out[7:0];

assign rst_n_memn2n = rst_n && rst_n_memn2n_cmd;

////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0) 
        rst_fifo_in <= 1'b0;
    else
        rst_fifo_in <= _rst_fifo_in;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0) 
        rst_fifo_out <= 1'b0;
    else
        rst_fifo_out <= _rst_fifo_out;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0) 
        rd_en_fifo_in <= 1'b0;
    else
        rd_en_fifo_in <= _rd_en_fifo_in;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0) 
        wr_en_fifo_out <= 1'b0;
    else
        wr_en_fifo_out <= _wr_en_fifo_out;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0) 
        din_fifo_out <= {BW_DATA_IN{1'b0}};
    else
        din_fifo_out <= _din_fifo_out;
end


// for debug
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0) 
        rb_n_debug <= 1'b1;
    else
        rb_n_debug <= _rb_n_debug;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0) 
        dout_debug <= 8'b0;
    else
        dout_debug <= _dout_debug;
end

//
/*
`ifdef INFER_ONLY_MODE
always@(posedge clk)
begin
    reg_lr_l2 <= 8'b0;
end

always@(posedge clk)
begin
    reg_din_exp_shift_bit <= 8'b0;
end
`else
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_lr_l2 <= 8'b0;
    else
        reg_lr_l2 <= lr_l2;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_din_exp_shift_bit <= 8'b0;
    else
        reg_din_exp_shift_bit <= din_exp_shift_bit;
end
`endif
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_lr_l2 <= 8'b0;
    else
        reg_lr_l2 <= lr_l2;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_din_exp_shift_bit <= 8'b0;
    else
        reg_din_exp_shift_bit <= din_exp_shift_bit;
end


////////////////////////////////////////////////////////////
// instances
////////////////////////////////////////////////////////////
memory_network_controller
memory_network_control
(
    // clk
    .clk(clk),
    // rst_n
    .rst_n(rst_n),
    // input
    .rb_n_memory_network(rb_n),
    .valid_fifo_in(valid_fifo_in),
    .done_init_memn2n(done_init_memn2n),
    .data_fifo_in(dout_fifo_in),
    .data_out(data_out),
    // output
    .en_memory_network(en),
    .done_init(done_init),
    .data_in(data_in),
    .data_in_fifo_out(_din_fifo_out),
    .lr_l2(lr_l2),
    .din_exp_shift_bit(din_exp_shift_bit),
    .rst_n_memn2n_cmd(rst_n_memn2n_cmd),
    .en_w_load_to_fpga(en_w_load_to_fpga)
);


io_top
io_top_memory_network
(
    // clk
    .clk(clk),
    // input
    .rst_sys(rst_sys),
    .en_init_sys(en_init_sys),
    // output
    .rst(),
    .rst_n(rst_n),
    .en_init(en_init)
);

fifo_io_controller
fifo_io_control
(
    // clk
    .clk(clk),
    // rst_n
    .rst(!rst_n),
    .fifo_in_rst(!rst_n),
    .fifo_out_rst(!rst_n),
    // input
    .done_init_memory_network(done_init_memory_network),
    .rb_n_memory_network(rb_n),
    .en_memory_network(en),
    .empty_fifo_in(empty_fifo_in),
    .valid_fifo_in(valid_fifo_in),
    .done_memory_network(done_memn2n),
    // output
    .rst_fifo_in(_rst_fifo_in),
    .rst_fifo_out(_rst_fifo_out),
    .re_fifo_in(_rd_en_fifo_in),
    .we_fifo_out(_wr_en_fifo_out)
);

memory_network
memory_network_i
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_memn2n),
    // input,
    .en(en),
    .en_init(en_init),
    .data_in(data_in),
    .lr_l2(reg_lr_l2),
    .din_exp_shift_bit(reg_din_exp_shift_bit),
    .we_w_init(we_w_init),
    .data_w_init(data_out_w_init),
    .addr_w_init(addr_out_w_init),
    // output
    .rb_n(rb_n),
    .done_init(done_init_memn2n),
    .done(done_memn2n),
    .data_out(data_out)
);

w_init_controller
w_init_controller_i
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input,
    .en_w_load_to_fpga(en_w_load_to_fpga),
    .valid_fifo_in(valid_fifo_in),
    .data_fifo_in(dout_fifo_in),
    // output
    .we(we_w_init),
    .data_out(data_out_w_init),
    .addr_out(addr_out_w_init)
 
);

`ifdef DEBUG

/*
`ifdef DEBUG_ILA
// ila
ila
ila_memn2n
(
    .clk(clk),

    // 1 bit
    .probe0(rb_n),
    // memory network controller
    .probe1(valid_fifo_in),
    .probe2(done_init_memn2n),
    .probe3(en),
    .probe4(done_init),
    .probe5(rst_n_memn2n_cmd),
    //
    .probe6(done_init_memn2n),
    .probe7(done_memn2n),

    // 1 bit
    // fifo controller
    .probe8(empty_fifo_in),
    .probe9(valid_fifo_in),
    .probe10(_rd_en_fifo_in),
    .probe11(_wr_en_fifo_out),
    .probe12(),
    .probe13(),
    .probe14(),
    .probe15(),

    // 16 bit
    .probe16(dout_fifo_in),
    .probe17(data_out),
    .probe18(data_in),
    .probe19(_din_fifo_out),
    .probe20(reg_lr_l2),
    .probe21(reg_din_exp_shift_bit),
    .probe22(),
    .probe23(),

    // 32 bit
    .probe24(),
    .probe25(),
    .probe26(),
    .probe27(),
    .probe28(),
    .probe29(),
    .probe30(),
    .probe31()

);
`endif  // DEBUG_ILA
*/

`endif  // DEBUG

endmodule
