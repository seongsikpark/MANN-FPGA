// 
`define DEBUG
//`define DEBUG_ILA       // Integrated Logic Analyzer

`define INFER_ONLY_MODE

`define MAX_NAME_INIT_FILE 100
`define EN_INIT_FILE true

`define DESIGN_FIXED_POINT

`define Q_FORM_Q_7_24
//`define Q_FORM_Q_11_20

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

`ifdef Q_FORM_Q_7_24
    `define BW_IWL 7
`endif

`ifdef Q_FORM_Q_11_20
    `define BW_IWL 11
`endif

`define MAX_WORD_IN_SEN 32
`define BW_MAX_WORD_IN_SEN 5

// exp module
//`define EXP_PWLA_VER_1
`define EXP_PWLA_VER_2

// exp plwa ver 1
`ifdef EXP_PWLA_VER_1           // expression range : -10 ~ 10
`define BW_IWL_EXP 27
`define NUM_EXP_PWLA 5          // exp(x) = max(Ax+b)

`define CONST_EXP_A {0, 6, 40, 421, 5340} << (`BW_WL-`BW_IWL_EXP-1)
`define CONST_EXP_B {0, -3, -95, -1958, -38234} << (`BW_WL-`BW_IWL_EXP-1)
`endif

// exp plwa ver 2
`ifdef EXP_PWLA_VER_2           // expression range : -3 ~ 0
//`define BW_IWL_EXP 17
//`define BW_IWL_EXP `BW_IWL

`ifdef Q_FORM_Q_7_24
    //`define BW_IWL_EXP 7
    `define BW_IWL_EXP 12
    //`define NUM_EXP_PWLA 4          // exp(x) = max(Ax+b)
    //`define NUM_EXP_PWLA_4
    //`define NUM_EXP_PWLA 8          // exp(x) = max(Ax+b)
    //`define NUM_EXP_PWLA_8
    `define NUM_EXP_PWLA 16          // exp(x) = max(Ax+b)
    `define NUM_EXP_PWLA_16
`endif

`ifdef Q_FORM_Q_11_20
    //`define BW_IWL_EXP 11
    `define BW_IWL_EXP 16
    `define NUM_EXP_PWLA 16          // exp(x) = max(Ax+b)
    `define NUM_EXP_PWLA_16
`endif

//`define CONST_EXP_A {0, 0.070265*2^(`BW_WL-`BW_IWL_EXP-1), 0.141642*2^(`BW_WL-`BW_IWL_EXP-1), 0.597226*2^(`BW_WL-`BW_IWL_EXP-1)} 
//`define CONST_EXP_B {0, 0.10888*2^(`BW_WL-`BW_IWL_EXP-1), 0.43981*2^(`BW_WL-`BW_IWL_EXP-1), 0.933989*2^(`BW_WL-`BW_IWL_EXP-1)}


/*
// -3 ~ 0
`define CONST_EXP_A {0, \
                    $rtoi(0.070265*(2**(`BW_WL-`BW_IWL_EXP-1))), \
                    $rtoi(0.141642*(2**(`BW_WL-`BW_IWL_EXP-1))), \
                    $rtoi(0.597226*(2**(`BW_WL-`BW_IWL_EXP-1)))} 

`define CONST_EXP_B {0, \
                    $rtoi(0.10888*(2**(`BW_WL-`BW_IWL_EXP-1))), \
                    $rtoi(0.43981*(2**(`BW_WL-`BW_IWL_EXP-1))), \
                    $rtoi(0.933989*(2**(`BW_WL-`BW_IWL_EXP-1)))}
*/



// -3 ~ 0 for BW_IWL_EXP 17, one step
/*
`define CONST_EXP_A { \
                     32'h0000_0000, \
                     32'h0000_0579, \
                     32'h0000_0EE2, \
                     32'h0000_2874  \
                    }

`define CONST_EXP_B { \
                     32'h0000_0000, \
                     32'h0000_139C, \
                     32'h0000_266D, \
                     32'h0000_4000  \
                    }
*/

`ifdef Q_FORM_Q_7_24
    // -3 ~ 0 for BW_IWL_EXP 12
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'hFFFF_FB17, \
                         32'hFFF1_2370, \
                         32'hFFF4_CDF4  \
                        }
    
    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'hFFFF_E526, \
                         32'h0003_874F, \
                         32'h0007_7C6F  \
                        }
    */
    
    // -3 ~ 0 for BW_IWL_EXP 12, one step
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_AF33, \
                         32'h0001_DC40, \
                         32'h0005_0E95  \
                        }
    
    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0002_7392, \
                         32'h0004_CDAA, \
                         32'h0008_0000  \
                        }
    */
    
    // -3 ~ 0 for BW_IWL_EXP 7, lower bound
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0015_0385, \
                         32'h0039_1F0E, \
                         32'h009B_4597  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0049_8C54, \
                         32'h008E_CDA5, \
                         32'h00E8_E863  \
                        }
    */
    
    // -3 ~ 0 for BW_IWL_EXP 12, lower bound
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_A81C, \
                         32'h0001_C8F8, \
                         32'h0004_DA2C  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0002_4C62, \
                         32'h0004_766D, \
                         32'h0007_4743  \
                        }
    */
    
    // -7 ` 0 for BW_IWL_EXP 12, lower bound
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_0314, \
                         32'h0000_085E, \
                         B32'h0000_16c0, \
                         32'h0000_3DD8, \
                         32'h0000_A81C, \
                         32'h0001_C8F8, \
                         32'h0004_DA2C  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0000_1717, \
                         32'h0000_3667, \
                         32'h0000_7D21, \
                         32'h0001_164C, \
                         32'h0002_4C62, \
                         32'h0004_766D, \
                         32'h0007_4743  \
                        }
    */
    
    /*
    // new way for BW_IWL_EXP 12, lower bound
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_C996, \
                         32'h0001_1FFC, \
                         32'h0001_9B68, \
                         32'h0002_4BB9, \
                         32'h0003_479A, \
                         32'h0004_AF6F, \
                         32'h0006_B17A  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0002_9CF3, \
                         32'h0003_54ED, \
                         32'h0004_2FBA, \
                         32'h0005_296A, \
                         32'h0006_3445, \
                         32'h0007_3216, \
                         32'h0007_E30E  \
                        }
    */
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0001_9B68, \
                         32'h0003_479A, \
                         32'h0006_B17A  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0004_2FBA, \
                         32'h0006_3445, \
                         32'h0007_E30E  \
                        }
    */
    // new way for BW_IWL_EXP 12, upper bound
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_CAA8, \
                         32'h0001_2183, \
                         32'h0001_9D97, \
                         32'h0002_4ED8, \
                         32'h0003_4C10, \
                         32'h0004_B5CD, \
                         32'h0006_BA93  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0002_A2A5, \
                         32'h0003_5C84, \
                         32'h0004_39CB, \
                         32'h0005_36AE, \
                         32'h0006_45A1, \
                         32'h0007_47AE, \
                         32'h0008_0000  \
                        }
    */

    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0001_9D97, \
                         32'h0003_4C10, \
                         32'h0006_BA93  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0004_39CB, \
                         32'h0006_45A1, \
                         32'h0008_0000  \
                        }
    */

    /*
    // ~ 1, new way 2 for BW_IWL_EXP 12, lower bound
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_0012, \
                         32'h0000_004F, \
                         32'h0000_0130, \
                         32'h0000_0428, \
                         32'h0000_0D20, \
                         32'h0000_2582, \
                         32'h0000_60FD, \
                         32'h0000_E2EC, \
                         32'h0001_E066, \
                         32'h0003_9839, \
                         32'h0006_3AFB, \
                         32'h0009_C56E, \
                         32'h000D_DDB3, \
                         32'h0011_CDE8, \
                         32'h0014_AF88  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0000_00D0, \
                         32'h0000_0306, \
                         32'h0000_0A0F, \
                         32'h0000_1DEC, \
                         32'h0000_4F6A, \
                         32'h0000_BB8D, \
                         32'h0001_88D0, \
                         32'h0002_D628, \
                         32'h0004_98FA, \
                         32'h0006_7868, \
                         32'h0007_C9BA, \
                         32'h0007_D125, \
                         32'h0006_3D5D, \
                         32'h0003_8F94, \
                         32'h0001_08C6  \
                        }
    */

    /*
    // new way 2 for BW_IWL_EXP 12, lower bound
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_0006, \
                         32'h0000_001D, \
                         32'h0000_0070, \
                         32'h0000_0187, \
                         32'h0000_04D4, \
                         32'h0000_0DCC, \
                         32'h0000_23AE, \
                         32'h0000_537B, \
                         32'h0000_B0BA, \
                         32'h0001_5288, \
                         32'h0002_4AC3, \
                         32'h0003_9839, \
                         32'h0005_19DC, \
                         32'h0006_8CC2, \
                         32'h0007_9C1E  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0000_0053, \
                         32'h0000_0139, \
                         32'h0000_0423, \
                         32'h0000_0C89, \
                         32'h0000_220B, \
                         32'h0000_52CB, \
                         32'h0000_B430, \
                         32'h0001_5E9E, \
                         32'h0002_61B7, \
                         32'h0003_B3E3, \
                         32'h0005_2836, \
                         32'h0006_7868, \
                         32'h0007_6580, \
                         32'h0007_DC1C, \
                         32'h0007_FD86\
                        }
    */

    /*
    // new way 2 for BW_IWL_EXP 12, lower bound
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_B0BA, \
                         32'h0001_5288, \
                         32'h0002_4AC3, \
                         32'h0003_9839, \
                         32'h0005_19DC, \
                         32'h0006_8CC2, \
                         32'h0007_9C1E  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0002_61B7, \
                         32'h0003_B3E3, \
                         32'h0005_2836, \
                         32'h0006_7868, \
                         32'h0007_6580, \
                         32'h0007_DC1C, \
                         32'h0007_FD86  \
                        }
    */

    // new way 2 for BW_IWL_EXP 12, lower bound
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0002_4AC3, \
                         32'h0005_19DC, \
                         32'h0007_9C1E  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0005_2836, \
                         32'h0007_6580, \
                         32'h0007_FD86  \
                        }
    */

    // new way 2 for BW_IWL_EXP 12, upper bound
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_0007, \
                         32'h0000_001F, \
                         32'h0000_0078, \
                         32'h0000_019F, \
                         32'h0000_0513, \
                         32'h0000_0E61, \
                         32'h0000_24E5, \
                         32'h0000_55B9, \
                         32'h0000_B45C, \
                         32'h0001_57A2, \
                         32'h0002_50E4, \
                         32'h0003_9E5F, \
                         32'h0005_1EC3, \
                         32'h0006_8F8E, \
                         32'h0007_9CED  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0000_005C, \
                         32'h0000_0159, \
                         32'h0000_0480, \
                         32'h0000_0D7E, \
                         32'h0000_2449, \
                         32'h0000_5777, \
                         32'h0000_BCCA, \
                         32'h0001_6C91, \
                         32'h0002_758B, \
                         32'h0003_CC6B, \
                         32'h0005_424F, \
                         32'h0006_8FCA, \
                         32'h0007_766C, \
                         32'h0007_E510, \
                         32'h0008_0000  \
                        }
    */

    // new way 2 for BW_IWL_EXP 12, upper bound
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_B45C, \
                         32'h0001_57A2, \
                         32'h0002_50E4, \
                         32'h0003_9E5F, \
                         32'h0005_1EC3, \
                         32'h0006_8F8E, \
                         32'h0007_9CED  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0002_758B, \
                         32'h0003_CC6B, \
                         32'h0005_424F, \
                         32'h0006_8FCA, \
                         32'h0007_766C, \
                         32'h0007_E510, \
                         32'h0008_0000  \
                        }
    */

    // new way 2 for BW_IWL_EXP 12, upper bound
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0002_50E4, \
                         32'h0005_1EC3, \
                         32'h0007_9CED  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0005_424F, \
                         32'h0007_766C, \
                         32'h0008_0000  \
                        }
    */

    // new way 3 for BW_IWL_EXP 12, lower bound
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

`endif

`ifdef Q_FORM_Q_11_20
    // -3 ~ 0 for BW_IWL_EXP 16, lower bound
    /*
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_0A81, \
                         32'h0000_1C8F, \
                         32'h0000_4DA2  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0000_24C6, \
                         32'h0000_4766, \
                         32'h0000_7474  \
                        }
    */

    /*
    // new way 2 for BW_IWL_EXP 16, lower bound
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_0000, \
                         32'h0000_0001, \
                         32'h0000_0007, \
                         32'h0000_0018, \
                         32'h0000_004D, \
                         32'h0000_00DC, \
                         32'h0000_023A, \
                         32'h0000_0537, \
                         32'h0000_0B0B, \
                         32'h0000_1528, \
                         32'h0000_24AC, \
                         32'h0000_3983, \
                         32'h0000_519D, \
                         32'h0000_68CC, \
                         32'h0000_79C1  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0000_0005, \
                         32'h0000_0013, \
                         32'h0000_0042, \
                         32'h0000_00C8, \
                         32'h0000_0220, \
                         32'h0000_052C, \
                         32'h0000_0B43, \
                         32'h0000_15E9, \
                         32'h0000_261B, \
                         32'h0000_3B3E, \
                         32'h0000_5283, \
                         32'h0000_6786, \
                         32'h0000_7658, \
                         32'h0000_7DC1, \
                         32'h0000_7FD8  \
                        }
    */

    /*
    // new way 2 for BW_IWL_EXP 11, lower bound
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_000D, \
                         32'h0000_003A, \
                         32'h0000_00E0, \
                         32'h0000_030E, \
                         32'h0000_09A8, \
                         32'h0000_1B99, \
                         32'h0000_475C, \
                         32'h0000_A6F6, \
                         32'h0001_6175, \
                         32'h0002_A510, \
                         32'h0004_9586, \
                         32'h0007_3073, \
                         32'h000A_33B9, \
                         32'h000D_1985, \
                         32'h000F_383C  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0000_00A7, \
                         32'h0000_0273, \
                         32'h0000_0847, \
                         32'h0000_1913, \
                         32'h0000_4416, \
                         32'h0000_A597, \
                         32'h0001_6860, \
                         32'h0002_BD3D, \
                         32'h0004_C36E, \
                         32'h0007_67C7, \
                         32'h000A_506D, \
                         32'h000C_F0D0, \
                         32'h000E_CB00, \
                         32'h000F_B839, \
                         32'h000F_FB0C  \
                        }
    */


    // new way 3 for BW_IWL_EXP 16, lower bound
    `define CONST_EXP_A { \
                         32'h0000_0000, \
                         32'h0000_298E, \
                         32'h0000_300A, \
                         32'h0000_36FB, \
                         32'h0000_3E4D, \
                         32'h0000_45E5, \
                         32'h0000_4DA2, \
                         32'h0000_555F, \
                         32'h0000_5CF2, \
                         32'h0000_642F, \
                         32'h0000_6AEA, \
                         32'h0000_70F5, \
                         32'h0000_7628, \
                         32'h0000_7A5E, \
                         32'h0000_7D77, \
                         32'h0000_7F5C  \
                        }

    `define CONST_EXP_B { \
                         32'h0000_0000, \
                         32'h0000_584E, \
                         32'h0000_5F1E, \
                         32'h0000_6571, \
                         32'h0000_6B29, \
                         32'h0000_702F, \
                         32'h0000_7474, \
                         32'h0000_77F2, \
                         32'h0000_7AB0, \
                         32'h0000_7CBB, \
                         32'h0000_7E28, \
                         32'h0000_7F14, \
                         32'h0000_7F9C, \
                         32'h0000_7FDF, \
                         32'h0000_7FF9, \
                         32'h0000_7FFF  \
                        }
`endif




// -3 ~ 1.5
/*
`define CONST_EXP_A {0, \
                    $rtoi(-0.00504*(2**(`BW_WL-`BW_IWL_EXP-1))), \
                    $rtoi(0.302667*(2**(`BW_WL-`BW_IWL_EXP-1))), \
                    $rtoi(2.371442*(2**(`BW_WL-`BW_IWL_EXP-1)))} 

`define CONST_EXP_B {0, \
                    $rtoi(-0.15704*(2**(`BW_WL-`BW_IWL_EXP-1))), \
                    $rtoi(0.78275*(2**(`BW_WL-`BW_IWL_EXP-1))), \
                    $rtoi(0.506581*(2**(`BW_WL-`BW_IWL_EXP-1)))}
*/

// -3 ~ 1.5 for BW_IWL_EXP 17
/*
`define CONST_EXP_A { \
                     32'h0000_0000, \
                     32'hFFFF_FFAE, \
                     32'h0000_135E, \
                     32'h0000_97C5  \
                    }

`define CONST_EXP_B { \
                     32'h0000_0000, \
                     32'hFFFF_F5F4, \
                     32'h0000_3218, \
                     32'h0000_206B  \
                    }
*/

// -3 ~ 1.5 for BW_IWL_EXP 12
/*
`define CONST_EXP_A { \
                     32'h0000_0000, \
                     32'hFFFF_F5B0, \
                     32'h0002_6BDC, \
                     32'h0012_F8B6  \
                    }

`define CONST_EXP_B { \
                     32'h0000_0000, \
                     32'hFFFE_BE62, \
                     32'h0006_4312, \
                     32'h0004_0D7A \
                    }
*/

// -3 ~ 1.5 for BW_IWL_EXP 7
/*
`define CONST_EXP_A { \
                     32'h0000_0000, \
                     32'hFFFE_B5E6, \
                     32'h004D_7B95, \
                     32'h025F_16D2  \
                    }

`define CONST_EXP_B { \
                     32'h0000_0000, \
                     32'hFFD7_CC2A, \
                     32'h00C8_624D, \
                     32'h0081_AF4A  \
                    }
*/

`endif


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


// SIM env
//`define SIM_FORCE_W

// hyper parameters
`define LEARNING_RATE_SHIFT_BITS    2      // learning rate 
`define REG_L2_NORM_SHIFT_BITS      9      // regularization l2 norm
`define INIT_WEIGHT_EMB {`DIM_EMB{32'h0020_0000}} // 0.125 @ Q7.24 // 0.25
`define INIT_WEIGHT_W   {`DIM_EMB{32'h0020_0000}} // 0.125 @ Q7.24 // 0.25


//`define BW_BATCH_SIZE   6
//`define BATCH_SIZE      64
//`define BW_BATCH_SIZE   5
//`define BATCH_SIZE      32
//`define BW_BATCH_SIZE   4
//`define BATCH_SIZE      16
//`define BW_BATCH_SIZE   3
//`define BATCH_SIZE      8
`define BW_BATCH_SIZE   2
`define BATCH_SIZE      4

// only sim.
`define NUM_ITR 2

`define BW_HOP      2
`define NUM_HOP     3 

//`define BW_HOP      0
//`define NUM_HOP     1 

// init w file name
//`define FILE_NAME_INIT_W(i) {"../data/w_",(i/10)+48,(i%10)+48,".mem"} 

`ifdef Q_FORM_Q_7_24
    `define FILE_NAME_INIT_W_FC_W_SM(i) {"w_fc_w_sm_init_q7_24_",(i/10)+48,(i%10)+48,".mem"} 
    `define FILE_NAME_INIT_W_FC(i) {"w_fc_init_q7_24_",(i/10)+48,(i%10)+48,".mem"} 
    `define FILE_NAME_FASTER_INFER_TH(i) {"faster_infer_th_q7_24_",(i/10)+48,(i%10)+48,".mem"} 
`endif

`ifdef Q_FORM_Q_11_20
    `define FILE_NAME_INIT_W_FC_W_SM(i) {"w_fc_w_sm_init_q11_20_",(i/10)+48,(i%10)+48,".mem"} 
    `define FILE_NAME_INIT_W_FC(i) {"w_fc_init_q11_20_",(i/10)+48,(i%10)+48,".mem"} 
    `define FILE_NAME_FASTER_INFER_TH(i) {"faster_infer_th_q11_20_",(i/10)+48,(i%10)+48,".mem"} 
`endif

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


// inference w/o softmax
`define WO_SOFTMAX_MODE


`ifdef WO_SOFTMAX_MODE
// faster inference
// should define WO_SOFTMAX_MODE to use the faster infernce mode
`define FASTER_INFER_MODE
`endif


// faster inference - address translation
`ifdef WO_SOFTMAX_MODE
`ifdef FASTER_INFER_MODE
`define FASTER_INFER_ADDR_TR_MODE
`endif
`endif





`define NUM_TASK 20
`define BW_ADDR_TASK 5

// debug
`define BW_DEBUG_EMB        4
`define BW_DEBUG_ATT_MEM    4
`define BW_DEBUG_W_MEM      4
`define BW_DEBUG_FC         4
`define BW_DEBUG_FC_W_SM    4

