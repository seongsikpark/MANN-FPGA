`timescale 1ns / 100ps
`include "common.h"


module tb_attention_memory();   

parameter DIM_EMB = 1<<`BW_DIM_EMB;
parameter BW_DATA = `BW_DATA_EMB_W;

parameter BW_MEM_DATA = BW_DATA*DIM_EMB;
parameter BW_MEM_ADDR = `BW_MEM_ADDR;
parameter NUM_MEM = `NUM_MEM;

// clock
reg clk;

// reset_n
reg rst_n;

// 
reg en_mem_w;
reg en_fwd_path;
reg en_bwd_path;
reg [BW_MEM_DATA-1:0] din_mem;
reg [BW_MEM_DATA-1:0] din_question;

// 
wire done_mem_w;
wire done_fwd_path;
wire done_bwd_path;
wire [BW_DATA*NUM_MEM-1:0] dout_attention;


integer i;

//
attention_memory
#(
)
attention_mem
(
    // clock
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    .en_mem_w(en_mem_w),
    .en_fwd_path(en_fwd_path),
    .en_bwd_path(en_bwd_path),
    .din_mem(din_mem),
    .din_question(din_question),

    // output
    .done_mem_w(done_mem_w),
    .done_fwd_path(done_fwd_path),
    .done_bwd_path(done_bwd_path),
    .dout_attention(dout_attention)
);


//
always
begin
    #50
    clk = ~clk;
end

initial
begin
    clk = 1'b0;
    rst_n = 1'b1;
    en_mem_w = 1'b0;
    en_fwd_path = 1'b0;
    en_bwd_path = 1'b0;
    din_mem = 'b0;
    din_question = 'b0;
end

initial
begin
    #30
    rst_n = 1'b0;

    #100
    rst_n = 1'b1;

    #1000;


    $display("data in");

    /*
    for(i=0;i<NUM_MEM/2;i=i+1)
    begin
        #100
        din_mem = 1'b1 << (i + BW_DATA*(DIM_EMB-1));

        $display("%d : %h",i,din_mem);
        
        #100
        en_mem_w = 1'b1;

        #100
        en_mem_w = 1'b0;
    end
    */
    
    // test set 0
    /* 
    for(i=0;i<NUM_MEM/2;i=i+1)
    begin
        #200
        din_mem = 1'b1 << (i+28 + BW_DATA*(DIM_EMB-1));

        $display("%d : %h",i,din_mem);
        
        #100
        en_mem_w = 1'b1;

        #100
        en_mem_w = 1'b0;
    end
    for(i=0;i<NUM_MEM/2;i=i+1)
    begin
        #200
        din_mem = 1'b1 << (i + BW_DATA*(DIM_EMB-1));

        $display("%d : %h",i+NUM_MEM/2,din_mem);
        
        #100
        en_mem_w = 1'b1;

        #100
        en_mem_w = 1'b0;
    end
    */

    // test set 1
    //
    for(i=0;i<15;i=i+1)
    begin
        #200
        din_mem = 1'b1 << (i+16 + BW_DATA*(DIM_EMB-1));

        $display("%d : %h",i,din_mem);
        
        #100
        en_mem_w = 1'b1;

        #100
        en_mem_w = 1'b0;
    end


    #100
    din_question = {BW_MEM_DATA{'h01000000}};

    #100
    en_fwd_path = 1'b1;
    
    /*
    while(done_fwd_path==1'b0)
    begin
        #100;
    end
    */

    #100
    en_fwd_path = 1'b0;

    #62000
    
    
    $display("exp sum : %h",attention_mem.reg_sum_exp);
    $display(" mem index : reg_exp : dout_attention");

    for(i=0;i<NUM_MEM;i=i+1)
    begin
        $display("%d : %h : %h",i,attention_mem.reg_exp[(i+1)*BW_DATA-1-:BW_DATA],dout_attention[(i+1)*BW_DATA-1-:BW_DATA]);
    end

end


initial
begin
    $display("START");

end


endmodule
