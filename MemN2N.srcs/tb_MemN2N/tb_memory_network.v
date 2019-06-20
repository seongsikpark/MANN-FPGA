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

`define SIM_FORCE_W
//`define WRITE_MEM       // availabe only when SIM_FORCE_W is defined

//`define PERIOD_CLK          10     // ns
`define PERIOD_CLK          20     // ns
`define PERIOD_CLK_PCIE     10      // ns


module tb_memory_network();   
parameter BW_DATA_IN = `BW_DATA_IN;

parameter BW_DIM_IN = `BW_DIM_IN;
parameter BW_DIM_EMB = `BW_DIM_EMB;

parameter DIM_IN = `BW_DIM_IN;
parameter DIM_EMB = 1<<BW_DIM_EMB;

//parameter BW_DATA = `BW_DATA_EMB_W;
parameter BW_ADDR = `CLOG2(BW_DIM_IN);        // should make it parameterable

parameter NUM_MEM = `NUM_MEM;

parameter BW_DATA_EMB_W = `BW_DATA_EMB_W;

parameter BW_WORD_VEC = `BW_WORD_VEC;

parameter NUM_ITR = `NUM_ITR;

parameter BW_DATA =`BW_DATA;

parameter MAX_TEST_INPUT = 500000;

// port input
reg rst_sys;
wire en_init_cmd;
reg en_init_sys;
wire en_init_memn2n;



reg clk_pcie;
reg clk;
wire rst_n;
wire en;
wire en_init;

//reg [BW_DATA_IN-1:0] data_in;
wire [BW_DATA_IN-1:0] data_in;

wire rb_n;
wire done_init_memn2n;
wire [BW_DATA_IN-1:0] data_out;

// internal
integer  k, num_words;
integer i;

genvar i_gen;

wire done_init;


// test data input

integer file;
integer trained_model;

genvar j;

reg [16-1:0] memory_tb [0:MAX_TEST_INPUT-1];
reg [BW_DATA_EMB_W-1:0] init_w_fc_w_sm [0:DIM_IN*DIM_EMB-1];
reg [BW_DATA_EMB_W-1:0] init_w_fc [0:DIM_EMB*DIM_EMB-1];
reg [BW_DATA_EMB_W-1:0] init_emb_a [0:DIM_IN*DIM_EMB-1];
reg [BW_DATA_EMB_W-1:0] init_emb_c [0:DIM_IN*DIM_EMB-1];
reg [BW_DATA_EMB_W-1:0] init_emb_q [0:DIM_IN*DIM_EMB-1];

reg [BW_DATA-1:0] trained_model_w_fc_w_sm [0:DIM_IN*DIM_EMB-1];
reg [BW_DATA-1:0] trained_model_w_fc [0:DIM_EMB*DIM_EMB-1];
reg [BW_DATA-1:0] trained_model_emb_a [0:DIM_IN*DIM_EMB-1];
reg [BW_DATA-1:0] trained_model_emb_c [0:DIM_IN*DIM_EMB-1];
reg [BW_DATA-1:0] trained_model_emb_q [0:DIM_IN*DIM_EMB-1];



// fifo - 8 bit
reg [8-1:0] user_w_write_8_data_fifo_in;
wire [8-1:0] user_r_read_8_data_fifo_in;
reg user_w_write_8_wren_fifo_in;
wire user_r_read_8_rden_fifo_in;
wire user_w_write_8_full_fifo_in;
wire user_r_read_8_empty_fifo_in;
wire user_r_read_8_val_fifo_in;

reg [16-1:0] user_w_write_16_data_fifo_in;
wire [16-1:0] user_r_read_16_data_fifo_in;
reg user_w_write_16_wren_fifo_in;
wire user_r_read_16_rden_fifo_in;
wire user_w_write_16_full_fifo_in;
wire user_r_read_16_empty_fifo_in;
wire user_r_read_16_val_fifo_in;

wire [16-1:0] user_w_write_16_data_fifo_out;
wire [16-1:0] user_r_read_16_data_fifo_out;
wire user_w_write_16_wren_fifo_out;
reg user_r_read_16_rden_fifo_out;
wire user_w_write_16_full_fifo_out;
wire user_r_read_16_empty_fifo_out;
wire user_r_read_16_val_fifo_out;





//reg [BW_DATA_IN-1:0] reg_data_in;

reg init_w_fc_w_sm_trig;
reg init_w_fc_trig;
reg init_emb_a_trig;
reg init_emb_c_trig;
reg init_emb_q_trig;

reg done_init_w;
reg done_init_emb_a;
reg done_init_emb_c;
reg done_init_emb_q;

reg done_init_sim;
reg done_init_memory_network;

integer itr_count;

//wire rst_fifo_in;
//wire rst_fifo_out;

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


wire rst_n_memn2n_cmd;

//
initial
begin
    user_w_write_16_data_fifo_in = 'b0;
    user_w_write_16_wren_fifo_in = 1'b0;

end

initial
begin
    //file = $fopen("../../../data/qa1_test.bin","rb");       
    //file = $fopen("../../../data/emb16_task1/qa1_train_32.bin","rb");
    //file = $fopen("../../../data/emb32_task1/qa1_train_32.bin","rb");
    //file = $fopen("../../../data/emb32_task1/qa1_train.bin","rb");
    //file = $fopen("qa1_train.bin","rb");
    file = $fopen("qa1_test.bin","rb");
    //file = $fopen("qa1_train_nsen_1.bin","rb");
    //file = $fopen("qa2_train.bin","rb");
    
    if(!file)
    begin
        $display("Couldn't open test file\n");
        $finish;
        //num_words = 10;
    end
    else
        num_words = $fread(memory_tb,file) / 2;

    $fclose(file);
end


//
// forcing weights for sim 
//
`ifdef SIM_FORCE_W
initial
begin
    /*
    file = $fopen("../data/w_fixed.bin","rb");
    if(!file)
        $display("Couldn't open w file\n");
    else
        $fread(init_w_fc_w_sm,file);
    $fclose(file);

    file = $fopen("../data/w_emb_a_fixed.bin","rb");
    if(!file)
        $display("Couldn't open w file\n");
    else
        $fread(init_emb_a,file);
    $fclose(file);

    file = $fopen("../data/w_emb_c_fixed.bin","rb");
    if(!file)
        $display("Couldn't open w file\n");
    else
        $fread(init_emb_c,file);
    $fclose(file);

    file = $fopen("../data/w_emb_q_fixed.bin","rb");
    if(!file)
        $display("Couldn't open w file\n");
    else
        $fread(init_emb_q,file);
    $fclose(file);
    */

    //file = $fopen("../../../data/w_init_fixed.bin","rb");


    //////////////////////////////////////////
    // gaussian init
    /////////////////////////////////////////
    /*
    file = $fopen("w_fc_w_sm_init_fixed.bin","rb");
    if(!file)
    begin
        $display("Couldn't open w file\n");
        $finish;
    end
    else
        $fread(init_w_fc_w_sm,file);
    $fclose(file);

    file = $fopen("w_fc_init_fixed.bin","rb");
    if(!file)
    begin
        $display("Couldn't open w file\n");
        $finish;
    end
    else
        $fread(init_w_fc,file);
    $fclose(file);

    //file = $fopen("../../../data/w_emb_a_init_fixed.bin","rb");
    file = $fopen("w_emb_a_init_fixed.bin","rb");
    if(!file)
    begin
        $display("Couldn't open w file\n");
        $finish;
    end
    else
        $fread(init_emb_a,file);
    $fclose(file);

    //file = $fopen("../../../data/w_emb_c_init_fixed.bin","rb");
    file = $fopen("w_emb_c_init_fixed.bin","rb");
    if(!file)
    begin
        $display("Couldn't open w file\n");
        $finish;
    end
    else
        $fread(init_emb_c,file);
    $fclose(file);

    //file = $fopen("../../../data/w_emb_q_init_fixed.bin","rb");
    file = $fopen("w_emb_q_init_fixed.bin","rb");
    if(!file)
    begin
        $display("Couldn't open w file\n");
        $finish;
    end
    else
        $fread(init_emb_q,file);
    $fclose(file);
    */


    //////////////////////////////////////////
    // trained_model_task1
    /////////////////////////////////////////
    file = $fopen("model_qa1_single-supporting-fact_emb_a_fpga_fixed_q_7_24.bin","rb");
    if(!file)
    begin
        $display("Couldn't open w file\n");
        $finish;
    end
    else
        $fread(init_emb_a,file);
    $fclose(file);

    // emb_c
    file = $fopen("model_qa1_single-supporting-fact_emb_c_fpga_fixed_q_7_24.bin","rb");
    if(!file)
    begin
        $display("Couldn't open w file\n");
        $finish;
    end
    else
        $fread(init_emb_c,file);
    $fclose(file);

    // emb_q
    file = $fopen("model_qa1_single-supporting-fact_emb_q_fpga_fixed_q_7_24.bin","rb");
    if(!file)
    begin
        $display("Couldn't open w file\n");
        $finish;
    end
    else
        $fread(init_emb_q,file);
    $fclose(file);

    // fc
    file = $fopen("model_qa1_single-supporting-fact_lin_map_fpga_fixed_q_7_24.bin","rb");
    if(!file)
    begin
        $display("Couldn't open w file\n");
        $finish;
    end
    else
        $fread(init_w_fc,file);
    $fclose(file);

    // fc_w_sm
    file = $fopen("model_qa1_single-supporting-fact_ds_ans_fpga_fixed_q_7_24.bin","rb");
    if(!file)
    begin
        $display("Couldn't open w file\n");
        $finish;
    end
    else
        $fread(init_w_fc_w_sm,file);
    $fclose(file);


end
`endif

// fifo data input - set din_exp_shift_bit
task data_input_din_exp_shift_bit;
begin
    if(user_w_write_16_full_fifo_in==1'b0)
    begin
        #`PERIOD_CLK_PCIE;
        //user_w_write_16_data_fifo_in = {`TYPE_CODE_DIN_EXP_SHIFT_BIT,4'b0000,4'b0000,4'b0101};   // type,4'b0,4'b0,shift_bit
        //user_w_write_16_data_fifo_in = {`TYPE_CODE_DIN_EXP_SHIFT_BIT,4'b0000,4'b0000,4'b0000};   // type,4'b0,4'b0,shift_bit
        user_w_write_16_data_fifo_in = {`TYPE_CODE_DIN_EXP_SHIFT_BIT,4'b0000,4'b0000,4'b0010};   // type,4'b0,4'b0,shift_bit
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;
    end
    else
    begin
        while(user_w_write_16_full_fifo_in==1'b1)
        begin
            #`PERIOD_CLK_PCIE;
        end
    end

    #`PERIOD_CLK_PCIE;
    user_w_write_16_data_fifo_in = 'b0;
end
endtask


// fifo data input - w load to fpga
task data_input_w_load_to_fpga;
begin
    if(user_w_write_16_full_fifo_in==1'b0)
    begin
        // emb_a
        file = $fopen("model_qa1_single-supporting-fact_emb_a_fpga_fixed_q_7_24.hex","r");
        if(!file)
        begin
            $display("Couldn't open w file\n");
            $finish;
        end
        else
            $fread(trained_model_emb_a,file);
        $fclose(file);

        // emb_c
        file = $fopen("model_qa1_single-supporting-fact_emb_c_fpga_fixed_q_7_24.hex","r");
        if(!file)
        begin
            $display("Couldn't open w file\n");
            $finish;
        end
        else
            $fread(trained_model_emb_c,file);
        $fclose(file);

        // emb_q
        file = $fopen("model_qa1_single-supporting-fact_emb_q_fpga_fixed_q_7_24.hex","r");
        if(!file)
        begin
            $display("Couldn't open w file\n");
            $finish;
        end
        else
            $fread(trained_model_emb_q,file);
        $fclose(file);

        // fc
        file = $fopen("model_qa1_single-supporting-fact_lin_map_fpga_fixed_q_7_24.hex","r");
        if(!file)
        begin
            $display("Couldn't open w file\n");
            $finish;
        end
        else
            $fread(trained_model_w_fc,file);
        $fclose(file);

        // fc_w_sm
        file = $fopen("model_qa1_single-supporting-fact_ds_ans_fpga_fixed_q_7_24.hex","r");
        if(!file)
        begin
            $display("Couldn't open w file\n");
            $finish;
        end
        else
            $fread(trained_model_w_fc_w_sm,file);
        $fclose(file);


        for(ind_emb_a=0;ind_emb_a<DIM_IN;ind_emb_a=ind_emb_a+1)
        begin
            #`PERIOD_CLK_PCIE;
            //user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_MODE_W_LOAD_TO_FPGA,4'b0000,4'b0000,4'b0000}; 
            user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_MODE_W_LOAD_TO_FPGA}; 
            #`PERIOD_CLK_PCIE;
            user_w_write_16_wren_fifo_in = 1'b1;
            #`PERIOD_CLK_PCIE;
            user_w_write_16_wren_fifo_in = 1'b0;

            #`PERIOD_CLK_PCIE;
            user_w_write_16_data_fifo_in = ind_emb_a; 
            #`PERIOD_CLK_PCIE;
            user_w_write_16_wren_fifo_in = 1'b1;
            #`PERIOD_CLK_PCIE;
            user_w_write_16_wren_fifo_in = 1'b0;

            for(i=0;i<DIM_EMB*2;i=i+1)
            begin
                #`PERIOD_CLK_PCIE;
                user_w_write_16_data_fifo_in = trained_model_emb_a[i+ind_emb_a*DIM_EMB*2]; 
                #`PERIOD_CLK_PCIE;
                user_w_write_16_wren_fifo_in = 1'b1;
                #`PERIOD_CLK_PCIE;
                user_w_write_16_wren_fifo_in = 1'b0;
            end
        end

    end
    else
    begin
        while(user_w_write_16_full_fifo_in==1'b1)
        begin
            #`PERIOD_CLK_PCIE;
        end
    end

    #`PERIOD_CLK_PCIE;
    user_w_write_16_data_fifo_in = 'b0;
end
endtask




// fifo data input - w load to fpga
task data_input_w_load_to_fpga_test;
    input [15:0] addr;
    input integer data_init;
begin
    if(user_w_write_16_full_fifo_in==1'b0)
    begin
        #`PERIOD_CLK_PCIE;
        //user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_MODE_W_LOAD_TO_FPGA,4'b0000,4'b0000,4'b0000}; 
        user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_MODE_W_LOAD_TO_FPGA}; 
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;

        #`PERIOD_CLK_PCIE;
        user_w_write_16_data_fifo_in = addr; 
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;

        for(i=0;i<DIM_EMB*2;i=i+1)
        begin
            #`PERIOD_CLK_PCIE;
            user_w_write_16_data_fifo_in = (i+data_init); 
            #`PERIOD_CLK_PCIE;
            user_w_write_16_wren_fifo_in = 1'b1;
            #`PERIOD_CLK_PCIE;
            user_w_write_16_wren_fifo_in = 1'b0;
        end

    end
    else
    begin
        while(user_w_write_16_full_fifo_in==1'b1)
        begin
            #`PERIOD_CLK_PCIE;
        end
    end

    #`PERIOD_CLK_PCIE;
    user_w_write_16_data_fifo_in = 'b0;
end
endtask




// fifo data input - w load to fpga
task data_input_set_mode_on;
begin
    if(user_w_write_16_full_fifo_in==1'b0)
    begin
        #`PERIOD_CLK_PCIE;
        user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_MODE_ON,4'b0000,4'b0000,4'b0000}; 
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;

        #`PERIOD_CLK_PCIE;
        user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_MODE_ON_1}; 
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;

        #`PERIOD_CLK_PCIE;
        user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_MODE_ON_2}; 
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;

    end
    else
    begin
        while(user_w_write_16_full_fifo_in==1'b1)
        begin
            #`PERIOD_CLK_PCIE;
        end
    end

    #`PERIOD_CLK_PCIE;
    user_w_write_16_data_fifo_in = 'b0;
end
endtask

// fifo data input - set_mode_off
task data_input_set_mode_off;
begin
    if(user_w_write_16_full_fifo_in==1'b0)
    begin
        #`PERIOD_CLK_PCIE;
        user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_MODE_OFF,4'b0000,4'b0000,4'b0000}; 
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;

        #`PERIOD_CLK_PCIE;
        user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_MODE_OFF_1}; 
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;

        #`PERIOD_CLK_PCIE;
        user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_MODE_OFF_2}; 
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;

    end
    else
    begin
        while(user_w_write_16_full_fifo_in==1'b1)
        begin
            #`PERIOD_CLK_PCIE;
        end
    end

    #`PERIOD_CLK_PCIE;
    user_w_write_16_data_fifo_in = 'b0;
end
endtask








// fifo data input - set lr_l2
task data_input_set_lr_l2;
begin
    if(user_w_write_16_full_fifo_in==1'b0)
    begin
        #`PERIOD_CLK_PCIE;
        user_w_write_16_data_fifo_in = {`TYPE_CODE_SET_LR_L2,4'b0000,4'b0011,4'b1001};   // type,4'b0,lr,l2
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;
    end
    else
    begin
        while(user_w_write_16_full_fifo_in==1'b1)
        begin
            #`PERIOD_CLK_PCIE;
        end
    end

    #`PERIOD_CLK_PCIE;
    user_w_write_16_data_fifo_in = 'b0;
end
endtask

// fifo data input - dummy
task data_input_dummy;
begin
    if(user_w_write_16_full_fifo_in==1'b0)
    begin
        #`PERIOD_CLK_PCIE;
        user_w_write_16_data_fifo_in = {`TYPE_CODE_DUMMY,4'b0000,4'b0000,4'b0000}; 
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b1;
        #`PERIOD_CLK_PCIE;
        user_w_write_16_wren_fifo_in = 1'b0;
    end
    else
    begin
        while(user_w_write_16_full_fifo_in==1'b1)
        begin
            #`PERIOD_CLK_PCIE;
        end
    end

    #`PERIOD_CLK_PCIE;
    user_w_write_16_data_fifo_in = 'b0;
end
endtask




// fifo data input
integer ind_words;
task data_input;
begin
    for(ind_words=0;ind_words<num_words;ind_words=ind_words+1)
    begin
        if(user_w_write_16_full_fifo_in==1'b0)
        begin
            #`PERIOD_CLK_PCIE;
            user_w_write_16_data_fifo_in = memory_tb[ind_words];
            #`PERIOD_CLK_PCIE;
            user_w_write_16_wren_fifo_in = 1'b1;
            #`PERIOD_CLK_PCIE;
            user_w_write_16_wren_fifo_in = 1'b0;
        end
        else
        begin
            while(user_w_write_16_full_fifo_in==1'b1)
            begin
                #`PERIOD_CLK_PCIE;
            end
            ind_words = ind_words - 1;
        end
    end

    #`PERIOD_CLK_PCIE;
    user_w_write_16_data_fifo_in = 'b0;
end
endtask




initial
begin
    #1000;

    /*
    i=0; 
    #100;
    user_w_write_16_data_fifo_in = memory_tb[i];
    #100;
    user_w_write_16_wren_fifo_in = 1'b1;
    #100;
    user_w_write_16_wren_fifo_in = 1'b0;
 
    #100;
    
    */
    /*
    for(i=0;i<num_words;i=i+1)
    begin
        if(user_w_write_16_full==1'b0)
        begin
            #100;
            user_w_write_16_data = memory_tb[i];
            #100;
            user_w_write_16_wren = 1'b1;
            #100;
            user_w_write_16_wren = 1'b0;
        end
        else
        begin
            while(user_w_write_16_full==1'b1)
            begin
                #100;
            end
            i = i - 1;
        end
    end

    #100
    user_w_write_16_data = 'b0;
    */

    //data_input;

    data_input_din_exp_shift_bit;

    data_input_set_lr_l2;

    data_input_dummy;

    //data_input_set_mode_on;

    //data_input_set_mode_off;
    //data_input_set_mode_on;

    //data_input_w_load_to_fpga;

    /*

    data_input_w_load_to_fpga_test(16'h0000,0);
    data_input_w_load_to_fpga_test(16'h1002,1);

    data_input_w_load_to_fpga_test(16'h2005,2);

    data_input_w_load_to_fpga_test(16'h301f,3);

    data_input_w_load_to_fpga_test(16'h4011,4);
    data_input_w_load_to_fpga_test(16'h4012,5);
    data_input_w_load_to_fpga_test(16'h4013,6);
    data_input_w_load_to_fpga_test(16'h4014,7);
    */


    //data_input_set_mode_off;


    for(itr_count=0;itr_count<NUM_ITR;itr_count=itr_count+1)
    begin
        data_input;
    end

end


/*
initial
begin
    itr_count = 0;
end

always@(posedge user_r_read_16_empty)
begin
    if(itr_count < NUM_ITR)
    begin
        data_input;

        itr_count = itr_count + 1;
    end
end
*/



// reset bridge
/*
reg rst_fifo;
reg rst_fifo_meta;
wire rst_fifo_async;
assign rst_fifo_async = !rst_sys;

// reset bridge - fifo
always@(posedge clk or posedge rst_fifo_async)
begin
    if(rst_fifo_async==1'b1)
        rst_fifo_meta <= 1'b1;
    else
        rst_fifo_meta <= 1'b0;
end

always@(posedge clk or posedge rst_fifo_async)
begin
    if(rst_fifo_async==1'b1)
        rst_fifo <= 1'b1;
    else
        rst_fifo <= rst_fifo_meta;
end
*/

//assign rst_fifo_in = rst_sys;
//assign rst_fifo_out = rst_sys;

wire user_w_write_8_open;
wire user_w_write_16_open;
wire user_r_read_16_open;

assign user_w_write_8_open = 1'b1;
assign user_w_write_16_open = 1'b1;
assign user_r_read_16_open = 1'b1;


// reset bridge - rst_fifo_in 8 bit
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

// reset bridge - rst_fifo_in
(* DONT_TOUCH="yes" *) reg rst_fifo_in;
(* DONT_TOUCH="yes" *) reg rst_fifo_in_meta;

always@(posedge clk_pcie)
begin
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
end

always@(posedge clk)
begin
    rst_fifo_out <= rst_fifo_out_meta;
end

// fifo in - 8 bit
//assign user_w_write_8_data_fifo_in = user_w_write_8_data;
//assign user_w_write_8_wren_fifo_in = user_w_write_8_wren;
//assign user_w_write_8_full = user_w_write_8_full_fifo_in;

// fifo in
//assign user_w_write_16_data_fifo_in = user_w_write_16_data;
//assign user_w_write_16_wren_fifo_in = user_w_write_16_wren;
//assign user_w_write_16_full = user_w_write_16_full_fifo_in;

// fifo out
//assign user_r_read_16_rden_fifo_out = user_r_read_16_rden;
//assign user_r_read_16_data = user_r_read_16_data_fifo_out;
//assign user_r_read_16_empty = user_r_read_16_empty_fifo_out;


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

integer ind_gen[15:0] = {15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0};

integer ind_w_fc_w_sm;
integer ind_w_fc;
integer ind_emb_a;
integer ind_emb_c;
integer ind_emb_q;
 
always
begin
    #(`PERIOD_CLK/2) clk = ~clk;
end
 

always
begin
    #(`PERIOD_CLK_PCIE/2) clk_pcie = ~clk_pcie;
end




   
initial
begin
    init_w_fc_w_sm_trig = 1'b0;
    init_w_fc_trig = 1'b0;
    init_emb_a_trig = 1'b0;
    init_emb_c_trig = 1'b0;
    init_emb_q_trig = 1'b0;

    done_init_w = 1'b0;
    done_init_emb_a = 1'b0;
    done_init_emb_c = 1'b0;
    done_init_emb_q = 1'b0;

    clk = 1'b0;
    clk_pcie = 1'b0;
    rst_sys = 1'b1;
    //en = 1'b0;
    en_init_sys = 1'b0;
    //data_in = 'b0;

    done_init_sim = 1'b0;
    done_init_memory_network = 1'b0;

    ind_w_fc_w_sm = 0;
    ind_w_fc = 0;
    ind_emb_a = 0;
    ind_emb_c = 0;
    ind_emb_q = 0;



end




`ifdef WRITE_MEM
integer ind_f_mem;
integer file_w_fc_w_sm_q7_24[0:DIM_EMB-1];
integer file_w_fc_q7_24[0:DIM_EMB-1];
integer file_w_emb_a_q7_24[0:DIM_EMB-1];
integer file_w_emb_c_q7_24[0:DIM_EMB-1];
integer file_w_emb_q_q7_24[0:DIM_EMB-1];

integer file_w_fc_w_sm_q11_20[0:DIM_EMB-1];
integer file_w_fc_q11_20[0:DIM_EMB-1];
integer file_w_emb_a_q11_20[0:DIM_EMB-1];
integer file_w_emb_c_q11_20[0:DIM_EMB-1];
integer file_w_emb_q_q11_20[0:DIM_EMB-1];

reg[50*8:0] f_name;

initial
begin
    // Q7.24
    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $sformat(f_name,"w_fc_w_sm_init_q7_24_%02d.mem",ind_f_mem);
        file_w_fc_w_sm_q7_24[ind_f_mem] = $fopen(f_name,"w");
        if(!file_w_fc_w_sm_q7_24[ind_f_mem])
        begin
            $display("Couldn't open file\n");
            $finish;
        end
    end

    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $sformat(f_name,"w_fc_init_q7_24_%02d.mem",ind_f_mem);
        file_w_fc_q7_24[ind_f_mem] = $fopen(f_name,"w");
        if(!file_w_fc_q7_24[ind_f_mem])
        begin
            $display("Couldn't open file\n");
            $finish;
        end
    end

    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $sformat(f_name,"w_emb_a_init_q7_24_%02d.mem",ind_f_mem);
        file_w_emb_a_q7_24[ind_f_mem] = $fopen(f_name,"w");
        if(!file_w_emb_a_q7_24[ind_f_mem])
        begin
            $display("Couldn't open file\n");
            $finish;
        end
    end

    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $sformat(f_name,"w_emb_c_init_q7_24_%02d.mem",ind_f_mem);
        file_w_emb_c_q7_24[ind_f_mem] = $fopen(f_name,"w");
        if(!file_w_emb_c_q7_24[ind_f_mem])
        begin
            $display("Couldn't open file\n");
            $finish;
        end
    end

    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $sformat(f_name,"w_emb_q_init_q7_24_%02d.mem",ind_f_mem);
        file_w_emb_q_q7_24[ind_f_mem] = $fopen(f_name,"w");
        if(!file_w_emb_q_q7_24[ind_f_mem])
        begin
            $display("Couldn't open file\n");
            $finish;
        end
    end

    // Q11.20
    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $sformat(f_name,"w_fc_w_sm_init_q11_20_%02d.mem",ind_f_mem);
        file_w_fc_w_sm_q11_20[ind_f_mem] = $fopen(f_name,"w");
        if(!file_w_fc_w_sm_q11_20[ind_f_mem])
        begin
            $display("Couldn't open file\n");
            $finish;
        end
    end

    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $sformat(f_name,"w_fc_init_q11_20_%02d.mem",ind_f_mem);
        file_w_fc_q11_20[ind_f_mem] = $fopen(f_name,"w");
        if(!file_w_fc_q11_20[ind_f_mem])
        begin
            $display("Couldn't open file\n");
            $finish;
        end
    end

    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $sformat(f_name,"w_emb_a_init_q11_20_%02d.mem",ind_f_mem);
        file_w_emb_a_q11_20[ind_f_mem] = $fopen(f_name,"w");
        if(!file_w_emb_a_q11_20[ind_f_mem])
        begin
            $display("Couldn't open file\n");
            $finish;
        end
    end

    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $sformat(f_name,"w_emb_c_init_q11_20_%02d.mem",ind_f_mem);
        file_w_emb_c_q11_20[ind_f_mem] = $fopen(f_name,"w");
        if(!file_w_emb_c_q11_20[ind_f_mem])
        begin
            $display("Couldn't open file\n");
            $finish;
        end
    end

    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $sformat(f_name,"w_emb_q_init_q11_20_%02d.mem",ind_f_mem);
        file_w_emb_q_q11_20[ind_f_mem] = $fopen(f_name,"w");
        if(!file_w_emb_q_q11_20[ind_f_mem])
        begin
            $display("Couldn't open file\n");
            $finish;
        end
    end
end
`endif


`ifdef SIM_FORCE_W
generate
for(j=0;j<DIM_EMB;j=j+1)
begin
    always@(posedge init_w_fc_w_sm_trig)
    begin
        #100;
        force memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.we = 1'b1;
        //for(ind_w_fc_w_sm=128*j;ind_w_fc_w_sm<(128*(j+1));ind_w_fc_w_sm=ind_w_fc_w_sm+1)
        //for(ind_w_fc_w_sm=0;ind_w_fc_w_sm<(DIM_IN-1)*DIM_EMB;ind_w_fc_w_sm=ind_w_fc_w_sm+1)
        for(ind_w_fc_w_sm=0;ind_w_fc_w_sm<(DIM_IN-1);)
        begin
            //if(ind_w_fc_w_sm%DIM_EMB == j)
            //begin
                force memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.data_in[31:24] = init_w_fc_w_sm[j+ind_w_fc_w_sm*DIM_EMB][7:0];
                force memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.data_in[23:16] = init_w_fc_w_sm[j+ind_w_fc_w_sm*DIM_EMB][15:8];
                force memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.data_in[15:8]  = init_w_fc_w_sm[j+ind_w_fc_w_sm*DIM_EMB][23:16];
                force memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.data_in[7:0]   = init_w_fc_w_sm[j+ind_w_fc_w_sm*DIM_EMB][31:24];
            //end

            #100;

`ifdef WRITE_MEM
            $fwrite(file_w_fc_w_sm_q7_24[j], "%h \n" ,memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.data_in);
            $fwrite(file_w_fc_w_sm_q11_20[j], "%h \n" ,$signed(memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.data_in) >>> 4);
`endif

            //force memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.addr = ind_w_fc_w_sm/DIM_EMB;
            force memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.addr = ind_w_fc_w_sm;

            if(j==0)
            begin
                ind_w_fc_w_sm = ind_w_fc_w_sm+1;
            end
        end

        release memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.data_in[31:24];
        release memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.data_in[23:16];
        release memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.data_in[15:8];
        release memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.data_in[7:0];
        
        force memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.we = 1'b0;

        #100;
    
        release memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.addr;
        release memory_network_top_module.memory_network_i.fc_w_sm.weight[j].weight.we;   
        
        done_init_w = 1'b1;
    end
end
endgenerate

generate
for(j=0;j<DIM_EMB;j=j+1)
begin
    always@(posedge init_w_fc_trig)
    begin
        #100;
        force memory_network_top_module.memory_network_i.fc.weight[j].weight.we = 1'b1;
        //for(ind_w_fc=128*j;ind_w_fc<(128*(j+1));ind_w_fc=ind_w_fc+1)
        //for(ind_w_fc=0;ind_w_fc<(DIM_EMB)*DIM_EMB;ind_w_fc=ind_w_fc+1)
        for(ind_w_fc=0;ind_w_fc<(DIM_EMB);)
        begin
            //if(ind_w_fc%DIM_EMB == j)
            //begin
                force memory_network_top_module.memory_network_i.fc.weight[j].weight.data_in[31:24] = init_w_fc[j+ind_w_fc*DIM_EMB][7:0];
                force memory_network_top_module.memory_network_i.fc.weight[j].weight.data_in[23:16] = init_w_fc[j+ind_w_fc*DIM_EMB][15:8];
                force memory_network_top_module.memory_network_i.fc.weight[j].weight.data_in[15:8]  = init_w_fc[j+ind_w_fc*DIM_EMB][23:16];
                force memory_network_top_module.memory_network_i.fc.weight[j].weight.data_in[7:0]   = init_w_fc[j+ind_w_fc*DIM_EMB][31:24];
            //end

            #100;

`ifdef WRITE_MEM
            $fwrite(file_w_fc_q7_24[j], "%h \n" ,memory_network_top_module.memory_network_i.fc.weight[j].weight.data_in);
            $fwrite(file_w_fc_q11_20[j], "%h \n" ,$signed(memory_network_top_module.memory_network_i.fc.weight[j].weight.data_in) >>> 4);
`endif

            //force memory_network_top_module.memory_network_i.fc.weight[j].weight.addr = ind_w_fc/DIM_EMB;
            force memory_network_top_module.memory_network_i.fc.weight[j].weight.addr = ind_w_fc;

            if(j==0)
            begin
                ind_w_fc = ind_w_fc+1;
            end
        end

        release memory_network_top_module.memory_network_i.fc.weight[j].weight.data_in[31:24];
        release memory_network_top_module.memory_network_i.fc.weight[j].weight.data_in[23:16];
        release memory_network_top_module.memory_network_i.fc.weight[j].weight.data_in[15:8];
        release memory_network_top_module.memory_network_i.fc.weight[j].weight.data_in[7:0];
        
        force memory_network_top_module.memory_network_i.fc.weight[j].weight.we = 1'b0;

        #100;
    
        release memory_network_top_module.memory_network_i.fc.weight[j].weight.addr;
        release memory_network_top_module.memory_network_i.fc.weight[j].weight.we;   
        
        done_init_w = 1'b1;
    end
end
endgenerate

generate
for(j=0;j<DIM_EMB;j=j+1)
begin : init_weights_emb_a
    always@(posedge init_emb_a_trig)
    begin
        force memory_network_top_module.memory_network_i.emb_a.weight[j].weight.we = 1'b1;
        #100;
        //for(ind_emb_a=0;ind_emb_a<((DIM_IN-1)*DIM_EMB);ind_emb_a=ind_emb_a+1)
        for(ind_emb_a=0;ind_emb_a<(DIM_IN-1);)
        begin
            //if(ind_emb_a%DIM_EMB == j)
            //begin
                force memory_network_top_module.memory_network_i.emb_a.weight[j].weight.data_in[31:24] = init_emb_a[j+ind_emb_a*DIM_EMB][7:0];
                force memory_network_top_module.memory_network_i.emb_a.weight[j].weight.data_in[23:16] = init_emb_a[j+ind_emb_a*DIM_EMB][15:8];
                force memory_network_top_module.memory_network_i.emb_a.weight[j].weight.data_in[15:8]  = init_emb_a[j+ind_emb_a*DIM_EMB][23:16];
                force memory_network_top_module.memory_network_i.emb_a.weight[j].weight.data_in[7:0]   = init_emb_a[j+ind_emb_a*DIM_EMB][31:24];
            //end

            #100;

`ifdef WRITE_MEM
            $fwrite(file_w_emb_a_q7_24[j], "%h \n" ,memory_network_top_module.memory_network_i.emb_a.weight[j].weight.data_in);
            $fwrite(file_w_emb_a_q11_20[j], "%h \n" ,$signed(memory_network_top_module.memory_network_i.emb_a.weight[j].weight.data_in) >>> 4);
`endif         

            //force memory_network_top_module.memory_network_i.emb_a.weight[j].weight.addr = ind_emb_a/DIM_EMB;
            force memory_network_top_module.memory_network_i.emb_a.weight[j].weight.addr = ind_emb_a;

            if(j==0)
            begin
                ind_emb_a = ind_emb_a+1;
            end
        end

        //force memory_network_top_module.memory_network_i.emb_a.weight[j].weight.we = 1'bz;
        
        release memory_network_top_module.memory_network_i.emb_a.weight[j].weight.data_in[31:24];
        release memory_network_top_module.memory_network_i.emb_a.weight[j].weight.data_in[23:16];
        release memory_network_top_module.memory_network_i.emb_a.weight[j].weight.data_in[15:8];
        release memory_network_top_module.memory_network_i.emb_a.weight[j].weight.data_in[7:0];

        force memory_network_top_module.memory_network_i.emb_a.weight[j].weight.we = 1'b0;
        
        
        #100;

        release memory_network_top_module.memory_network_i.emb_a.weight[j].weight.addr;
        release memory_network_top_module.memory_network_i.emb_a.weight[j].weight.we;   
        
        done_init_emb_a = 1'b1;
    end
end
endgenerate


generate
for(j=0;j<DIM_EMB;j=j+1)
begin : init_weights_emb_c
    always@(posedge init_emb_c_trig)
    begin
        force memory_network_top_module.memory_network_i.emb_c.weight[j].weight.we = 1'b1;
        #100;
        //for(ind_emb_c=0;ind_emb_c<(DIM_IN-1)*DIM_EMB;ind_emb_c=ind_emb_c+1)
        for(ind_emb_c=0;ind_emb_c<(DIM_IN-1);)
        begin
            //if(ind_emb_c%DIM_EMB == j)
            //begin
                force memory_network_top_module.memory_network_i.emb_c.weight[j].weight.data_in[31:24] = init_emb_c[j+ind_emb_c*DIM_EMB][7:0];
                force memory_network_top_module.memory_network_i.emb_c.weight[j].weight.data_in[23:16] = init_emb_c[j+ind_emb_c*DIM_EMB][15:8];
                force memory_network_top_module.memory_network_i.emb_c.weight[j].weight.data_in[15:8]  = init_emb_c[j+ind_emb_c*DIM_EMB][23:16];
                force memory_network_top_module.memory_network_i.emb_c.weight[j].weight.data_in[7:0]   = init_emb_c[j+ind_emb_c*DIM_EMB][31:24];
            //end
   
            #100;

`ifdef WRITE_MEM
            $fwrite(file_w_emb_c_q7_24[j], "%h \n" ,memory_network_top_module.memory_network_i.emb_c.weight[j].weight.data_in);
            $fwrite(file_w_emb_c_q11_20[j], "%h \n" ,$signed(memory_network_top_module.memory_network_i.emb_c.weight[j].weight.data_in) >>> 4);
`endif    

            //force memory_network_top_module.memory_network_i.emb_c.weight[j].weight.addr = ind_emb_c/DIM_EMB;
            force memory_network_top_module.memory_network_i.emb_c.weight[j].weight.addr = ind_emb_c;

            if(j==0)
            begin
                ind_emb_c = ind_emb_c+1;
            end
        end

        release memory_network_top_module.memory_network_i.emb_c.weight[j].weight.data_in[31:24];
        release memory_network_top_module.memory_network_i.emb_c.weight[j].weight.data_in[23:16];
        release memory_network_top_module.memory_network_i.emb_c.weight[j].weight.data_in[15:8];
        release memory_network_top_module.memory_network_i.emb_c.weight[j].weight.data_in[7:0];
 
        force memory_network_top_module.memory_network_i.emb_c.weight[j].weight.we = 1'b0;

        #100;
    
        release memory_network_top_module.memory_network_i.emb_c.weight[j].weight.addr;
        release memory_network_top_module.memory_network_i.emb_c.weight[j].weight.we;   
        
        done_init_emb_c = 1'b1;
    end
end
endgenerate


generate
for(j=0;j<DIM_EMB;j=j+1)
begin : init_weights_emb_q
    always@(posedge init_emb_q_trig)
    begin
        force memory_network_top_module.memory_network_i.emb_q.weight[j].weight.we = 1'b1;
        #100;
        //for(ind_emb_q=0;ind_emb_q<(DIM_IN*DIM_EMB);ind_emb_q=ind_emb_q+1)
        //for(ind_emb_q=0;ind_emb_q<(DIM_IN-1)*DIM_EMB;ind_emb_q=ind_emb_q+1)
        for(ind_emb_q=0;ind_emb_q<(DIM_IN-1);)
        begin
            //if(ind_emb_q%DIM_EMB == j)
            //begin
                force memory_network_top_module.memory_network_i.emb_q.weight[j].weight.data_in[31:24] =  init_emb_q[j+ind_emb_q*DIM_EMB][7:0];
                force memory_network_top_module.memory_network_i.emb_q.weight[j].weight.data_in[23:16] =  init_emb_q[j+ind_emb_q*DIM_EMB][15:8];
                force memory_network_top_module.memory_network_i.emb_q.weight[j].weight.data_in[15:8]  =  init_emb_q[j+ind_emb_q*DIM_EMB][23:16];
                force memory_network_top_module.memory_network_i.emb_q.weight[j].weight.data_in[7:0]   =  init_emb_q[j+ind_emb_q*DIM_EMB][31:24];
            //end
           
            #100;

`ifdef WRITE_MEM
            $fwrite(file_w_emb_q_q7_24[j], "%h \n" ,memory_network_top_module.memory_network_i.emb_q.weight[j].weight.data_in);
            $fwrite(file_w_emb_q_q11_20[j], "%h \n" ,$signed(memory_network_top_module.memory_network_i.emb_q.weight[j].weight.data_in) >>> 4);
`endif 

            //force memory_network_top_module.memory_network_i.emb_q.weight[j].weight.addr = ind_emb_q/DIM_EMB;
            force memory_network_top_module.memory_network_i.emb_q.weight[j].weight.addr = ind_emb_q;

            if(j==0)
            begin
                ind_emb_q = ind_emb_q+1;
            end
        end

        release memory_network_top_module.memory_network_i.emb_q.weight[j].weight.data_in[31:24];
        release memory_network_top_module.memory_network_i.emb_q.weight[j].weight.data_in[23:16];
        release memory_network_top_module.memory_network_i.emb_q.weight[j].weight.data_in[15:8];
        release memory_network_top_module.memory_network_i.emb_q.weight[j].weight.data_in[7:0];
 
        force memory_network_top_module.memory_network_i.emb_q.weight[j].weight.we = 1'b0;

        #100;
    
        release memory_network_top_module.memory_network_i.emb_q.weight[j].weight.addr;
        release memory_network_top_module.memory_network_i.emb_q.weight[j].weight.we;   

        done_init_emb_q = 1'b1;
    end
end
endgenerate
`endif


// tmp
always@(posedge clk_pcie)
begin
    if(rst_sys==1'b1)
        user_r_read_16_rden_fifo_out <= 1'b0;
    else
        user_r_read_16_rden_fifo_out <= user_w_write_16_wren_fifo_out;
end

assign en_init_memn2n = en_init_sys | en_init_cmd;

memory_network_top
memory_network_top_module
(
    // clk
    .clk(clk),
    // rst_sys
    .rst_sys(rst_sys),
    .en_init_sys(en_init_memn2n),
    // input
    //.full_fifo_out(user_w_write_16_full_fifo_out),
    .empty_fifo_in(user_r_read_16_empty_fifo_in),
    .valid_fifo_in(user_r_read_16_val_fifo_in),
    .valid_fifo_out(user_r_read_16_val_fifo_out),
    .dout_fifo_in(user_r_read_16_data_fifo_in),
    .done_init_memory_network(done_init_memory_network),
    //.lr_l2(reg_lr_l2),
    // output
    //.rst_fifo_in(rst_fifo_in),
    //.rst_fifo_out(rst_fifo_out),
    .rd_en_fifo_in(user_r_read_16_rden_fifo_in),
    .wr_en_fifo_out(user_w_write_16_wren_fifo_out),
    .din_fifo_out(user_w_write_16_data_fifo_out)
);


global_controller
global_controller_module
(
    // clk
    .clk(clk),
    // rst_n
    .rst_n(!rst_sys),
    // input
    .empty_fifo_in(user_r_read_8_empty_fifo_in),
    .valid_fifo_in(user_r_read_8_val_fifo_in),
    .data_fifo_in(user_r_read_8_data_fifo_in),
    //.lr_l2(lr_l2),
    // output
    .re_fifo_in(user_r_read_8_rden_fifo_in),
    .en_init_cmd(en_init_cmd),
    .lr_l2(),
    .rst_n_memn2n_cmd(rst_n_memn2n_cmd)
);


initial
begin
    #30
    rst_sys= 1'b1;
    
    #200
    rst_sys= 1'b0;


    /*
    #`PERIOD_CLK_PCIE;
    user_w_write_8_data_fifo_in = `CMD_RST_MEMN2N;
    #`PERIOD_CLK_PCIE;
    user_w_write_8_wren_fifo_in = 1'b1;
    #`PERIOD_CLK_PCIE;
    user_w_write_8_wren_fifo_in = 1'b0;
    */
    



    /*
    #`PERIOD_CLK_PCIE;
    user_w_write_8_data_fifo_in = 8'b0010_1001;
    #`PERIOD_CLK_PCIE;
    user_w_write_8_wren_fifo_in = 1'b1;
    #`PERIOD_CLK_PCIE;
    user_w_write_8_wren_fifo_in = 1'b0;
    */


    #21000;
    
    // en_init_sys
    /*
    #100
    en_init_sys = 1'b1;
    
    #100
    en_init_sys = 1'b0;
    */

    // en_init_cmd
    /*
    #`PERIOD_CLK_PCIE;
    user_w_write_8_data_fifo_in = `CMD_INIT;
    #`PERIOD_CLK_PCIE;
    user_w_write_8_wren_fifo_in = 1'b1;
    #`PERIOD_CLK_PCIE;
    user_w_write_8_wren_fifo_in = 1'b0;
    */


    
    //#20000; // init time

    //
    


`ifdef SIM_FORCE_W
    // init weight for test
    init_w_fc_w_sm_trig = 1'b1;
    init_w_fc_trig = 1'b1;
    init_emb_a_trig = 1'b1;
    init_emb_c_trig = 1'b1;
    init_emb_q_trig = 1'b1;

    #100;

    init_w_fc_w_sm_trig = 1'b0;
    init_w_fc_trig = 1'b0;
    init_emb_a_trig = 1'b0;
    init_emb_c_trig = 1'b0;
    init_emb_q_trig = 1'b0;

    //#(100*128*16);
    #(23000);
    #(4000);


    done_init_sim = 1'b1;

    


    #100;
`ifdef WRITE_MEM
    for(ind_f_mem=0;ind_f_mem<DIM_EMB;ind_f_mem=ind_f_mem+1)
    begin
        $fclose(file_w_fc_w_sm_q7_24[ind_f_mem]);
        $fclose(file_w_fc_q7_24[ind_f_mem]);
        $fclose(file_w_emb_a_q7_24[ind_f_mem]);
        $fclose(file_w_emb_c_q7_24[ind_f_mem]);
        $fclose(file_w_emb_q_q7_24[ind_f_mem]);

        $fclose(file_w_fc_w_sm_q11_20[ind_f_mem]);
        $fclose(file_w_fc_q11_20[ind_f_mem]);
        $fclose(file_w_emb_a_q11_20[ind_f_mem]);
        $fclose(file_w_emb_c_q11_20[ind_f_mem]);
        $fclose(file_w_emb_q_q11_20[ind_f_mem]);
    end
`endif

`endif // SIM_FORCE_W
    
    #100;
    done_init_memory_network = 1'b1;


end






initial
begin
    $display("START TB MEMN2N");
end

/*
reg en_count_num_sample;
wire _en_count_num_sample;
wire [16-1:0] num_sample;


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_count_num_sample <= 1'b0;
    else
        if(rb_n==1'b0)
            en_count_num_sample <= _en_count_num_sample;
end

assign _en_count_num_sample = rb_n || en_count_num_sample;

counter
#(
    .BW(16),
    .COUNT_VALUE(1024*16)
)
count_num_sample
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    .en(en_count_num_sample),
    // output
    .count(num_sample)
);
*/

integer ind_word;
integer ind_itr;


always@(negedge rb_n or negedge rst_n)
begin
    if(rst_n==1'b0)
        ind_word = 0;
    else
        ind_word = ind_word + 1;

    ind_itr = ind_word / num_words;

end




endmodule
