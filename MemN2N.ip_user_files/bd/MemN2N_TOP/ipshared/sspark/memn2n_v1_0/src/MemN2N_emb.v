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
    rst_n_buf_out,
    // input
    en_init_w,
    en_fwd_path,
    en_bwd_path,
    data_in,
    addr_in,
    grad_in,
    // output
    data_out,
    grad_out,
    done_init_w,
    done_fwd_path,
    done_bwd_path
);


parameter BW_DIM_IN = `BW_DIM_IN;
parameter BW_DIM_EMB = `BW_DIM_EMB;

parameter DIM_IN = BW_DIM_IN;
parameter DIM_EMB = 1<<BW_DIM_EMB;

parameter BW_DATA = `BW_DATA_EMB_W;
//parameter BW_ADDR = `CLOG2(BW_DIM_IN);        // should make it parameter
parameter BW_ADDR = 7;        // should make it parameterable

//parameter BW_COUNTER_IN = `CLOG2(BW_DIM_IN);
//parameter COUNT_VALUE_IN = (1 << BW_COUNTER_IN) - 1;
parameter BW_COUNTER_IN = 7;
parameter COUNT_VALUE_IN = 128-1;

// clock
input wire clk;
// reset_n
input wire rst_n;
input wire rst_n_buf_out;
// input
input wire en_init_w;
input wire en_fwd_path;
input wire en_bwd_path;
input wire [DIM_IN-1:0] data_in;
input wire [BW_DIM_IN-1:0] addr_in;
input wire [BW_DATA*DIM_EMB-1:0] grad_in;
// output
output wire [BW_DATA*DIM_EMB-1:0] data_out;
output reg [BW_DATA*DIM_IN-1:0] grad_out;
output wire done_init_w;
output reg done_fwd_path;
output wire done_bwd_path;


// internal
wire [BW_COUNTER_IN-1:0] count_addr_w_in;
reg [BW_COUNTER_IN-1:0] addr_weight;
wire en_addr_w_in;
wire rst_n_addr_w_in;

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


wire we_w;

wire ctrl_buf_out_in;
wire ctrl_buf_out_in_w_up;
wire en_counter_w_up;
wire enable_w_up;

wire [BW_DATA*DIM_EMB-1:0] data_write;
wire _ctrl_buf_out_in_w_up;
wire _we_w_up;
wire _en_counter_w_up;

wire [BW_DATA*DIM_EMB-1:0] data_init_w;

genvar i;


reg en_init_w_sync;
reg en_fwd_path_sync;
reg en_bwd_path_sync;




always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_init_w==1'b1)
        en_init_w_sync <= 1'b0;
    else
        if(en_init_w_sync==1'b0)
            en_init_w_sync <= en_init_w; 
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_fwd_path==1'b1)
        en_fwd_path_sync <= 1'b0;
    else
        if(en_fwd_path_sync==1'b0)
            en_fwd_path_sync <= en_fwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_bwd_path==1'b1)
        en_bwd_path_sync <= 1'b0;
    else
        if(en_bwd_path_sync==1'b0)
            en_bwd_path_sync <= en_bwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_fwd_path==1'b1)
        done_fwd_path <= 1'b0;
    else
        if(en_fwd_path_sync==1'b1)
            done_fwd_path <= en_fwd_path_sync;
end

assign done_init_w = en_init_w_sync && done_addr_w_in;
//assign done_fwd_path = en_fwd_path_sync && done_addr_w_in;
assign done_bwd_path = en_bwd_path_sync && done_addr_w_in;






// sequential logic

always@(posedge clk or negedge rst_n_buf_out)
begin
    if(rst_n_buf_out == 1'b0)
        buf_out <= 'b0;
    else
        //if(en_fwd_path_sync==1'b1)
        if(done_fwd_path==1'b1)
            buf_out <= buf_out_in;
end


//assign rst_n_buf_out = rst_n && !(en_fwd_path_init_sync&&(!en_fwd_path_sync));
//assign rst_n_buf_out = rst_n;


//
always@(posedge clk or negedge rst_n)   // should modify later - latching condition
begin
    if(rst_n == 1'b0)
        buf_in <= 'b0; 
    else
        buf_in <= data_in; 
end

always@(posedge clk or negedge rst_n)   // should modify later -> latching condition
begin
    if(rst_n == 1'b0)
        buf_g <= 'b0;
    else
        buf_g <= grad_in;
end

// combinational logic
//assign rst_n_addr_w_in = rst_n && !done_addr_w_in;
assign rst_n_addr_w_in = rst_n && (en_init_w_sync || en_fwd_path_sync || en_bwd_path_sync);

assign ctrl_buf_out_in = ctrl_buf_out_in_w_up;
assign enable_w_up = en_bwd_path_sync;

assign buf_out_in = (ctrl_buf_out_in==1'b0) ? data_accu : buf_g ;

assign ctrl_buf_out_in_w_up = enable_w_up&&_ctrl_buf_out_in_w_up;
assign we_w = en_init_w_sync || enable_w_up&&_we_w_up;
assign en_counter_w_up = enable_w_up&&_en_counter_w_up;
assign data_w_accu = (we_w==1'b0) ? data_w : 'bz;
assign data_w = (we_w == 1'b1) ? data_write : 'bz;

//assign data_init_w = {BW_DATA*DIM_EMB{1'b1}};
//assign data_init_w = {DIM_EMB{32'h0000_0001}};  // init weight - should modify later 
assign data_init_w = `INIT_WEIGHT_EMB; 

assign data_write = (en_init_w_sync== 1'b1) ? data_init_w:buf_out;

assign data_out = buf_out;

assign data_w_accu_masked = (buf_in[count_addr_w_in]==1'b1)? data_w_accu  : {BW_DATA*DIM_EMB{1'b0}};


always@(*)
begin
    case({en_init_w_sync,en_fwd_path_sync,en_bwd_path_sync})
        3'b100 :
        begin
            addr_weight <= count_addr_w_in;
        end
        3'b010 :
        begin
            addr_weight <= addr_in;
        end
        3'b001 :
        begin
            addr_weight <= 'b0;
        end
        default
        begin
            addr_weight <= 'b0;
        end
    endcase
end

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
//            .b(data_w_accu_masked[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(data_w_accu[(i+1)*BW_DATA-1-:BW_DATA]),
            .c(data_accu[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate


assign en_addr_w_in = en_init_w_sync || en_fwd_path_sync || (en_bwd_path_sync && en_counter_w_up);

/*
always@(*)
begin
    if(en_init_w_sync== 1'b1)
        en_addr_w_in <= 1'b1;
    else
        if(en_bwd_path_sync == 1'b1)
            en_addr_w_in <= en_sync && en_counter_w_up;
        else
            if(en_fwd_path_sync == 1'b1)
                en_addr_w_in <= en_sync;
end
*/



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
            .addr(addr_weight),
            .oe(!we_w),
            .we(we_w),      
            // inout
            .data(data_w[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate



endmodule
