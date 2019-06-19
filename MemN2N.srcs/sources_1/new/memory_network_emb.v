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

module memory_network_emb
(
    // clock
    clk,
    // reset_n
    rst_n,
    rst_n_soft,
    rst_n_batch,
    rst_n_hop,
    // input
    en_init_w,
    data_in_init_w,
    addr_in_init_w,
    en_fwd_path,
    en_bwd_path,
    en_bwd_path_w_up,
    data_in,
    grad_in,
    data_word_in,
    we_data_word_in,
    done_data_word_in,
    lr_l2,
    // output
    data_out,
    done_init_w,
    done_fwd_path,
    done_bwd_path,
    done_bwd_path_w_up,
    re_data_word_in,
    // debug
    debug_out
);
////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter BW_DIM_IN = `BW_DIM_IN;
parameter BW_DIM_EMB = `BW_DIM_EMB;

parameter DIM_IN = BW_DIM_IN;
parameter DIM_EMB = 1<<BW_DIM_EMB;

parameter BW_DATA = `BW_DATA_EMB_W;
//parameter BW_ADDR = `CLOG2(BW_DIM_IN);        // should make it parameter
parameter BW_ADDR = 8;        // should make it parameterable

//parameter BW_COUNTER_IN = `CLOG2(BW_DIM_IN);
//parameter COUNT_VALUE_IN = (1 << BW_COUNTER_IN) - 1;
//parameter BW_COUNTER_IN = 8;
parameter BW_COUNTER_IN = `CLOG2(BW_DIM_IN);
parameter COUNT_VALUE_IN = DIM_IN-1;

parameter BW_MEM_ADDR = `BW_MEM_ADDR;

parameter BW_WORD_VEC = `BW_WORD_VEC;

parameter LEARNING_RATE_SHIFT_BITS = `LEARNING_RATE_SHIFT_BITS;
parameter REG_L2_NORM_SHIFT_BITS = `REG_L2_NORM_SHIFT_BITS;
parameter BW_BATCH_SIZE = `BW_BATCH_SIZE;

parameter BW_W_UP_HOP = 0;

parameter INIT_FILE = "";

parameter BW_ADDR_W_INIT = `BW_ADDR_W_INIT;


////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clock
input wire clk;
// reset_n
input wire rst_n;
input wire rst_n_soft;
input wire rst_n_batch;
input wire rst_n_hop;
// input
input wire en_init_w;
input wire [BW_DATA*DIM_EMB-1:0] data_in_init_w;
input wire [BW_ADDR_W_INIT-1:0] addr_in_init_w;
input wire en_fwd_path;
input wire en_bwd_path;
input wire en_bwd_path_w_up;
input wire [BW_WORD_VEC-1:0] data_in;
input wire [BW_DATA*DIM_EMB-1:0] grad_in;
input wire [BW_WORD_VEC-1:0] data_word_in;
input wire we_data_word_in;
input wire done_data_word_in;
input wire [7:0] lr_l2;
// output
output reg [BW_DATA*DIM_EMB-1:0] data_out;

output reg done_init_w;
output reg done_fwd_path;
output reg done_bwd_path;
output reg done_bwd_path_w_up;

output reg re_data_word_in;

output reg [`BW_DEBUG_EMB-1:0] debug_out;

////////////////////////////////////////////////////////////
// internal signals
////////////////////////////////////////////////////////////
// internal
wire [BW_COUNTER_IN-1:0] count_addr_w_in;
reg [BW_COUNTER_IN-1:0] addr_w;
wire en_addr_w_in;
wire rst_n_addr_w_in;

//reg [BW_DIM_IN-1:0] buf_in;
reg [BW_DATA-1:0] buf_out [0:DIM_EMB-1];
//wire [BW_DATA*DIM_EMB-1:0] buf_out_in;
wire [BW_DATA*DIM_EMB-1:0] data_unmasked;

//wire [BW_DATA*DIM_EMB-1:0] data_w;
wire [BW_DATA-1:0] data_w_accu [0:DIM_EMB-1];

wire [BW_DATA-1:0] data_accu [0:DIM_EMB-1];



wire we_w;

//wire ctrl_buf_out_in;
//wire ctrl_buf_out_in_w_up;
//wire en_counter_w_up;
//wire enable_w_up;

//wire [BW_DATA*DIM_EMB-1:0] data_write;
//wire [BW_DATA-1:0] data_write [0:DIM_EMB-1];
//wire _ctrl_buf_out_in_w_up;
//wire _we_w_up;
//nwire _en_counter_w_up;

wire [BW_DATA*DIM_EMB-1:0] data_init_w;

genvar i;

reg en_init_w_sync;
reg en_fwd_path_sync;
reg en_bwd_path_sync;
reg en_bwd_path_w_up_sync;


reg re_n_data_word_in;

reg [DIM_IN-1:0] dirty_w_del;


reg f_dirty_w_del;



reg en_w_up;
wire en_w_up_latch;
reg [BW_DATA-1:0] data_w_up [0:DIM_EMB-1];

reg [BW_COUNTER_IN-1:0] addr_w_up;



reg [BW_DATA-1:0] _add_in_a [0:DIM_EMB-1];
reg [BW_DATA-1:0] _add_in_b [0:DIM_EMB-1];
wire [BW_DATA-1:0] _add_out [0:DIM_EMB-1];


reg done_w_up;

reg [BW_COUNTER_IN-1:0] _addr_w_del;
wire [BW_COUNTER_IN-1:0] addr_w_del;

wire we_w_del;
reg [BW_DATA-1:0] _data_w_del [0:DIM_EMB-1];
//wire [BW_DATA-1:0] data_w_del [0:DIM_EMB-1];

reg we_data_word_in_delayed;

reg we_data_word_in_delayed_2;

reg [BW_DATA-1:0] data_w_del_tmp [0:DIM_EMB-1];

wire rst_n_w_del;



wire [BW_DATA-1:0] data_in_w [0:DIM_EMB-1];
wire [BW_DATA-1:0] data_out_w [0:DIM_EMB-1];

wire [BW_DATA-1:0] data_in_w_del [0:DIM_EMB-1];
wire [BW_DATA-1:0] data_out_w_del [0:DIM_EMB-1];


wire _done_bwd_path;
wire _done_bwd_path_w_up;

wire _re_data_word_in;

reg [3:0] lr;
reg [3:0] l2;

//
wire [DIM_EMB-1:0] overflow_adder;
wire [DIM_EMB-1:0] overflow_adder_l2;

wire [DIM_EMB-1:0] underflow_adder;
wire [DIM_EMB-1:0] underflow_adder_l2;

wire [BW_DATA-1:0] _grad_in [0:DIM_EMB-1];
////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
//assign rst_n_addr_w_in = rst_n && !done_addr_w_in;
//assign rst_n_addr_w_in = rst_n && (en_init_w_sync || en_fwd_path_sync || en_bwd_path_w_up_sync);
assign rst_n_addr_w_in = rst_n && (en_fwd_path_sync || en_bwd_path_w_up_sync);

//assign ctrl_buf_out_in = ctrl_buf_out_in_w_up;
//assign enable_w_up = en_bwd_path_w_up_sync;
//assign enable_w_up = 1'b0;

//assign buf_out_in = (ctrl_buf_out_in==1'b0) ? data_accu : buf_g ;
//assign buf_out_in = (ctrl_buf_out_in==1'b0) ? data_accu : {BW_DATA*DIM_EMB{1'b0}};
//assign buf_out_in = data_accu;

//assign ctrl_buf_out_in_w_up = enable_w_up&&_ctrl_buf_out_in_w_up;
//assign we_w = en_init_w_sync || enable_w_up&&_we_w_up || en_bwd_path_w_up_sync&&done_w_up;
assign we_w = en_init_w_sync || en_bwd_path_w_up_sync&&done_w_up;

//assign en_counter_w_up = enable_w_up&&_en_counter_w_up;

//assign data_w_accu = (we_w==1'b0) ? data_w : 'bz;
//assign data_w = (we_w == 1'b1) ? data_write : 'bz;


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_data_w_accu
        assign data_w_accu[i] = data_out_w[i];
    end
endgenerate
//assign data_w_in = data_write;

//assign data_init_w = {BW_DATA*DIM_EMB{1'b1}};
//assign data_init_w = {DIM_EMB{32'h0000_0001}};  // init weight - should modify later 
//assign data_init_w = `INIT_WEIGHT_EMB; 
assign data_init_w = data_in_init_w;


//assign data_write = (en_init_w_sync== 1'b1) ? data_init_w:buf_out;

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        //assign data_write[(i+1)*BW_DATA-1-:BW_DATA] = (en_init_w_sync== 1'b1) ? data_init_w[(i+1)*BW_DATA-1-:BW_DATA]:((en_bwd_path_w_up_sync==1'b1&&done_w_up==1'b1)? data_w_up[i]:{BW_DATA{1'b0}});
        assign data_in_w[i] = (en_init_w_sync== 1'b1) ? data_init_w[(i+1)*BW_DATA-1-:BW_DATA]:((en_bwd_path_w_up_sync==1'b1&&done_w_up==1'b1)? data_w_up[i]:{BW_DATA{1'b0}});
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                data_out[(i+1)*BW_DATA-1-:BW_DATA] <= {(BW_DATA){1'b0}};
            else    
                data_out[(i+1)*BW_DATA-1-:BW_DATA] <= buf_out[i];
        end
    end
endgenerate

always@(*)
begin
    case({en_init_w_sync,en_fwd_path_sync,en_bwd_path_w_up_sync})
        3'b100 :
        begin
            //addr_w = count_addr_w_in;
            addr_w = addr_in_init_w[BW_COUNTER_IN-1:0];
        end
        3'b010 :
        begin
            addr_w = data_in[BW_COUNTER_IN-1:0];
        end
        3'b001 :
        begin
            addr_w = count_addr_w_in;
        end
        default
        begin
            addr_w = 'b0;
        end
    endcase
end

assign _done_init_w = en_init_w_sync && done_addr_w_in;
//assign done_fwd_path = en_fwd_path_sync && done_addr_w_in;
assign _done_bwd_path_w_up = en_bwd_path_w_up_sync && done_addr_w_in;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_bwd_path_w_up <= 1'b0;
    else
        done_bwd_path_w_up <= _done_bwd_path_w_up;
end


////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_init_w==1'b1)
        en_init_w_sync <= 1'b0;
    else
        if(en_init_w_sync==1'b0)
            en_init_w_sync <= en_init_w; 
end
*/

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_init_w <= 1'b0;
    else
        done_init_w <= _done_init_w;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_init_w_sync <= 1'b0;
    else
        en_init_w_sync <= !done_init_w && (en_init_w_sync || en_init_w);
end
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_init_w_sync <= 1'b0;
    else
        en_init_w_sync <= en_init_w;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_fwd_path==1'b1)
    if(rst_n==1'b0)
        en_fwd_path_sync <= 1'b0;
    else
        if(done_fwd_path==1'b1)
            en_fwd_path_sync <= 1'b0;
        else if(en_fwd_path_sync==1'b0)
            en_fwd_path_sync <= en_fwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_sync <= 1'b0;
    else
        if(_done_bwd_path==1'b1)
            en_bwd_path_sync <= 1'b0;
        else if(en_bwd_path_sync==1'b0)
            en_bwd_path_sync <= en_bwd_path;
end

//assign done_bwd_path = done_data_word_in;
assign _done_bwd_path = done_data_word_in;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_bwd_path <= 1'b0;
    else
        done_bwd_path <= _done_bwd_path;
end

assign _re_data_word_in = en_bwd_path_sync && !re_n_data_word_in;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        re_data_word_in <= 1'b0;
    else
        re_data_word_in <= _re_data_word_in;
end

always@(posedge clk or negedge rst_n or negedge rst_n_soft or negedge rst_n_hop)
begin
    //if(rst_n==1'b0 || rst_n_soft==1'b0 || we_w_del==1'b1) 
    if(rst_n==1'b0 || rst_n_soft==1'b0 || rst_n_hop==1'b0) 
        re_n_data_word_in <= 1'b0;
    else
        if(we_w_del==1'b1)
            re_n_data_word_in <= 1'b0;
        else if(re_n_data_word_in==1'b0)
            re_n_data_word_in <= en_bwd_path_sync;
end



always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_w_up_sync <= 1'b0;
    else
        if(_done_bwd_path_w_up==1'b1)
            en_bwd_path_w_up_sync <= 1'b0;
        else if(en_bwd_path_w_up_sync==1'b0)
            en_bwd_path_w_up_sync <= en_bwd_path_w_up;
end


always@(posedge clk or negedge rst_n)
begin
    /*
    if(rst_n==1'b0 || done_fwd_path==1'b1)
        done_fwd_path <= 1'b0;
    else
        if(en_fwd_path_sync==1'b1)
            done_fwd_path <= en_fwd_path_sync;
    */
    if(rst_n==1'b0)
        done_fwd_path <= 1'b0;
    else
        done_fwd_path <= !done_fwd_path && en_fwd_path_sync;
end




// sequential logic

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        always@(posedge clk or negedge rst_n or negedge rst_n_soft)
        begin
            if(rst_n==1'b0 || rst_n_soft == 1'b0)
                buf_out[i] <= {(BW_DATA){1'b0}};
            else
                //if(en_fwd_path_sync==1'b1)
                if(done_fwd_path==1'b1)
                    buf_out[i] <= data_accu[i];
        end
    end
endgenerate


//assign rst_n_soft = rst_n && !(en_fwd_path_init_sync&&(!en_fwd_path_sync));
//assign rst_n_soft = rst_n;

/*
wire rst_n_dirty_w_del;

assign rst_n_dirty_w_del = rst_n && rst_n_batch;

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : assign_drity_w_del
        always@(posedge clk or negedge rst_n or negedge rst_n_batch)
        begin
            if(rst_n_dirty_w_del==1'b0)
                dirty_w_del[i] <= 1'b0;
            else
                if(en_bwd_path_sync==1'b1 && i==addr_w_del && we_w_del==1'b1)
                    dirty_w_del[i] <= 1'b1;
        end
    end
endgenerate
*/

always@(posedge clk or negedge rst_n or negedge rst_n_batch)
begin
    if(rst_n==1'b0 || rst_n_batch==1'b0)
        dirty_w_del <= {DIM_IN{1'b0}};
    else
        if(en_bwd_path_sync==1'b1 && we_w_del==1'b1)
            dirty_w_del[addr_w_del] <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        lr <= 4'b0;
    else
        lr <= lr_l2[7:4];
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        l2 <= 4'b0;
    else
        l2 <= lr_l2[3:0];
end


////////////////////////////////////////////////////////////
// instances
////////////////////////////////////////////////////////////
//
/*
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
*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign _grad_in[i] = grad_in[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

reg [BW_DATA-1:0] shifted_lr_grad_in [0:DIM_EMB-1];

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        always@(*)
        begin
            case(lr)
                4'b0000:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (0+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0001:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (1+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0010:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (2+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0011:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (3+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0100:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (4+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0101:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (5+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0110:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (6+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0111:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (7+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1000:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (8+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1001:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (9+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1010:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (10+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1011:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (11+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1100:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (12+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1101:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (13+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1110:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (14+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1111:
                begin
                    shifted_lr_grad_in[i] = $signed(_grad_in[i]) >>> (15+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
            endcase
        end
    end
endgenerate


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_add_in_a
        always@(*)
        begin
            case({en_fwd_path_sync,en_bwd_path_sync,en_bwd_path_w_up_sync})
                3'b100 :
                begin
                    //_add_in_a[i] = buf_out[(i+1)*BW_DATA-1-:BW_DATA];
                    _add_in_a[i] = buf_out[i];
                end
                3'b010 :
                begin
                    if(f_dirty_w_del==1'b1)
                        //_add_in_a[i] = grad_in[(i+1)*BW_DATA-1-:BW_DATA];
                        if(shifted_lr_grad_in[i][BW_DATA-1]==1'b0)
                            _add_in_a[i] = shifted_lr_grad_in[i];
                        else
                            _add_in_a[i] = shifted_lr_grad_in[i]+1'b1;
                    else
                        _add_in_a[i] = {BW_DATA{1'b0}};
                end
                3'b001 :
                begin
                    //if(en_addr_w_in==1'b0)
                    //if(en_bwd_path_w_up_sync==1'b1)
                        //_add_in_a[i] = data_w[(i+1)*BW_DATA-1-:BW_DATA];
                        
                        _add_in_a[i] = data_out_w[i];
                        //_add_in_a[i] = $signed(~shifted_lr_l2_data_out_w[i]+1'b1);
                    //else
                    //    _add_in_a[i] = {BW_DATA{1'b0}};                  
                end
                default
                begin
                    _add_in_a[i] = {BW_DATA{1'b0}};
                end
            endcase
        end
    end
endgenerate

/*
reg [BW_DATA-1:0] shifted_lr_data_out_w_del [0:DIM_EMB-1];

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        always@(*)
        begin
            case(lr)
                4'b0000:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (0+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0001:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (1+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0010:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (2+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0011:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (3+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0100:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (4+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0101:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (5+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0110:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (6+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b0111:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (7+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1000:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (8+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1001:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (9+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1010:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (10+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1011:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (11+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1100:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (12+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1101:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (13+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1110:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (14+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
                4'b1111:
                begin
                    shifted_lr_data_out_w_del[i] = $signed(data_out_w_del[i]) >>> (15+BW_BATCH_SIZE+BW_W_UP_HOP);
                end
            endcase
        end
    end
endgenerate
*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_add_in_b
        always@(*)
        begin
            case({en_fwd_path_sync,en_bwd_path_sync,en_bwd_path_w_up_sync})
                3'b100 :
                begin
                    _add_in_b[i] = data_w_accu[i];
                end
                3'b010 :
                begin
                    if(f_dirty_w_del==1'b1)
                        _add_in_b[i] = data_out_w_del[i];
                    else
                        _add_in_b[i] = {BW_DATA{1'b0}};
                end
                3'b001 :
                begin
                    //if(en_addr_w_in==1'b0)
                    //if(en_bwd_path_w_up_sync==1'b1)
                        //_add_in_b[i] = $signed(~data_out_w_del[i]+1'b1) >>> (LEARNING_RATE_SHIFT_BITS+BW_BATCH_SIZE+BW_W_UP_HOP);
                        //_add_in_b[i] = $signed(~data_out_w_del[i]+1'b1) >>> (lr+BW_BATCH_SIZE+BW_W_UP_HOP);
                        
                        //_add_in_b[i] = $signed(~shifted_lr_data_out_w_del[i]+1'b1);
                        _add_in_b[i] = $signed(~data_out_w_del[i]+1'b1);
                    //else
                    //    _add_in_b[i] = {BW_DATA{1'b0}};
                end
                default
                begin
                    _add_in_b[i] = {BW_DATA{1'b0}};
                end
            endcase
        end
    end
endgenerate


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign data_accu[i] = (en_fwd_path_sync==1'b1) ? _add_out[i]:{BW_DATA{1'b0}};
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : fix_adder
        fixed_adder
        #(
            .WL(`BW_WL),
            .IWL(`BW_IWL)
        )
        adder
        (
            /*
            .a(buf_out[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(data_w_accu[(i+1)*BW_DATA-1-:BW_DATA]),
            .c(data_accu[(i+1)*BW_DATA-1-:BW_DATA])
            */
            .a(_add_in_a[i]),
            .b(_add_in_b[i]),
            .c(_add_out[i]),
            .overflow(overflow_adder[i]),
            .underflow(underflow_adder[i])
        );
    end
endgenerate


wire [BW_DATA-1:0] _add_in_reg_l2_a [0:DIM_EMB-1];
reg [BW_DATA-1:0] _add_in_reg_l2_b [0:DIM_EMB-1];
wire [BW_DATA-1:0] _add_out_reg_l2 [0:DIM_EMB-1];

reg [BW_DATA-1:0] shifted_lr_data_out_w [0:DIM_EMB-1];
reg [BW_DATA-1:0] shifted_lr_l2_data_out_w [0:DIM_EMB-1];


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign _add_in_reg_l2_a[i] = (en_bwd_path_w_up_sync==1'b1) ? _add_out[i] : {BW_DATA{1'b0}};
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        always@(*)
        begin
            case(lr)
                4'b0000:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]);
                end
                4'b0001:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (1);
                end
                4'b0010:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (2);
                end
                4'b0011:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (3);
                end
                4'b0100:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (4);
                end
                4'b0101:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (5);
                end
                4'b0110:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (6);
                end
                4'b0111:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (7);
                end
                4'b1000:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (8);
                end
                4'b1001:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (9);
                end
                4'b1010:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (10);
                end
                4'b1011:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (11);
                end
                4'b1100:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (12);
                end
                4'b1101:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (13);
                end
                4'b1110:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (14);
                end
                4'b1111:
                begin
                    shifted_lr_data_out_w[i] = $signed(data_out_w[i]) >>> (15);
                end
            endcase
        end
    end
endgenerate


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        always@(*)
        begin
            case(l2)
                4'b0000:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]);
                end
                4'b0001:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 1;
                end
                4'b0010:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 2;
                end
                4'b0011:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 3;
                end
                4'b0100:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 4;
                end
                4'b0101:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 5;
                end
                4'b0110:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 6;
                end
                4'b0111:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 7;
                end
                4'b1000:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 8;
                end
                4'b1001:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 9;
                end
                4'b1010:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 10;
                end
                4'b1011:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 11;
                end
                4'b1100:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 12;
                end
                4'b1101:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 13;
                end
                4'b1110:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 14;
                end
                4'b1111:
                begin
                    shifted_lr_l2_data_out_w[i] = $signed(shifted_lr_data_out_w[i]) >>> 15;
                end
            endcase
        end
    end
endgenerate



generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        //assign _add_in_reg_l2_b[i] = (en_bwd_path_w_up_sync==1'b1) ? $signed(~data_out_w[i]+1'b1) >>> (LEARNING_RATE_SHIFT_BITS + REG_L2_NORM_SHIFT_BITS) : $signed({BW_DATA{1'b0}});
        //assign _add_in_reg_l2_b[i] = (en_bwd_path_w_up_sync==1'b1) ? $signed(~data_out_w[i]+1'b1) >>> (lr + l2) : $signed({BW_DATA{1'b0}});
        
        //assign _add_in_reg_l2_b[i] = (en_bwd_path_w_up_sync==1'b1) ? $signed(~shifted_lr_l2_data_out_w[i]+1'b1) : $signed({BW_DATA{1'b0}});
        //assign _add_in_reg_l2_b[i] = (en_bwd_path_w_up_sync==1'b1) ? $signed(~shifted_lr_l2_data_out_w[i]+1'b1) >>> 8 : $signed({BW_DATA{1'b0}});

        //assign _add_in_reg_l2_b[i] = (en_bwd_path_w_up_sync==1'b1) ? data_out_w[i] : $signed({BW_DATA{1'b0}});

        always@(*)
        begin
            if(en_bwd_path_w_up_sync==1'b1)
                if(shifted_lr_l2_data_out_w[i][BW_DATA-1]==1'b0) 
                    _add_in_reg_l2_b[i] = $signed(~shifted_lr_l2_data_out_w[i]+1'b1);
                    //_add_in_reg_l2_b[i] = $signed(~shifted_lr_l2_data_out_w[i]+1'b1) >>> 8;
                else
                    _add_in_reg_l2_b[i] = $signed(~(shifted_lr_l2_data_out_w[i]+1'b1)+1'b1);
                    //_add_in_reg_l2_b[i] = $signed($signed(~shifted_lr_l2_data_out_w[i]+1'b1) >>> 8)+1'b1;
            else
                _add_in_reg_l2_b[i] = {BW_DATA{1'b0}};
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : fix_adder_w_up_reg_l2
        fixed_adder
        #(
            .WL(`BW_WL),
            .IWL(`BW_IWL)
        )
        adder_w_up_reg_l2
        (
            .a(_add_in_reg_l2_a[i]),
            .b(_add_in_reg_l2_b[i]),
            .c(_add_out_reg_l2[i]),
            .overflow(overflow_adder_l2[i]),
            .underflow(underflow_adder_l2[i])
        );
    end
endgenerate


//assign en_addr_w_in = en_init_w_sync || en_fwd_path_sync || (en_bwd_path_w_up_sync && en_counter_w_up);
//assign en_addr_w_in = en_init_w_sync || en_fwd_path_sync || (en_bwd_path_w_up_sync && (!dirty_w_del[addr_w]||done_w_up));
assign en_addr_w_in = en_fwd_path_sync || (en_bwd_path_w_up_sync && (!dirty_w_del[addr_w]||done_w_up));

//assign en_addr_w_in = en_init_w_sync || en_fwd_path_sync || (en_bwd_path_w_up_sync && !en_w_up);


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_w_up <= {BW_COUNTER_IN{1'b0}};
    else
        if(en_w_up_latch==1'b1)
            addr_w_up <= addr_w;
end


always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || en_w_up==1'b1)
    //if(rst_n==1'b0 || done_w_up==1'b1)
    if(rst_n==1'b0)
        en_w_up <= 1'b0;
    else
        if(done_w_up==1'b1)
            en_w_up <= 1'b0;
        else if(en_bwd_path_w_up_sync==1'b1)
            en_w_up <= dirty_w_del[addr_w];
end

/*
always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || en_w_up==1'b1)
    if(rst_n==1'b0 || en_w_up_latch==1'b1)
        en_w_up_latch <= 1'b0;
    else
        if(en_bwd_path_w_up_sync==1'b1)
            en_w_up_latch <= dirty_w_del[addr_w];
end
*/

assign en_w_up_latch = en_w_up && !done_w_up;


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_data_w_up
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                data_w_up[i] <= {BW_DATA{1'b0}};
            else
                if(en_w_up_latch==1'b1)
                    //data_w_up[i] <= _add_out[i]; 
                    data_w_up[i] <= _add_out_reg_l2[i];
        end
    end
endgenerate


always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_w_up==1'b1)
    if(rst_n==1'b0)
        done_w_up <= 1'b0;
    else
        if(done_w_up==1'b1)
            done_w_up <= 1'b0;
        else if(en_w_up==1'b1)
            done_w_up <= 1'b1;
end

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
    .en_hold_max(1'b0),
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
            .BW_ADDR(BW_ADDR),
            .INIT_FILE({INIT_FILE,(i/10)+48,(i%10)+48,".mem"})
        )
        weight
        (
            // clk
            .clk(clk),
            // reset_n
            .rst_n(rst_n),
            // input
            .addr(addr_w),
            .oe(!we_w),
            .we(we_w),
            .data_in(data_in_w[i]),
            // inout
            .data_out(data_out_w[i])
            //.data(data_w[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

//assign addr_w_del = data_word_in;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        _addr_w_del <= {BW_COUNTER_IN{1'b0}};
    else
        if(_done_bwd_path==1'b1)
            _addr_w_del <= {BW_COUNTER_IN{1'b0}};
        else if(_re_data_word_in==1'b1)
            _addr_w_del <= data_word_in[BW_COUNTER_IN-1:0];
end


assign addr_w_del = (en_bwd_path_sync==1'b1)? _addr_w_del : ((en_bwd_path_w_up_sync==1'b1)? addr_w : {BW_COUNTER_IN{1'b0}});

/*
always@(*)
begin
    case({en_bwd_path_sync,en_bwd_path_w_up_sync})
        2'b10 :
        begin
            addr_w_del = _addr_w_del;
        end
        2'b01 :
        begin
            addr_w_del = addr_w;
        end
        default 
        begin   
            addr_w_del = {BW_COUNTER_IN{1'b0}};
        end
    endcase
end
*/


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        f_dirty_w_del <= 1'b0;
    else
        if(_done_bwd_path==1'b1)
            f_dirty_w_del <= 1'b0;
        else if(en_bwd_path_sync==1'b1 && _re_data_word_in==1'b1)
            f_dirty_w_del <= (dirty_w_del[data_word_in[BW_COUNTER_IN-1:0]]==1'b1)? 1'b1 : 1'b0;
end




assign we_w_del =  (f_dirty_w_del==1'b0) ? we_data_word_in : we_data_word_in_delayed_2;




always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_bwd_path_sync==1'b0)
        we_data_word_in_delayed <= 1'b0;
    else
        if(f_dirty_w_del==1'b1)
            we_data_word_in_delayed <= we_data_word_in;
end



always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_bwd_path_sync==1'b0)
        we_data_word_in_delayed_2 <= 1'b0;
    else
        if(f_dirty_w_del==1'b1)
            we_data_word_in_delayed_2 <= we_data_word_in_delayed;
        else
            we_data_word_in_delayed_2 <= 1'b0;
end



generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_data_w_del_tmp
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0 || en_bwd_path_sync==1'b0)
                data_w_del_tmp[i] <= {BW_DATA{1'b0}};
            else
                if(we_data_word_in_delayed==1'b1)
                    data_w_del_tmp[i] <= _add_out[i];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign__data_w_del
        always@(*)
        begin
            if(we_w_del==1'b0)
                _data_w_del[i] = {BW_DATA{1'bz}};
            else
            begin
                if(f_dirty_w_del==1'b0)
                    //_data_w_del[i] = grad_in[(i+1)*BW_DATA-1-:BW_DATA];
                    _data_w_del[i] = shifted_lr_grad_in[i];
                else
                    _data_w_del[i] = data_w_del_tmp[i];
            end
        end
    end
endgenerate





assign rst_n_w_del = rst_n && rst_n_batch;
//assign rst_n_w_del = rst_n;               // it doesn't matter


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_data_w_del
        assign data_in_w_del[i] = _data_w_del[i];
    end
endgenerate


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : weight_del
        ram_sync
        #(
            .BW_DATA(BW_DATA),
            .BW_ADDR(BW_ADDR)
        )
        weight_del
        (
            // clk
            .clk(clk),
            // reset_n
            .rst_n(rst_n_w_del),
            // input
            .addr(addr_w_del),
            .oe(!we_w_del),
            .we(we_w_del),
            .data_in(data_in_w_del[i]),
            // inout
            .data_out(data_out_w_del[i])
        );
    end
endgenerate


////////////////////////////////////////////////////////////
// debug
////////////////////////////////////////////////////////////

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        debug_out <= {`BW_DEBUG_EMB{1'b0}};
    else
        debug_out <= {overflow_adder,overflow_adder_l2,underflow_adder,underflow_adder_l2};
end

`ifdef DEBUG
wire [BW_DATA-1:0] debug_grad_in [0:DIM_EMB-1];

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign debug_grad_in[i] = grad_in[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

`ifdef DEBUG_ILA
 // ila
ila
ila_emb
(
    .clk(clk),

    // 1 bit
    .probe0(rst_n_w_del),
    .probe1(rst_n_addr_w_in),
    .probe2(re_n_data_word_in),
    .probe3(en_addr_w_in),
    .probe4(en_init_w_sync),
    .probe5(en_fwd_path_sync),
    .probe6(en_bwd_path_sync),
    .probe7(en_bwd_path_w_up_sync),

    // 1 bit
    .probe8(en_w_up),
    .probe9(en_w_up_latch),
    .probe10(done_w_up),
    .probe11(we_w_del),
    .probe12(we_data_word_in_delayed),
    .probe13(we_data_word_in_delayed_2),
    .probe14(_done_bwd_path),
    .probe15(_done_bwd_path_w_up),

    // 16 bit
    .probe16(count_addr_w_in),
    .probe17(addr_w),
    .probe18(dirty_w_del),
    .probe19(addr_w_up),
    .probe20(_addr_w_del),
    .probe21(addr_w_del),
    .probe22(),
    .probe23(),

    // 32 bit
    .probe24(overflow_adder),
    .probe25(overflow_adder_l2),
    .probe26(underflow_adder),
    .probe27(underflow_adder_l2),
    .probe28(),
    .probe29(),
    .probe30(),
    .probe31(),

    // 1 bit
    .probe32(_re_data_word_in),
    .probe33(f_dirty_w_del),
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
