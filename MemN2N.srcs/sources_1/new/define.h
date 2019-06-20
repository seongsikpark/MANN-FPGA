// 
`define DEBUG
//`define DEBUG_ILA       // Integrated Logic Analyzer

`define INFER_ONLY_MODE

`define MAX_NAME_INIT_FILE 100
`define EN_INIT_FILE true

`define DESIGN_FIXED_POINT

`define BW_DATA 32
`define BW_DATA_EMB_W `BW_DATA
//`define BW_ADDR_EMB_W 6

// bAbI task #1 - should modify tree adder code
//`define BW_DIM_IN 128        // BW_DIM_IN = DIM_IN
//`define BW_DIM_EMB 4        // BW_DIM_EMB = log2(DIM_EMB)

// bAbI task joint
`define BW_DIM_IN 256       // BW_DIM_IN = DIM_IN
`define BW_DIM_EMB 5        // BW_DIM_EMB = log2(DIM_EMB)



`define DIM_EMB 1 << `BW_DIM_EMB

`define BW_MEM_ADDR 6

`define NUM_MEM 1 << `BW_MEM_ADDR


`define BW_WL `BW_DATA

`define BW_IWL 7


`define MAX_WORD_IN_SEN 32
`define BW_MAX_WORD_IN_SEN 5

`define BW_IWL_EXP 12
`define NUM_EXP_PWLA 16          // exp(x) = max(Ax+b)


`define CONST_EXP_A { \
					 32'h0000_0000, \
					 32'h0002_98E3, \
					 32'h0003_00A3, \
					 32'h0003_6FBB, \
					 32'h0003_E4DE, \
					 32'h0004_5E5C, \
					 32'h0004_DA2C, \
					 32'h0005_55F7, \
					 32'h0005_CF27, \
					 32'h0006_42FA, \
					 32'h0006_AEA2, \
					 32'h0007_0F5A, \
					 32'h0007_628A, \
					 32'h0007_A5E2, \
					 32'h0007_D772, \
					 32'h0007_F5C9  \
					}

`define CONST_EXP_B { \
					 32'h0000_0000, \
					 32'h0005_84E3, \
					 32'h0005_F1E6, \
					 32'h0006_571B, \
					 32'h0006_B29D, \
					 32'h0007_02F7, \
					 32'h0007_4743, \
					 32'h0007_7F2F, \
					 32'h0007_AB0A, \
					 32'h0007_CBB5, \
					 32'h0007_E28C, \
					 32'h0007_F145, \
					 32'h0007_F9C9, \
					 32'h0007_FDFC, \
					 32'h0007_FF98, \
					 32'h0007_FFF9  \
					}


`define NUM_PHASE 10

`define PHASE_IDLE                 'b00_0000_0001
`define PHASE_INIT                 'b00_0000_0010
`define PHASE_EMB_Q                'b00_0000_0100
`define PHASE_DOT_PROD_MEM_EMB_Q   'b00_0000_1000
`define PHASE_ATTENTION            'b00_0001_0000
`define PHASE_WEIGHTED_SUM         'b00_0010_0000
`define PHASE_SUM_U_Q              'b00_0100_0000
`define PHASE_FULLY_CONNECTED      'b00_1000_0000
`define PHASE_SOFT_MAX             'b01_0000_0000
`define PHASE_END_FWD              'b10_0000_0000
//
//

`define NUM_FWD_STATE   8
`define STATE_FWD_IDLE              'b0000_0001
`define STATE_FWD_INIT              'b0000_0010
`define STATE_FWD_ATTENTION         'b0000_0100
`define STATE_FWD_WEIGHTED_SUM      'b0000_1000
`define STATE_FWD_SUM_U_Q           'b0001_0000
`define STATE_FWD_FULLY_CONNECTED   'b0010_0000
`define STATE_FWD_SOFT_MAX          'b0100_0000
`define STATE_FWD_END               'b1000_0000


`define NUM_BWD_STATE   9
`define STATE_BWD_IDLE              'b0_0000_0001
`define STATE_BWD_INIT              'b0_0000_0010
`define STATE_BWD_COST              'b0_0000_0100
`define STATE_BWD_FC_W_SM           'b0_0000_1000
`define STATE_BWD_WEIGHTED_SUM      'b0_0001_0000
`define STATE_BWD_ATTENTION         'b0_0010_0000
`define STATE_BWD_EMB               'b0_0100_0000
`define STATE_BWD_W_UP              'b0_1000_0000
`define STATE_BWD_END_BWD           'b1_0000_0000


//
`define BW_DATA_IN 16       // bw of data input from fifo


// type decoder

`define BW_TRAIN        1
`define BW_TYPE         3
`define BW_TYPE_CODE    (`BW_TRAIN + `BW_TYPE)

`define TYPE_CODE_TRAIN         1'b1
`define TYPE_CODE_TEST          1'b0
`define TYPE_CODE_SENTENCE      'b000
`define TYPE_CODE_SENTENCE_DONE 'b001
`define TYPE_CODE_QUESTION      'b010
`define TYPE_CODE_QUESTION_DONE 'b011
`define TYPE_CODE_ANSWER        'b100
//`define TYPE_CODE_ANSWER_DONE   'b101

`define TYPE_CODE_SET_MODE_ON       4'b0101
`define TYPE_CODE_SET_MODE_ON_1     {{`TYPE_CODE_SET_MODE_ON},{12'h4B2}}
`define TYPE_CODE_SET_MODE_ON_2     {{`TYPE_CODE_SET_MODE_ON},{12'h1F9}}

`define TYPE_CODE_SET_MODE_OFF       4'b1101
`define TYPE_CODE_SET_MODE_OFF_1     {{`TYPE_CODE_SET_MODE_OFF},{12'h9A3}}
`define TYPE_CODE_SET_MODE_OFF_2     {{`TYPE_CODE_SET_MODE_OFF},{12'h0AC}}

`define TYPE_CODE_SET_MODE_W_LOAD_TO_FPGA       {{`TYPE_CODE_SET_MODE_ON},{12'h555}}
`define TYPE_CODE_SET_MODE_W_LOAD_FROM_FPGA     {{`TYPE_CODE_SET_MODE_OFF},{12'hDDD}}

`define TYPE_CODE_SET_LR_L2     4'b1111
//`define TYPE_CODE_RST_MEMN2N    4'b1110
`define TYPE_CODE_RST_MEMN2N    4'b0110
`define TYPE_CODE_DIN_EXP_SHIFT_BIT     4'b1110
`define TYPE_CODE_DUMMY                 4'b0111

//
`define BW_WORD_VEC `BW_DATA_IN - `BW_TYPE_CODE

// index of data
`define RANGE_WORD_VEC  `BW_DATA_IN-`BW_TYPE_CODE-1:0
`define RANGE_TYPE_CODE `BW_DATA_IN-1-:`BW_TYPE_CODE


// hyper parameters
`define LEARNING_RATE_SHIFT_BITS    2      // learning rate 
`define REG_L2_NORM_SHIFT_BITS      9      // regularization l2 norm
`define INIT_WEIGHT_EMB {`DIM_EMB{32'h0020_0000}} // 0.125 @ Q7.24 // 0.25
`define INIT_WEIGHT_W   {`DIM_EMB{32'h0020_0000}} // 0.125 @ Q7.24 // 0.25


`define BW_BATCH_SIZE   2
`define BATCH_SIZE      4

// only sim.
`define NUM_ITR 2

`define BW_HOP      2
`define NUM_HOP     3 

`define FILE_NAME_INIT_W_FC_W_SM(i) {"w_fc_w_sm_init_q7_24_",(i/10)+48,(i%10)+48,".mem"} 
`define FILE_NAME_INIT_W_FC(i) {"w_fc_init_q7_24_",(i/10)+48,(i%10)+48,".mem"} 
`define FILE_NAME_FASTER_INFER_TH(i) {"faster_infer_th_q7_24_",(i/10)+48,(i%10)+48,".mem"} 

`define FILE_NAME_FASTER_INFER_TH_ADDR_TR(i) {"faster_infer_th_addr_tr_",(i/10)+48,(i%10)+48,".mem"} 

// global controller
`define CMD_INIT    8'b0000_0001
`define CMD_LR_L2   8'b0000_0010
`define CMD_RST_MEMN2N 8'b1111_1111


// w_init_controller
`define NUM_W_MODULE        5       // number of module have weight - emb_a/_c/_q,fc,fc_w_sm
`define IDX_W_INIT_EMB_A    0
`define IDX_W_INIT_EMB_C    1
`define IDX_W_INIT_EMB_Q    2
`define IDX_W_INIT_FC       3
`define IDX_W_INIT_FC_W_SM  4

// w_init
`define BW_ADDR_W_INIT_SEL_MODULE   4
`define BW_ADDR_W_INIT      12
`define RANGE_ADDR_W_INIT_SEL_MODULE    `BW_DATA_IN-1-:`BW_ADDR_W_INIT_SEL_MODULE
`define RANGE_ADDR_W_INIT               `BW_DATA_IN-`BW_ADDR_W_INIT_SEL_MODULE-1:0
`define ADDR_W_INIT_EMB_A       4'b0000
`define ADDR_W_INIT_EMB_C       4'b0001
`define ADDR_W_INIT_EMB_Q       4'b0010
`define ADDR_W_INIT_FC          4'b0011
`define ADDR_W_INIT_FC_W_SM     4'b0100


`define NUM_TASK 20
`define BW_ADDR_TASK 5

// debug
`define BW_DEBUG_EMB        4
`define BW_DEBUG_ATT_MEM    4
`define BW_DEBUG_W_MEM      4
`define BW_DEBUG_FC         4
`define BW_DEBUG_FC_W_SM    4

