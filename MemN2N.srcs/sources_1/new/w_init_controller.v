//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/10 23:44:36
// Design Name: 
// Module Name: w_init_controller
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

module w_init_controller
(
    // clock
    clk,
    // rst_n
    rst_n,
    // input
    en_w_load_to_fpga,
    valid_fifo_in,
    data_fifo_in,

    // output
    we,
    data_out,
    addr_out

    // debug
);

////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter BW_DATA_IN = `BW_DATA_IN;
parameter BW_DATA = `BW_DATA;
parameter NUM_W_MODULE = `NUM_W_MODULE;
parameter BW_DIM_EMB = `BW_DIM_EMB;
parameter DIM_EMB = `DIM_EMB;

////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clk
input wire clk;
// rst_n
input wire rst_n;
// input
input wire en_w_load_to_fpga;
input wire valid_fifo_in;
input wire [BW_DATA_IN-1:0] data_fifo_in;

// output
output reg we;
output wire [BW_DATA*DIM_EMB-1:0] data_out;
output reg [BW_DATA_IN-1:0] addr_out;

////////////////////////////////////////////////////////////
// internal signals
////////////////////////////////////////////////////////////
genvar i;

reg [BW_DATA-1:0] _data_out [0:DIM_EMB-1];

reg en_w_load_to_fpga_sync;

wire rst_n_count_buf_32;
wire en_count_buf_32;
wire count_count_buf_32;
wire done_count_buf_32;

wire rst_n_count_emb_vec;
wire en_count_emb_vec;
wire [BW_DIM_EMB-1:0] count_count_emb_vec;
wire done_count_emb_vec;

wire [BW_DIM_EMB-1:0] addr_emb_vec;

wire we_addr_out;
reg done_addr_out;

wire done;

wire [BW_DATA-1:0] _data_out_16_to_32;
wire [BW_DATA_IN-1:0] _ext_low_bit;

reg [BW_DATA-1:0] data_buf_32;
wire addr_data_buf_32;

wire we_data_out_buf_32;
reg we_data_out;

////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
assign we_addr_out = en_w_load_to_fpga_sync&&valid_fifo_in&&(!done_addr_out);
assign we_data_out_buf_32 = en_w_load_to_fpga_sync&&valid_fifo_in&&(done_addr_out);
//assign we_data_out = en_w_load_to_fpga_sync&&valid_fifo_in&&(done_addr_out)&en_count_emb_vec;

assign rst_n_count_buf_32 = rst_n&&en_w_load_to_fpga_sync;
assign en_count_buf_32 = en_w_load_to_fpga_sync&&done_addr_out&&valid_fifo_in;

assign rst_n_count_emb_vec = rst_n&&en_w_load_to_fpga_sync;
//assign en_count_emb_vec = en_w_load_to_fpga_sync&&done_addr_out&&valid_fifo_in&&done_count_buf_32;
assign en_count_emb_vec = we_data_out;

assign addr_data_buf_32 = count_count_buf_32;
assign addr_emb_vec = count_count_emb_vec;

assign done = en_w_load_to_fpga_sync&&done_count_emb_vec;

//assign _data_out_16_to_32 = (data_fifo_in[BW_DATA_IN]==1'b0)?  {data_fifo_in,16'h0000} : {data_fifo_in,16'hffff};  // only use MSB 16 bit, later should update fully load 32 bit
//assign _data_out_16_to_32 = {data_fifo_in,{16{data_fifo_in[31]}}};  // only use MSB 16 bit, later should update fully load 32 bit

//assign _ext_low_bit = (data_fifo_in[BW_DATA_IN-1]==1'b0) ? {(BW_DATA_IN){1'b0}}:{(BW_DATA_IN){1'b1}};
//assign _data_out_16_to_32 = {data_fifo_in,_ext_low_bit};

////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_w_load_to_fpga_sync <= 1'b0;
    else
        if(done==1'b1)
            en_w_load_to_fpga_sync <= 1'b0;
        else
            if(en_w_load_to_fpga_sync==1'b0)
                en_w_load_to_fpga_sync <= en_w_load_to_fpga;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        we <= 1'b0;
    else
        if(we==1'b0)
            we <= done;
        else
            we <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        we_data_out <= 1'b0;
    else
        if(done_count_buf_32==1'b1)
            we_data_out <= en_count_buf_32;
        else
            we_data_out <= 1'b0;

end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        data_buf_32 <= {32{1'b0}};
    else
        if(we_data_out_buf_32==1'b1)
            if(addr_data_buf_32==1'b0)
                data_buf_32[31:16] <= data_fifo_in;
            else
                data_buf_32[15:0] <= data_fifo_in;
end

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign data_out[(i+1)*BW_DATA-1-:BW_DATA] = _data_out[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                _data_out[i] <= {BW_DATA{1'b0}};
            else
                if((we_data_out==1'b1)&&(i==addr_emb_vec))
                    //_data_out[i] <= _data_out_16_to_32;
                    _data_out[i] <= data_buf_32;
        end
    end
endgenerate

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_addr_out <= 1'b0;
    else
        if(done==1'b1)
            done_addr_out <= 1'b0;
        else
            if(we_addr_out==1'b1)
                done_addr_out <=1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_out <= {BW_DATA_IN{1'b0}};
    else
        if(we_addr_out==1'b1)
            addr_out <= data_fifo_in;
end


////////////////////////////////////////////////////////////
// instance
////////////////////////////////////////////////////////////
counter
#(
    .BW(1),
    .COUNT_VALUE(1)
)
count_buf_32
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_count_buf_32),
    // input
    .en(en_count_buf_32),
    .en_hold_max(1'b0),
    // output
    .count(count_count_buf_32),
    .done(done_count_buf_32)
);

counter
#(
    .BW(BW_DIM_EMB+1),
    .COUNT_VALUE(DIM_EMB)
)
count_emb_vec
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_count_emb_vec),
    // input
    .en(en_count_emb_vec),
    .en_hold_max(1'b0),
    // output
    .count(count_count_emb_vec),
    .done(done_count_emb_vec)
);
////////////////////////////////////////////////////////////
// debug
////////////////////////////////////////////////////////////

`ifdef DEBUG
`ifdef DEBUG_ILA
// ila
ila
w_init_controller
(
    .clk(clk),

    // 1 bit
    .probe0(en_w_load_to_fpga),
    .probe1(valid_fifo_in),
    .probe2(we),
    .probe3(en_w_load_to_fpga_sync),
    .probe4(rst_n_count_emb_vec),
    .probe5(en_count_emb_vec),
    .probe6(done_count_emb_vec),
    .probe7(we_addr_out),

    // 1 bit
    .probe8(done_addr_out),
    .probe9(done),
    .probe10(),
    .probe11(),
    .probe12(),
    .probe13(),
    .probe14(),
    .probe15(),

    // 16 bit
    .probe16(data_fifo_in),
    .probe17(addr_out),
    .probe18(),
    .probe19(),
    .probe20(),
    .probe21(),
    .probe22(),
    .probe23(),

    // 32 bit
    .probe24(count_count_emb_vec),
    .probe25(addr_emb_vec),
    .probe26(_data_out[0]),
    .probe27(_data_out[1]),
    .probe28(_data_out[31]),
    .probe29(data_out[(0+1)*BW_DATA-1-:BW_DATA]),
    .probe30(data_out[(1+1)*BW_DATA-1-:BW_DATA]),
    .probe31(data_out[(31+1)*BW_DATA-1-:BW_DATA]),

    // 1 bit
    .probe32(),
    .probe33(),
    .probe34(),
    .probe35(),
    .probe36(),
    .probe37(),
    .probe38(),
    .probe39(),

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
