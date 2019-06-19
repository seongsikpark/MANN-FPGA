`timescale 1ns / 100ps
`include "common.h"


module xillydemo
(
    clk_sys_in1_p,    // input clk_in1_p
    clk_sys_in1_n,    // input clk_in1_n
    rst_sys,
    rst_button,
    en_init_sys,
    PCIE_PERST_B_LS,
    PCIE_REFCLK_N,
    PCIE_REFCLK_P,
    PCIE_RX_N,
    PCIE_RX_P,
    GPIO_LED,
    PCIE_TX_N,
    PCIE_TX_P
);


parameter BW_DATA_IN = `BW_DATA_IN;

parameter BW_DIM_IN = `BW_DIM_IN;
parameter BW_DIM_EMB = `BW_DIM_EMB;

parameter DIM_IN = `BW_DIM_IN;
parameter DIM_EMB = 1<<BW_DIM_EMB;

parameter BW_DATA = `BW_DATA_EMB_W;
parameter BW_ADDR = `CLOG2(BW_DIM_IN);        // should make it parameterable

parameter NUM_MEM = `NUM_MEM;

parameter BW_DATA_EMB_W = `BW_DATA_EMB_W;

parameter BW_WORD_VEC = `BW_WORD_VEC;

parameter NUM_ITR = `NUM_ITR;

parameter MAX_TEST_INPUT = 500000;


//
input wire clk_sys_in1_p;    // input clk_in1_p
input wire clk_sys_in1_n;    // input clk_in1_n
input wire rst_sys;
input wire rst_button;
input wire en_init_sys;

//
input wire PCIE_PERST_B_LS;
input wire PCIE_REFCLK_N;
input wire PCIE_REFCLK_P;
input wire [7:0] PCIE_RX_N;
input wire [7:0] PCIE_RX_P;
output wire [7:0] GPIO_LED;
output wire [7:0] PCIE_TX_N;
output wire [7:0] PCIE_TX_P;


// Clock and quiesce
wire  clk_pcie;
wire  quiesce;


// Wires related to /dev/xillybus_mem_8
/*
wire  user_r_mem_8_rden;
wire  user_r_mem_8_empty;
wire [7:0] user_r_mem_8_data;
wire  user_r_mem_8_eof;
wire  user_r_mem_8_open;
wire  user_w_mem_8_wren;
wire  user_w_mem_8_full;
wire [7:0] user_w_mem_8_data;
wire  user_w_mem_8_open;
wire [4:0] user_mem_8_addr;
wire  user_mem_8_addr_update;
*/

// Wires related to /dev/xillybus_read_16
wire  user_r_read_16_rden;
wire  user_r_read_16_empty;
wire [15:0] user_r_read_16_data;
wire  user_r_read_16_eof;
(* DONT_TOUCH="yes" *) wire  user_r_read_16_open;
wire user_r_read_16_val;


// Wires related to /dev/xillybus_read_32
/*
wire  user_r_read_32_rden;
wire  user_r_read_32_empty;
wire [31:0] user_r_read_32_data;
wire  user_r_read_32_eof;
wire  user_r_read_32_open;
*/

// Wires related to /dev/xillybus_read_8
/*
wire  user_r_read_8_rden;
wire  user_r_read_8_empty;
wire [7:0] user_r_read_8_data;
wire  user_r_read_8_eof;
wire  user_r_read_8_open;
*/

// Wires related to /dev/xillybus_write_16
wire  user_w_write_16_wren;
wire  user_w_write_16_full;
wire [15:0] user_w_write_16_data;
(* DONT_TOUCH="yes" *) wire  user_w_write_16_open;

// Wires related to /dev/xillybus_write_32
/*
wire  user_w_write_32_wren;
wire  user_w_write_32_full;
wire [31:0] user_w_write_32_data;
wire  user_w_write_32_open;
*/

// Wires related to /dev/xillybus_write_8
/*
wire  user_w_write_8_wren;
wire  user_w_write_8_full;
wire [7:0] user_w_write_8_data;
wire  user_w_write_8_open;

// fifo - 8 bit
wire [8-1:0] user_w_write_8_data_fifo_in;
wire [8-1:0] user_r_read_8_data_fifo_in;
wire user_w_write_8_wren_fifo_in;
wire user_r_read_8_rden_fifo_in;
wire user_w_write_8_full_fifo_in;
wire user_r_read_8_empty_fifo_in;
wire user_r_read_8_val_fifo_in;
*/

//
wire [16-1:0] user_w_write_16_data_fifo_in;
wire [16-1:0] user_r_read_16_data_fifo_in;
wire user_w_write_16_wren_fifo_in;
wire user_r_read_16_rden_fifo_in;
wire user_w_write_16_full_fifo_in;
wire user_r_read_16_empty_fifo_in;
wire user_r_read_16_val_fifo_in;

wire [16-1:0] user_w_write_16_data_fifo_out;
wire [16-1:0] user_r_read_16_data_fifo_out;
wire user_w_write_16_wren_fifo_out;
wire user_r_read_16_rden_fifo_out;
wire user_w_write_16_full_fifo_out;
wire user_r_read_16_empty_fifo_out;
wire user_r_read_16_val_fifo_out;



//(* DONT_TOUCH="yes" *) wire rst_fifo_in;
//(* DONT_TOUCH="yes" *) wire rst_fifo_out;

//assign rst_fifo_in = !user_w_write_16_open;
//assign rst_fifo_out = !user_r_read_16_open;

wire clk;
wire rst_n;
wire en;
wire en_init;

wire [BW_DATA_IN-1:0] data_in;

wire rb_n_debug;
wire [BW_DATA_IN-1:0] data_out;

// internal


//
//wire [16-1:0] fifo_in_data;
//wire [16-1:0] fifo_out_data;

wire done_init;
wire done_init_memn2n;
wire done_memn2n;

//
//wire en_init_cmd;
wire en_init_memn2n;

//assign en_init_memn2n = en_init_sys | en_init_cmd;
assign en_init_memn2n = en_init_sys;

// 
wire rst_memn2n;
//wire rst_memn2n_by_fifo;
//wire rst_n_memn2n_cmd;

//assign rst_memn2n_by_fifo = !user_w_write_16_open && !user_r_read_16_open;
//assign rst_memn2n = rst_sys || rst_button || rst_memn2n_by_fifo || rst_memn2n_cmd;
//assign rst_memn2n = rst_sys || rst_button || !rst_n_memn2n_cmd;
assign rst_memn2n = rst_sys || rst_button;


//
/*
wire [7:0] lr_l2;
reg [7:0] reg_lr_l2;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_lr_l2 <= 8'b0;
    else
        reg_lr_l2 <= lr_l2;
end
*/


/*
// for debug
wire done_count_clk;
wire done_count_clk_pcie_1;
wire done_count_clk_pcie_2;


wire rb_n_debug;

reg gpio_led_7;
reg gpio_led_6;
reg gpio_led_5;
*/

/*
always@(posedge clk)
begin
    if(rst_sys == 1'b1)
        gpio_led_7 <= 1'b0;
    else
        if(done_count_clk==1'b1)
            gpio_led_7 <= ~gpio_led_7;
end
*/

/*
always@(posedge clk_pcie)
begin
    if(rst_sys == 1'b1)
        gpio_led_6 <= 1'b0;
    else
        if(done_count_clk_pcie_1)
            gpio_led_6 <= ~gpio_led_6;
end
*/

/*
always@(posedge clk_pcie)
begin
    if(rst_sys == 1'b1)
        gpio_led_5 <= 1'b0;
    else
        if(done_count_clk_pcie_2)
            gpio_led_5 <= ~gpio_led_5;
end
*/

/*
always@(posedge clk or posedge rst_sys)
begin
    if(rst_sys == 1'b1)
        gpio_led_7 <= 1'b0;
    else
        if(user_r_read_16_empty_fifo_in==1'b0)
            gpio_led_7 <= 1'b1;
end
*/


/*
reg gpio_led_3;
reg gpio_led_2;
reg gpio_led_1;

always@(posedge clk or posedge rst_sys)
begin
    if(rst_sys==1'b1)
        gpio_led_3 <= 1'b0;
    else
        if(user_w_write_16_wren_fifo_out==1'b1)
            gpio_led_3 <= 1'b1;
end

always@(posedge clk or posedge rst_sys)
begin
    if(rst_sys==1'b1)
        gpio_led_2 <= 1'b0;
    else
        if(user_r_read_16_val_fifo_in==1'b1)
            gpio_led_2 <= 1'b1;
end

always@(posedge clk or posedge rst_sys)
begin
    if(rst_sys==1'b1)
        gpio_led_1 <= 1'b0;
    else
        if(user_r_read_16_val_fifo_out==1'b1)
            gpio_led_1 <= 1'b1;
end

*/
//wire [7:0] dout_debug;

//assign GPIO_LED = dout_debug;

/*
assign GPIO_LED[7] = user_r_read_16_empty_fifo_in;
assign GPIO_LED[6] = user_w_write_16_full_fifo_in;
assign GPIO_LED[5] = user_r_read_16_empty_fifo_out;
assign GPIO_LED[4] = user_w_write_16_full_fifo_out;
assign GPIO_LED[3] = gpio_led_3;
assign GPIO_LED[2] = gpio_led_2;
assign GPIO_LED[1] = gpio_led_1;
*/

(* DONT_TOUCH="yes" *)
xillybus xillybus_ins (
    // Ports related to /dev/xillybus_mem_8
    // FPGA to CPU signals:
    /*
    .user_r_mem_8_rden(user_r_mem_8_rden),
    .user_r_mem_8_empty(user_r_mem_8_empty),
    .user_r_mem_8_data(user_r_mem_8_data),
    .user_r_mem_8_eof(user_r_mem_8_eof),
    .user_r_mem_8_open(user_r_mem_8_open),
  
    // CPU to FPGA signals:
    .user_w_mem_8_wren(user_w_mem_8_wren),
    .user_w_mem_8_full(user_w_mem_8_full),
    .user_w_mem_8_data(user_w_mem_8_data),
    .user_w_mem_8_open(user_w_mem_8_open),
  
    // Address signals:
    .user_mem_8_addr(user_mem_8_addr),
    .user_mem_8_addr_update(user_mem_8_addr_update),
    */
  
    // Ports related to /dev/xillybus_read_16
    // FPGA to CPU signals:
    .user_r_read_16_rden(user_r_read_16_rden),
    .user_r_read_16_empty(user_r_read_16_empty),
    .user_r_read_16_data(user_r_read_16_data),
    .user_r_read_16_eof(user_r_read_16_eof),
    .user_r_read_16_open(user_r_read_16_open),
  
  
    // Ports related to /dev/xillybus_read_32
    /*
    // FPGA to CPU signals:
    .user_r_read_32_rden(user_r_read_32_rden),
    .user_r_read_32_empty(user_r_read_32_empty),
    .user_r_read_32_data(user_r_read_32_data),
    .user_r_read_32_eof(user_r_read_32_eof),
    .user_r_read_32_open(user_r_read_32_open),
    */
  
    // Ports related to /dev/xillybus_read_8
    // FPGA to CPU signals:
    /*
    .user_r_read_8_rden(user_r_read_8_rden),
    .user_r_read_8_empty(user_r_read_8_empty),
    .user_r_read_8_data(user_r_read_8_data),
    .user_r_read_8_eof(user_r_read_8_eof),
    .user_r_read_8_open(user_r_read_8_open),
    */
  
  
    // Ports related to /dev/xillybus_write_16
    // CPU to FPGA signals:
    .user_w_write_16_wren(user_w_write_16_wren),
    .user_w_write_16_full(user_w_write_16_full),
    .user_w_write_16_data(user_w_write_16_data),
    .user_w_write_16_open(user_w_write_16_open),
  
  
    // Ports related to /dev/xillybus_write_32
    /*
    // CPU to FPGA signals:
    .user_w_write_32_wren(user_w_write_32_wren),
    .user_w_write_32_full(user_w_write_32_full),
    .user_w_write_32_data(user_w_write_32_data),
    .user_w_write_32_open(user_w_write_32_open),
    */
  
  
    // Ports related to /dev/xillybus_write_8
    // CPU to FPGA signals:
    /*
    .user_w_write_8_wren(user_w_write_8_wren),
    .user_w_write_8_full(user_w_write_8_full),
    .user_w_write_8_data(user_w_write_8_data),
    .user_w_write_8_open(user_w_write_8_open),
    */
  
  
    // General signals
    .PCIE_PERST_B_LS(PCIE_PERST_B_LS),
    .PCIE_REFCLK_N(PCIE_REFCLK_N),
    .PCIE_REFCLK_P(PCIE_REFCLK_P),
    .PCIE_RX_N(PCIE_RX_N),
    .PCIE_RX_P(PCIE_RX_P),
    .GPIO_LED(GPIO_LED[3:0]),
    .PCIE_TX_N(PCIE_TX_N),
    .PCIE_TX_P(PCIE_TX_P),
    .bus_clk(clk_pcie),
    .quiesce(quiesce)
);

//


/*
// reset bridge - wr_rst_fifo_in
(* DONT_TOUCH="yes" *) reg wr_rst_fifo_in;
(* DONT_TOUCH="yes" *) reg wr_rst_fifo_in_meta;
(* DONT_TOUCH="yes" *) wire wr_rst_fifo_in_async;

assign wr_rst_fifo_in_async = !user_w_write_16_open;

always@(posedge clk_pcie or posedge wr_rst_fifo_in_async)
begin
    if(wr_rst_fifo_in_async==1'b1)
        wr_rst_fifo_in_meta <= 1'b1;
    else
        wr_rst_fifo_in_meta <= 1'b0;
end

always@(posedge clk_pcie or posedge wr_rst_fifo_in_async)
begin
    if(wr_rst_fifo_in_async==1'b1)
        wr_rst_fifo_in <= 1'b1;
    else
        wr_rst_fifo_in <= wr_rst_fifo_in_meta;
end

// reset bridge - rd_rst_fifo_in
(* DONT_TOUCH="yes" *) reg rd_rst_fifo_in;
(* DONT_TOUCH="yes" *) reg rd_rst_fifo_in_meta;
(* DONT_TOUCH="yes" *) wire rd_rst_fifo_in_async;

assign rd_rst_fifo_in_async = !user_w_write_16_open;

always@(posedge clk or posedge rd_rst_fifo_in_async)
begin
    if(rd_rst_fifo_in_async==1'b1)
        rd_rst_fifo_in_meta <= 1'b1;
    else
        rd_rst_fifo_in_meta <= 1'b0;
end

always@(posedge clk or posedge rd_rst_fifo_in_async)
begin
    if(rd_rst_fifo_in_async==1'b1)
        rd_rst_fifo_in <= 1'b1;
    else
        rd_rst_fifo_in <= rd_rst_fifo_in_meta;
end

// reset bridge - wr_rst_fifo_out
(* DONT_TOUCH="yes" *) reg wr_rst_fifo_out;
(* DONT_TOUCH="yes" *) reg wr_rst_fifo_out_meta;
(* DONT_TOUCH="yes" *) wire wr_rst_fifo_out_async;

assign wr_rst_fifo_out_async = !user_r_read_16_open;

always@(posedge clk or posedge wr_rst_fifo_out_async)
begin
    if(wr_rst_fifo_out_async==1'b1)
        wr_rst_fifo_out_meta <= 1'b1;
    else
        wr_rst_fifo_out_meta <= 1'b0;
end

always@(posedge clk or posedge wr_rst_fifo_out_async)
begin
    if(wr_rst_fifo_out_async==1'b1)
        wr_rst_fifo_out <= 1'b1;
    else
        wr_rst_fifo_out <= wr_rst_fifo_out_meta;
end

// reset bridge - rd_rst_fifo_out
(* DONT_TOUCH="yes" *) reg rd_rst_fifo_out;
(* DONT_TOUCH="yes" *) reg rd_rst_fifo_out_meta;
(* DONT_TOUCH="yes" *) wire rd_rst_fifo_out_async;

assign rd_rst_fifo_out_async = !user_r_read_16_open;

always@(posedge clk_pcie or posedge rd_rst_fifo_out_async)
begin
    if(rd_rst_fifo_out_async==1'b1)
        rd_rst_fifo_out_meta <= 1'b1;
    else
        rd_rst_fifo_out_meta <= 1'b0;
end

always@(posedge clk_pcie or posedge rd_rst_fifo_out_async)
begin
    if(rd_rst_fifo_out_async==1'b1)
        rd_rst_fifo_out <= 1'b1;
    else
        rd_rst_fifo_out <= rd_rst_fifo_out_meta;
end
*/

// reset bridge - wr_rst_fifo_in
/*
(* DONT_TOUCH="yes" *) reg wr_rst_fifo_in;
(* DONT_TOUCH="yes" *) reg wr_rst_fifo_in_meta;

always@(posedge clk_pcie)
begin
    wr_rst_fifo_in_meta <= !user_w_write_16_open;
end

always@(posedge clk_pcie)
begin
    wr_rst_fifo_in <= wr_rst_fifo_in_meta;
end

// reset bridge - rd_rst_fifo_in
(* DONT_TOUCH="yes" *) reg rd_rst_fifo_in;
(* DONT_TOUCH="yes" *) reg rd_rst_fifo_in_meta;

always@(posedge clk)
begin
    rd_rst_fifo_in_meta <= !user_w_write_16_open;
end

always@(posedge clk)
begin
    rd_rst_fifo_in <= rd_rst_fifo_in_meta;
end

// reset bridge - wr_rst_fifo_out
(* DONT_TOUCH="yes" *) reg wr_rst_fifo_out;
(* DONT_TOUCH="yes" *) reg wr_rst_fifo_out_meta;

always@(posedge clk)
begin
    wr_rst_fifo_out_meta <= !user_r_read_16_open;
end

always@(posedge clk)
begin
    wr_rst_fifo_out <= wr_rst_fifo_out_meta;
end

// reset bridge - rd_rst_fifo_out
(* DONT_TOUCH="yes" *) reg rd_rst_fifo_out;
(* DONT_TOUCH="yes" *) reg rd_rst_fifo_out_meta;

always@(posedge clk_pcie)
begin
    rd_rst_fifo_out_meta <= !user_r_read_16_open;
end

always@(posedge clk_pcie)
begin
    rd_rst_fifo_out <= rd_rst_fifo_out_meta;
end

*/

// reset bridge - rst_fifo_in 8 bit
/*
(* DONT_TOUCH="yes" *) reg rst_fifo_in_8;
(* DONT_TOUCH="yes" *) reg rst_fifo_in_8_meta;

always@(posedge clk_pcie)
begin
    rst_fifo_in_8_meta <= !user_w_write_8_open;
end

always@(posedge clk_pcie)
begin
    rst_fifo_in_8 <= rst_fifo_in_8_meta;
end
*/

// reset bridge - rst_fifo_in
(* DONT_TOUCH="yes" *) reg rst_fifo_in;
(* DONT_TOUCH="yes" *) reg rst_fifo_in_meta;

always@(posedge clk_pcie)
begin
    //rst_fifo_in_meta <= !user_w_write_16_open;
    //rst_fifo_in_meta <= !(user_w_write_16_open&&user_r_read_16_open);
    rst_fifo_in_meta <= !user_w_write_16_open;
end

always@(posedge clk_pcie)
begin
    rst_fifo_in <= rst_fifo_in_meta;
end

// reset bridge - rst_fifo_out
(* DONT_TOUCH="yes" *) reg rst_fifo_out;
(* DONT_TOUCH="yes" *) reg rst_fifo_out_meta;

/*
always@(posedge clk)
begin
    rst_fifo_out_meta <= !user_r_read_16_open;
end

always@(posedge clk)
begin
    rst_fifo_out <= rst_fifo_out_meta;
end
*/
always@(posedge clk)
begin
    rst_fifo_out_meta <= !user_w_write_16_open;
    //rst_fifo_out_meta <= !(user_w_write_16_open&&user_r_read_16_open);
    //rst_fifo_out_meta <= !user_r_read_16_open;
end

always@(posedge clk)
begin
    rst_fifo_out <= rst_fifo_out_meta;
end

// fifo in - 8 bit
/*
assign user_w_write_8_data_fifo_in = user_w_write_8_data;
assign user_w_write_8_wren_fifo_in = user_w_write_8_wren;
assign user_w_write_8_full = user_w_write_8_full_fifo_in;
*/

// fifo in
assign user_w_write_16_data_fifo_in = user_w_write_16_data;
assign user_w_write_16_wren_fifo_in = user_w_write_16_wren;
assign user_w_write_16_full = user_w_write_16_full_fifo_in;

// fifo out
assign user_r_read_16_rden_fifo_out = user_r_read_16_rden;
assign user_r_read_16_data = user_r_read_16_data_fifo_out;
assign user_r_read_16_empty = user_r_read_16_empty_fifo_out;


/*
fifo_host_to_fpga_8x512
fifo_in_8
(
    .srst(rst_fifo_in_8),
    .wr_clk(clk_pcie),
    .rd_clk(clk),
    .din(user_w_write_8_data_fifo_in),
    .wr_en(user_w_write_8_wren_fifo_in),
    .rd_en(user_r_read_8_rden_fifo_in),
    .dout(user_r_read_8_data_fifo_in),
    .full(user_w_write_8_full_fifo_in),
    .empty(user_r_read_8_empty_fifo_in),
    .valid(user_r_read_8_val_fifo_in)
);
*/

fifo_host_to_fpga_16x1024
fifo_in_16
(
    //.wr_rst(wr_rst_fifo_in),
    //.rd_rst(rd_rst_fifo_in),
    //.srst(rd_rst_fifo_in),
    .srst(rst_fifo_in),
    .wr_clk(clk_pcie),
    .rd_clk(clk),
    .din(user_w_write_16_data_fifo_in),
    .wr_en(user_w_write_16_wren_fifo_in),
    .rd_en(user_r_read_16_rden_fifo_in),
    .dout(user_r_read_16_data_fifo_in),
    .full(user_w_write_16_full_fifo_in),
    .empty(user_r_read_16_empty_fifo_in),
    .valid(user_r_read_16_val_fifo_in)
);

fifo_fpga_to_host_16x1024
fifo_out_16
(
    //.wr_rst(wr_rst_fifo_out),
    //.rd_rst(rd_rst_fifo_out),
    //.srst(rd_rst_fifo_out),
    .srst(rst_fifo_out),
    .wr_clk(clk),
    .rd_clk(clk_pcie),
    .din(user_w_write_16_data_fifo_out),
    .wr_en(user_w_write_16_wren_fifo_out),
    .rd_en(user_r_read_16_rden_fifo_out),
    .dout(user_r_read_16_data_fifo_out),
    .full(user_w_write_16_full_fifo_out),
    .empty(user_r_read_16_empty_fifo_out),
    .valid(user_r_read_16_val_fifo_out)
);

memory_network_top
memory_network_top_module
(
    // clk
    .clk(clk),
    // rst_sys
    .rst_sys(rst_memn2n),
    //.en_init_sys(en_init_sys),
    .en_init_sys(en_init_memn2n),
    // input
    //.full_fifo_out(user_w_write_16_full_fifo_out),
    .empty_fifo_in(user_r_read_16_empty_fifo_in),
    .valid_fifo_in(user_r_read_16_val_fifo_in),
    .valid_fifo_out(user_r_read_16_val_fifo_out),
    .dout_fifo_in(user_r_read_16_data_fifo_in),
    .done_init_memory_network(1'b1),                // modify point
    //.lr_l2(reg_lr_l2),
    // output
    //.rst_fifo_in(rst_fifo_in),
    //.rst_fifo_out(rst_fifo_out),
    .rd_en_fifo_in(user_r_read_16_rden_fifo_in),
    .wr_en_fifo_out(user_w_write_16_wren_fifo_out),
    .din_fifo_out(user_w_write_16_data_fifo_out),
    .rb_n_debug(rb_n_debug)
    //.dout_debug(dout_debug)
);


/*
// modify to debugger
global_controller
global_controller_module
(
    // clk
    .clk(clk),
    // rst_n
    .rst_n(!rst_sys),
    // input
    .confirm(user_w_write_8_wren),
    .command(user_w_write_8_data),
    .rb_n(rb_n_debug),
    //.fifo_in_full(user_w_write_16_full_fifo_in),
    .fifo_in_full(1'b1),
    //.fifo_in_empty(user_r_read_16_empty_fifo_in),
    .fifo_in_empty(1'b1),
    //.fifo_out_full(user_w_write_16_full_fifo_out),
    .fifo_out_full(1'b1),
    //.fifo_out_empty(user_r_read_16_empty_fifo_out),
    .fifo_out_empty(1'b1),
    // output
    .dout(user_r_read_8_data)
);
*/

/*
global_controller
global_controller_module
(
    // clk
    .clk(clk),
    // rst_n
    .rst_n(!(rst_sys||rst_button)),
    // input
    .empty_fifo_in(user_r_read_8_empty_fifo_in),
    .valid_fifo_in(user_r_read_8_val_fifo_in),
    .data_fifo_in(user_r_read_8_data_fifo_in),
    // output
    .re_fifo_in(user_r_read_8_rden_fifo_in),
    .en_init_cmd(en_init_cmd),
    .lr_l2(),
    .rst_n_memn2n_cmd(rst_n_memn2n_cmd)
);
*/

// sys clock 
clk_wiz_0
clk_wiz_sys_clk
(
    // Clock in ports
    .clk_in1_p(clk_sys_in1_p),    // input clk_in1_p
    .clk_in1_n(clk_sys_in1_n),    // input clk_in1_n
    // Clock out ports
    .clk_out1(clk),     // output clk_out1
    // Status and control signals
    .resetn(!(rst_sys||rst_button)) // input resetn
//    .locked(locked));      // output locked
);

`ifdef DEBUG

/*
`ifdef DEBUG_ILA
// integrated logic analyzer
ila
ila_top
(
    .clk(clk),

    // 1 bit
    .probe0(rst_fifo_in),
    .probe1(rst_fifo_out),
    .probe2(user_w_write_16_full_fifo_in),
    .probe3(user_r_read_16_empty_fifo_in),
    .probe4(user_w_write_16_full_fifo_out),
    .probe5(user_r_read_16_empty_fifo_out),
    .probe6(),
    .probe7(rb_n_debug),

    // 1 bit
    .probe8(user_r_read_16_rden_fifo_in),
    .probe9(user_w_write_16_wren_fifo_out),
    .probe10(rst_memn2n),
    .probe11(rst_sys),
    .probe12(rst_button),
    .probe13(rst_n_memn2n_cmd),
    .probe14(),
    .probe15(),

    // 16 bit
    .probe16(user_w_write_16_data_fifo_out),        // din memn2n
    .probe17(user_r_read_16_data_fifo_in),          // dout memn2n
    .probe18(user_r_read_8_data_fifo_in),           // din cmd (dout of fifo 8)
    .probe19(),
    .probe20(),
    .probe21(),
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
    .probe31(),

    // 1 bit - fifo 8 bit
    .probe32(rst_fifo_in_8),
    .probe33(user_w_write_8_wren_fifo_in),
    .probe34(user_r_read_8_rden_fifo_in),
    .probe35(user_w_write_8_full_fifo_in),
    .probe36(user_r_read_8_empty_fifo_in),
    .probe37(),
    .probe38(),
    .probe39()
);
`endif  // DEBUG_ILA
*/

`endif  // DEBUG


endmodule
