// 
`define DESIGN_FIXED_POINT

`define BW_DATA 32
`define BW_DATA_EMB_W `BW_DATA
//`define BW_ADDR_EMB_W 6


`define BW_DIM_IN 128        // BW_DIM_IN = DIM_IN
`define BW_DIM_EMB 4        // BW_DIM_EMB = log2(DIM_EMB)

`define DIM_EMB 1 << `BW_DIM_EMB

`define BW_MEM_ADDR 6

`define NUM_MEM 1 << `BW_MEM_ADDR

`define INIT_WEIGHT_EMB {`DIM_EMB{32'h0100_0000}}
`define INIT_WEIGHT     {`DIM_EMB{32'h0100_0000}}

`define BW_WL BW_DATA
`define BW_IWL 7

// exp module
`define BW_IWL_EXP 27
`define NUM_EXP_PWLA 5          // exp(x) = max(Ax+b)
`define CONST_EXP_A_1 0
`define CONST_EXP_A_2 6
`define CONST_EXP_A_3 40
`define CONST_EXP_A_4 421
`define CONST_EXP_A_5 5340

`define CONST_EXP_B_1 0
`define CONST_EXP_B_2 -3
`define CONST_EXP_B_3 -95
`define CONST_EXP_B_4 -1958
`define CONST_EXP_B_5 -38234

`define CONST_EXP_A {0, 6, 40, 421, 5340}
`define CONST_EXP_B {0, -3, -95, -1958, -38234}


// old version 
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


//
`define BW_DATA_IN 16       // bw of data input from fifo


// type decoder
`define BW_TYPE_CODE    4

`define TYPE_CODE_SENTENCE      'b0000
`define TYPE_CODE_SENTENCE_DONE 'b0001
`define TYPE_CODE_QUESTION      'b0010
`define TYPE_CODE_QUESTION_DONE 'b0011
`define TYPE_CODE_ANSWER        'b0100
//`define TYPE_CODE_ANSWER_DONE   'b0101


//
`define BW_WORD_VEC `BW_DATA_IN - `BW_TYPE_CODE

// index of data
//`define RANGE_WORD_VEC  `BW_DATA_IN-1:`BW_TYPE_CODE
//`define RANGE_TYPE_CODE `BW_TYPE_CODE-1:0
`define RANGE_WORD_VEC  `BW_DATA_IN-`BW_TYPE_CODE-1:0
`define RANGE_TYPE_CODE `BW_DATA_IN-1-:`BW_TYPE_CODE
