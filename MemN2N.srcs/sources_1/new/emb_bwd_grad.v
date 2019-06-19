//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/26 11:01:09
// Design Name: 
// Module Name: emb_bwd_grad
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

module emb_bwd_grad
(
    // clk
    clk,
    // rst_n
    rst_n,
    rst_n_soft,
    rst_n_count_word,
    rst_n_hop,
    // input
    en_fwd_path_sen,
    en_fwd_path_q,
    en_count_sen,
    en_count_word_sen,
    en_count_word_q,
    done_emb_q,
    done_count_hop,
    en_bwd_path,
    data_in,
    // output
    done_bwd_path,
    done_read_q,
    done_read_sen,
    data_out_word_sen,
    data_out_word_q,
    we_data_out_word_sen,
    we_data_out_word_q,
    addr_out_sen
);
////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter NUM_MEM = `NUM_MEM;
parameter BW_MAX_WORD_IN_SEN = `BW_MAX_WORD_IN_SEN;
parameter MAX_WORD_IN_SEN = `MAX_WORD_IN_SEN;
parameter BW_MEM_ADDR = `BW_MEM_ADDR;
parameter COUNT_VALUE_IN = (1 << BW_MEM_ADDR) - 1;
parameter BW_WORD_VEC = `BW_WORD_VEC;

////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clk
input wire clk;
// rst_n
input wire rst_n;
input wire rst_n_soft;
input wire rst_n_count_word;
input wire rst_n_hop;
// input
input wire en_fwd_path_sen;
input wire en_fwd_path_q;
input wire en_count_sen;
input wire en_count_word_sen;
input wire en_count_word_q;
input wire done_emb_q;
input wire done_count_hop;
input wire en_bwd_path;
input wire [BW_WORD_VEC-1:0] data_in;
// output
//output wire done_bwd_path;
output reg done_bwd_path;
//output reg done_read_sen;
output wire done_read_sen;
output reg done_read_q;

output wire [BW_WORD_VEC-1:0] data_out_word_sen;
output wire [BW_WORD_VEC-1:0] data_out_word_q;
output reg we_data_out_word_sen;
output reg we_data_out_word_q;
output wire [BW_MEM_ADDR-1:0] addr_out_sen;

////////////////////////////////////////////////////////////
// internal signals
////////////////////////////////////////////////////////////
genvar i;
wire [BW_WORD_VEC-1:0] data_in_word_input_sen [0:NUM_MEM-1];
wire [BW_WORD_VEC-1:0] data_out_word_input_sen [0:NUM_MEM-1];
wire [BW_WORD_VEC-1:0] data_in_word_input_q;
wire [BW_WORD_VEC-1:0] data_out_word_input_q;

wire [BW_MAX_WORD_IN_SEN-1:0] addr_word_input;
wire [BW_MAX_WORD_IN_SEN-1:0] addr_word_input_sen;
wire [BW_MAX_WORD_IN_SEN-1:0] addr_word_input_q;

reg [NUM_MEM-1:0] oe_mem_word_input_sen;
reg [NUM_MEM-1:0] we_mem_word_input_sen;

wire oe_mem_word_input_q;
wire we_mem_word_input_q;

reg [BW_MAX_WORD_IN_SEN-1:0] num_words_sen [0:NUM_MEM-1];
reg [BW_MAX_WORD_IN_SEN-1:0] num_words_q;

reg [BW_MEM_ADDR:0] num_sen;

wire rst_n_counter_word;
wire en_counter_word;
wire [BW_MAX_WORD_IN_SEN-1:0] count_counter_word;
wire [BW_MAX_WORD_IN_SEN-1:0] count_counter_word_q;
//wire done_counter_word;
//wire done_counter_word_q;


//reg [BW_MEM_ADDR:0] addr_sen;
wire [BW_MEM_ADDR:0] addr_sen;

wire rst_n_counter_sen;
wire en_counter_sen;
wire [BW_MEM_ADDR:0] count_counter_sen;
//wire done_counter_sen;

reg done_sen;


reg en_bwd_path_sen_sync;
reg en_bwd_path_q_sync;


reg done_read_word;
//wire done_read_word;

reg _done_read_sen;


////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin
        assign data_in_word_input_sen[i] = (en_fwd_path_sen==1'b1)? data_in : {BW_WORD_VEC{1'bz}};
    end
endgenerate
assign data_in_word_input_q = (en_fwd_path_q==1'b1)? data_in : {BW_WORD_VEC{1'bz}};

/*
always@(*)
begin
    oe_mem_word_input_sen = {NUM_MEM{1'b0}};
    oe_mem_word_input_sen[addr_sen] = en_bwd_path_sen_sync || en_bwd_path;
end
*/

generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin
        always@(*)
        begin
            oe_mem_word_input_sen[i] = en_bwd_path_sen_sync || en_bwd_path;
        end
    end
endgenerate

always@(*)
begin
    we_mem_word_input_sen = {NUM_MEM{1'b0}};
    we_mem_word_input_sen[addr_sen] = en_fwd_path_sen;
end

assign oe_mem_word_input_q = en_bwd_path_q_sync || en_bwd_path;
assign we_mem_word_input_q = en_fwd_path_q;

assign addr_word_input = count_counter_word;

assign addr_word_input_sen = count_counter_word;

assign addr_word_input_q = (en_bwd_path_q_sync==1'b1)? count_counter_word_q : count_counter_word;

assign rst_n_counter_word = rst_n && rst_n_count_word && !en_bwd_path && !(en_bwd_path_sen_sync&&done_read_word);
//assign rst_n_counter_word = rst_n && rst_n_count_word && !en_bwd_path && !(en_bwd_path_sen_sync==1'b1 && count_counter_word==num_words_sen[count_counter_sen]-1);
assign rst_n_counter_word_q = rst_n && rst_n_count_word && rst_n_hop && !en_bwd_path;

assign rst_n_counter_sen = rst_n && rst_n_soft && rst_n_hop && !en_bwd_path;

assign en_counter_word = (en_bwd_path_sen_sync==1'b1)? en_count_word_sen&&!done_read_sen : en_count_word_sen;
assign en_counter_word_q = (en_bwd_path_q_sync==1'b1)? en_count_word_q : en_count_word_q;
assign en_counter_sen = (en_bwd_path_sen_sync==1'b1) ? done_read_word : done_sen;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        we_data_out_word_sen <= 1'b0;
    else
        if(en_bwd_path_sen_sync==1'b1)
            we_data_out_word_sen <= en_counter_word;
        else
            we_data_out_word_sen <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        we_data_out_word_q <= 1'b0;
    else
        if(en_bwd_path_q_sync==1'b1)
            we_data_out_word_q <= en_counter_word_q;
        else
            we_data_out_word_q <= 1'b0;
end


//assign done_bwd_path = (en_bwd_path_sen_sync==1'b1)? done_read_sen&&done_read_q : 1'b0;
always@(*)
begin
    if(en_bwd_path_sen_sync==1'b1)
        if(done_count_hop==1'b1)
            done_bwd_path = done_read_sen&&done_read_q;
        else
            done_bwd_path = done_read_sen;
    else
        done_bwd_path = 1'b0;
end

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_bwd_path==1'b1)
        done_bwd_path <= 1'b0;
    else
        if(done_bwd_path==1'b0 && done_read_sen==1'b1 && done_read_q==1'b1)
            done_bwd_path <= 1'b1;
end
*/



assign data_out_word_sen = (en_bwd_path_sen_sync==1'b1) ? data_out_word_input_sen[addr_sen] : {BW_WORD_VEC{1'b0}};
assign data_out_word_q = (en_bwd_path_q_sync==1'b1)? data_out_word_input_q : {BW_WORD_VEC{1'b0}};


/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        data_out_word <= {BW_WORD_VEC{1'b0}};
    else
        if(en_bwd_path_sen_sync==1'b1)
            data_out_word <= data_word_input_sen[addr_sen];
end
*/


assign addr_out_sen = (en_bwd_path_sen_sync==1'b1) ? count_counter_sen:{BW_MEM_ADDR{1'b0}};


always@(posedge clk or negedge rst_n or negedge rst_n_soft)
begin
    if(rst_n==1'b0 || rst_n_soft==1'b0)
        num_sen <= {(BW_MEM_ADDR+1){1'b0}};
    else
        if(done_emb_q==1'b1)
            num_sen <= count_counter_sen;
end

reg _done_read_word;

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_read_word==1'b1 || done_bwd_path==1'b1)
    //if(rst_n==1'b0 || done_read_word==1'b1)
    if(rst_n==1'b0)
        _done_read_word <= 1'b0;
    else
        if(done_read_word==1'b1)
            _done_read_word <= 1'b0;
        else if(en_bwd_path_sen_sync==1'b1 && count_counter_word==num_words_sen[count_counter_sen]-1)
            _done_read_word <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_read_word==1'b1)
    if(rst_n==1'b0)
        done_read_word <= 1'b0;
    else
        //done_read_word <= !done_read_word && _done_read_word;
        done_read_word <= _done_read_word && en_counter_word;
end

//assign done_read_word = (_done_read_word==1'b1) ? en_counter_word : 1'b0;



always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path==1'b1)
    if(rst_n==1'b0)
        _done_read_sen <= 1'b0;
    else
        if(done_bwd_path==1'b1)
            _done_read_sen <= 1'b0;
        else if(en_bwd_path_sen_sync==1'b1 && count_counter_sen==num_sen-1 && done_read_word)
            _done_read_sen <= 1'b1;
end

assign done_read_sen = (_done_read_sen==1'b1) ? en_count_word_sen : 1'b0;


always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path==1'b1)
    if(rst_n==1'b0)
        done_read_q <= 1'b0;
    else
        if(done_bwd_path==1'b1)
            done_read_q <= 1'b0;
        //else if(en_bwd_path_q_sync==1'b1 && (addr_word_input_q==num_words_q-1) )
        else if(en_bwd_path_q_sync==1'b1 && (addr_word_input_q==num_words_q) )
            done_read_q <= 1'b1;
end


////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_sen <= {BW_MEM_ADDR{1'b0}};
    else
        addr_sen <= count_counter_sen;
end
*/

assign addr_sen = count_counter_sen;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_sen <= 1'b0;
    else
        done_sen <= en_count_sen;
end

//
generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin : num_words_sen_in
        always@(posedge clk or negedge rst_n or negedge rst_n_soft)
        begin
            if(rst_n==1'b0 || rst_n_soft==1'b0)
                num_words_sen[i] <= {BW_MAX_WORD_IN_SEN{1'b0}};
            else
                if(i==count_counter_sen && done_sen==1'b1)
                    num_words_sen[i] <= count_counter_word;
        end
    end
endgenerate

//
always@(posedge clk or negedge rst_n or negedge rst_n_soft)
begin
    if(rst_n==1'b0 || rst_n_soft==1'b0)
        num_words_q <= {BW_MAX_WORD_IN_SEN{1'b0}};
    else
        if(done_emb_q==1'b1)
            num_words_q <= count_counter_word;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path==1'b1)
    if(rst_n==1'b0)
        en_bwd_path_sen_sync <= 1'b0;
    else
        //if(done_bwd_path==1'b1)
        if(done_read_sen==1'b1)
            en_bwd_path_sen_sync <= 1'b0;
        else if(en_bwd_path_sen_sync==1'b0)
            en_bwd_path_sen_sync <= en_bwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path==1'b1)
    if(rst_n==1'b0)
        en_bwd_path_q_sync <= 1'b0;
    else
        //if(done_bwd_path==1'b1)
        if(done_read_q==1'b1)
            en_bwd_path_q_sync <= 1'b0;
        else if(en_bwd_path_q_sync==1'b0)
            en_bwd_path_q_sync <= en_bwd_path;
end





////////////////////////////////////////////////////////////
// instances
////////////////////////////////////////////////////////////
counter
#(
    .BW(BW_MAX_WORD_IN_SEN),
    .COUNT_VALUE(MAX_WORD_IN_SEN)
)
counter_word
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_counter_word),
    // input
    .en(en_counter_word),
    .en_hold_max(1'b1),
    // output
    .count(count_counter_word),
    //.done(done_counter_word)
    .done()
);

counter
#(
    .BW(BW_MAX_WORD_IN_SEN),
    .COUNT_VALUE(MAX_WORD_IN_SEN)
)
counter_word_q
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_counter_word_q),
    // input
    .en(en_counter_word_q),
    .en_hold_max(1'b1),
    // output
    .count(count_counter_word_q),
    //.done(done_counter_word_q)
    .done()
);



counter
#(
    .BW(BW_MEM_ADDR+1),
    .COUNT_VALUE(COUNT_VALUE_IN+1)
)
counter_sen
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_counter_sen),
    // input
    .en(en_counter_sen),
    .en_hold_max(1'b1),
    // output
    .count(count_counter_sen),
    //.done(done_counter_sen)
    .done()
);

generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin : words_input_sen
        ram_sync
        #(
            .BW_DATA(BW_WORD_VEC),
            .BW_ADDR(BW_MAX_WORD_IN_SEN)
        )
        word_input_sen
        (
            // clk
            .clk(clk),
            // reset_n
            .rst_n(rst_n),
            // input
            .addr(addr_word_input_sen),
            .oe(oe_mem_word_input_sen[i]),
            .we(we_mem_word_input_sen[i]),
            .data_in(data_in_word_input_sen[i]),
            // inout
            .data_out(data_out_word_input_sen[i])
        );
    end
endgenerate

ram_sync
#(
    .BW_DATA(BW_WORD_VEC),
    .BW_ADDR(BW_MAX_WORD_IN_SEN)
)
word_input_q
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    .addr(addr_word_input_q),
    .oe(oe_mem_word_input_q),
    .we(we_mem_word_input_q),
    .data_in(data_in_word_input_q),
    // inout
    .data_out(data_out_word_input_q)
);


////////////////////////////////////////////////////////////
// debug
////////////////////////////////////////////////////////////
`ifdef DEBUG

`ifdef DEBUG_ILA
ila
ila_emb_bwd
(
    .clk(clk),

    // 1 bit
    // input
    .probe0(oe_mem_word_input_q),
    .probe1(we_mem_word_input_q),
    .probe2(rst_n_counter_word),
    .probe3(en_counter_word),
    .probe4(rst_n_counter_sen),
    .probe5(en_counter_sen),
    .probe6(done_sen),
    .probe7(en_bwd_path_sen_sync),

    // 1 bit
    // output
    .probe8(en_bwd_path_q_sync),
    .probe9(done_read_word),
    .probe10(_done_read_sen),
    .probe11(),
    .probe12(),
    .probe13(),
    .probe14(),
    .probe15(),

    // 16 bit
    .probe16(addr_word_input),
    .probe17(addr_word_input_sen),
    .probe18(addr_word_input_q),
    .probe19(num_words_q),
    .probe20(count_counter_word),
    .probe21(count_counter_word_q),
    .probe22(),
    .probe23(),

    // 32 bit
    .probe24(data_in_word_input_q),
    .probe25(data_out_word_input_q),
    .probe26(num_sen),
    .probe27(addr_sen),
    .probe28(count_counter_sen),
    .probe29(),
    .probe30(),
    .probe31(),

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
    .probe47()

);
`endif  // DEBUG_ILA

`endif  // DEBUG





endmodule
