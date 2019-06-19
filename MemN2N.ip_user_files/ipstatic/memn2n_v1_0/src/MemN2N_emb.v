//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/18 17:44:59
// Design Name: 
// Module Name: MemN2N_emb
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

module MemN2N_emb
(
    // clock
    clk,
    // reset_n
    rst_n,
    // input
    en,
    en_init_w,
    f_w_up,
    data_in,
    grad_in,
    // output
    data_out,
    grad_out,
    done_data_out
);


parameter BW_DIM_IN = `BW_DIM_IN;
parameter BW_DIM_EMB = `BW_DIM_EMB;

parameter DIM_IN = BW_DIM_IN;
parameter DIM_EMB = 1<<BW_DIM_EMB;

parameter BW_DATA = `BW_DATA_EMB_W;
//parameter BW_ADDR = `CLOG2(BW_DIM_IN);        // should make it parameterable
parameter BW_ADDR = 5;        // should make it parameterable

parameter BW_COUNTER_IN = `CLOG2(BW_DIM_IN);
//parameter COUNT_VALUE_IN = (1 << BW_COUNTER_IN) - 1;
parameter COUNT_VALUE_IN = DIM_IN-1;

// clock
input wire clk;
// reset_n
input wire rst_n;
// input
input wire en;
input wire en_init_w;
input wire f_w_up;
input wire [DIM_IN-1:0] data_in;
input wire [BW_DATA*DIM_EMB-1:0] grad_in;
// output
output wire [BW_DATA*DIM_EMB-1:0] data_out;
output reg [BW_DATA*DIM_IN-1:0] grad_out;
output wire done_data_out;



// internal
wire [BW_COUNTER_IN-1:0] count_addr_w_in;
reg en_addr_w_in;
wire rst_n_addr_w_in;

reg f_done;

reg [BW_DIM_IN-1:0] buf_in;
reg [BW_DATA*DIM_EMB-1:0] buf_out;
wire [BW_DATA*DIM_EMB-1:0] buf_out_in;
wire [BW_DATA*DIM_EMB-1:0] data_unmasked;

reg [BW_DATA*DIM_EMB-1:0] buf_g;

wire [BW_DATA*DIM_EMB-1:0] data_w;
wire [BW_DATA*DIM_EMB-1:0] data_w_accu;

wire [BW_DATA*DIM_EMB-1:0] data_accu;

wire [BW_DATA*DIM_EMB-1:0] data_w_up;

wire [BW_DATA*DIM_EMB-1:0] data_w_accu_masked;


reg en_buf_out;
wire we_w;


wire ctrl_buf_out_in;
wire we_w_up;
wire ctrl_buf_out_in_w_up;
wire en_counter_w_up;
wire enable_w_up;

reg en_init;
reg en_init_sync;
reg enable;

reg f_en_init_w;

wire [BW_DATA*DIM_EMB-1:0] data_write;
wire _ctrl_buf_out_in_w_up;
wire _we_w_up;
wire _en_counter_w_up;

wire [BW_DATA*DIM_EMB-1:0] data_init_w;

wire rst_n_buf_out;
genvar i;


always@(*)
begin
    if(enable==1'b1 && en_init_sync==1'b1)
    begin
        if(f_w_up==1'b1)
            en_buf_out <= !we_w_up;
        else
            en_buf_out <= !done_addr_w_in && !f_done;    
    end
    else
        en_buf_out <= 1'b0;
end

//assign en_buf_out = (f_w_up==1'b1) ? ! we_w_up : ! f_done;
assign we_w = f_w_up && we_w_up || f_en_init_w;


always@(posedge en or negedge rst_n or posedge f_done)
begin
    if(rst_n == 1'b0 || f_done == 1'b1)
    begin
        en_init <= 1'b0;
    end
    else
    begin
        en_init <= 1'b1;
    end
end

// sequential logic
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_init_sync <= 1'b0;
    else
        en_init_sync <= en_init;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
    begin
        enable <= 1'b0;
    end
    else
    begin
        enable <= en_init_sync;
    end
end

always@(posedge en_init_w or negedge rst_n or posedge f_done)
begin
    if(rst_n == 1'b0 || f_done == 1'b1)
    begin
        f_en_init_w <= 1'b0;
    end
    else
    begin
        f_en_init_w <= 1'b1;
    end
end


always@(posedge clk or negedge rst_n_buf_out)
begin
    if(rst_n_buf_out == 1'b0)
        buf_out <= 'b0;
    else
    begin
        if(en_buf_out==1'b1)
        begin
            buf_out <= buf_out_in;
        end
    end
end





//
always@(posedge clk or negedge rst_n)   // should modify later - latching condition
begin
    if(rst_n == 1'b0)
    begin
        buf_in <= 'b0; 
    end
    else
    begin
        buf_in <= data_in; 
    end
end

always@(posedge clk or negedge rst_n)   // should modify later -> latching condition
begin
    if(rst_n == 1'b0)
    begin
        buf_g <= 'b0;
    end
    else
    begin
        buf_g <= grad_in;
    end
end

always@(posedge clk or negedge rst_n)
begin
    if((rst_n == 1'b0) || (f_done == 1'b1))
        f_done <= 1'b0;
    else
        f_done <= done_addr_w_in;
end

// combinational logic
//assign rst_n_addr_w_in = rst_n && !done_addr_w_in;
assign rst_n_addr_w_in = rst_n && !(en_init_sync&&!enable);
assign rst_n_buf_out = rst_n && !(en_init_sync && !enable);

assign done_data_out = enable&&!f_w_up&&f_done;

assign ctrl_buf_out_in = f_w_up&&ctrl_buf_out_in_w_up;
assign enable_w_up = enable && f_w_up;

assign buf_out_in = (ctrl_buf_out_in==1'b0) ? data_accu : buf_g ;

assign ctrl_buf_out_in_w_up = enable_w_up&&_ctrl_buf_out_in_w_up;
assign we_w_up = enable_w_up&&_we_w_up;
assign en_counter_w_up = enable_w_up&&_en_counter_w_up;
assign data_w_accu = (we_w==1'b0) ? data_w : 'bz;
assign data_w = (we_w == 1'b1) ? data_write : 'bz;

//assign data_init_w = {BW_DATA*DIM_EMB{1'b1}};
assign data_init_w = {DIM_EMB{32'h0000_0001}};  // init weight - should modify later 

assign data_write = (f_en_init_w == 1'b1) ? data_init_w:buf_out;

assign data_out = buf_out;

assign data_w_accu_masked = (buf_in[count_addr_w_in]==1'b1)? data_w_accu  : {BW_DATA*DIM_EMB{1'b0}};


//
MemN2N_emb_w_up_control
w_up_control
(
    // clock
    .clk(clk),
    // rst_n
    .rst_n(rst_n),
    // input
    .enable(enable_w_up),
    // output
    .ctrl_buf_out_in(_ctrl_buf_out_in_w_up),
    .we(_we_w_up),
    .en_counter(_en_counter_w_up)
);

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : accu
        fixed_adder
        #(
            .WL(`BW_WL),
            .IWL(`BW_IWL)
        )
        acuum
        (
            .a(buf_out[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(data_w_accu_masked[(i+1)*BW_DATA-1-:BW_DATA]),
            .c(data_accu[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

always@(*)
begin
    if(f_en_init_w == 1'b1)
        en_addr_w_in <= 1'b1;
    else
        if(f_w_up == 1'b1)
            en_addr_w_in <= en_init_sync && en_counter_w_up;
        else
            en_addr_w_in <= en_init_sync;
end

//assign en_addr_w_in = (f_init_w==1'b1) ? 1'b1 : (f_w_up==1'b0) ? enable : enable && en_counter_w_up;

//
counter
#(
    .BW(BW_COUNTER_IN),
    .COUNT_VALUE(COUNT_VALUE_IN)
)
addr_w_in
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_addr_w_in),
    // input
    .en(en_addr_w_in),
    // output
    .count(count_addr_w_in),
    .done(done_addr_w_in)
);


//
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : weight
        ram_sync
        #(
            .BW_DATA(BW_DATA),
            .BW_ADDR(BW_ADDR)
        )
        weight
        (
            // clk
            .clk(clk),
            // reset_n
            .rst_n(rst_n),
            // input
            .addr(count_addr_w_in),
            .oe(!we_w),
            .we(we_w),      
            // inout
            .data(data_w[(i+1)*BW_DATA-1-:BW_DATA])
        );
        
        //assign data_w[(i+1)*BW_DATA-1-:BW_DATA] = (f_w_up == 1'b1) ? buf_g[BW_DATA-1-:BW_DATA] : 'bz;
        
        //assign data_w[(i+1)*BW_DATA-1-:BW_DATA] = (f_w_up == 1'b1) ? buf_g[(count_addr_w_emb+1)*BW_DATA-1-:BW_DATA] : 'bz; // normal
        
        //assign data_w[(i+1)*BW_DATA-1-:BW_DATA] = (f_w_up == 1'b1) ? 'b0 : 'bz;
    end
endgenerate



endmodule
