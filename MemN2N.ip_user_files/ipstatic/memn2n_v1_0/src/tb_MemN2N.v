//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/29 16:47:24
// Design Name: 
// Module Name: tb_MemN2N
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


module tb_MemN2N();   
parameter BW_DATA_IN = `BW_DATA_IN;

parameter BW_DIM_IN = `BW_DIM_IN;
parameter BW_DIM_EMB = `BW_DIM_EMB;

parameter DIM_IN = BW_DIM_IN;
parameter DIM_EMB = 1<<BW_DIM_EMB;

parameter BW_DATA = `BW_DATA_EMB_W;
parameter BW_ADDR = `CLOG2(BW_DIM_IN);        // should make it parameterable

parameter BW_COUNTER_IN = `CLOG2(BW_DIM_IN);
parameter COUNT_VALUE_IN = (1 << BW_COUNTER_IN) - 1;

// input
reg clk;
reg rst_n;
reg en;
reg en_init;
reg f_w_up;
reg we_query;

// input
//reg [BW_DATA_IN-1:0] data_in;
wire [BW_DATA_IN-1:0] data_in;



// internal
integer i;


// test data input
integer file;

reg [BW_DIM_IN-1:0] memory_tb [0:1023];

reg [BW_DIM_IN-1:0] user_w_write_32_data;
wire [BW_DIM_IN-1:0] user_r_read_32_data;
reg user_w_write_32_wren;
reg user_r_read_32_rden;

wire user_w_write_32_full;
wire user_r_read_32_empty;

//
initial
begin
    user_w_write_32_data = 'b0;
    user_w_write_32_wren = 1'b0;
    user_r_read_32_rden = 1'b0;
end

// test file io
initial
begin
    file = $fopen("qa1_train_32.bin","rb");
    
    if(!file)
        $display("Couldn't open test file\n");
    else
        $fread(memory_tb,file);
    
    $fclose(file);
end

// fifo data input
initial
begin
    #500;

    for(i=0;i<100;i=i+1)
    begin
        #100
        user_w_write_32_data = memory_tb[i];
        user_w_write_32_wren = 1'b1;
        
        #100;
    end

    #100
    user_w_write_32_data = 'b0;
    user_w_write_32_wren = 1'b0;

    // read test



end

fifo_32x1024 fifo_32
(
    .rst(!rst),
    .wr_clk(clk),
    .rd_clk(clk),
    .din(user_w_write_32_data),
    .wr_en(user_w_write_32_wren),
    .rd_en(user_r_read_32_rden),
    .dout(user_r_read_32_data),
    .full(user_w_write_32_full),
    .empty(user_r_read_32_empty)
);


//
MemN2N
#(
)
MemN2N_i 
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input,
    .en(en),
    .en_init(en_init),
    .f_w_up(f_w_up),
    .we_query(we_query),
    .data_in(data_in)
    // output
);




//

   
always
begin
    #50 clk = ~clk;
end
   
initial
begin
    clk = 1'b0;
    rst_n = 1'b1;
    en = 1'b0;
    en_init = 1'b0;
    f_w_up = 1'b0;
    //data_in = 'b0;
    we_query = 1'b0;
end


initial
begin
    #30
    rst_n = 1'b0;
    
    #100
    rst_n = 1'b1;

    #21000;
    
    #100
    en_init = 1'b1;
    
    #100
    en_init = 1'b0;
    
    #6000 // init time



    
    // input data
    #100
    user_r_read_32_rden = 1'b1;
    
    //#100
    //data_in = user_r_read_32_data;
    //data_in = 'h008000fc;

    #100
    user_r_read_32_rden = 1'b0; 


    #100;
    
    en = 1'b1;

    #4000;

    en = 1'b0;

    #100;
    user_r_read_32_rden = 1'b1;
    
    #200;
    user_r_read_32_rden = 1'b0; 

    #100
    en = 1'b1;

    #4000;

    en = 1'b0;
    
    // question
    #100;
    user_r_read_32_rden = 1'b1;
    
    #200;
    user_r_read_32_rden = 1'b0; 

    #100
    en = 1'b1;

    #4000;

    en = 1'b0;
    
    // answer 
    #100;
    user_r_read_32_rden = 1'b1;
    
    #200;
    user_r_read_32_rden = 1'b0; 

    #100
    en = 1'b1;

    #100
    en = 1'b0;





    /*
    #100
    for(i=0;i<DIM_IN;i=i+1)
    begin
        data_in[(i+1)*BW_DATA-1-:BW_DATA] = i; 
    end
    

    #100
    en = 1'b1;
    */
    
end

assign data_in = user_r_read_32_data;



endmodule

