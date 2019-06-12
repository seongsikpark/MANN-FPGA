# MANN-FPGA
Energy-Efficient Inference Accelerator for Memory-Augmented Neural Networks on an FPGA (DATE-19)
(https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=8715013)

# Description
FPGA implementation of the memory-augmented neural networks for energy efficienty inference.

This acceleartor is based on the data flow machine.

This git only contains the hardware part (verilog source code and test bench)

You can refer to the host code in another git (https://github.com/seongsikpark/Q-MANN)

Using both git (host code + verilog code), you can run the inference of MANNs on CPU, GPU or FPGA.



# Our experimental environment
We've tested the accelerator on Xilinx VCU108 board (Ultrascale) using Vivado 2016.2.

The host (computer) and FPGA board are connected through PCI-E.

We used FPGA IP core and device driver for the PCI-E by Xillybus (http://xillybus.com/)


# Implementation detail
Language: Verilog

FPGA: Xilinx Ultrascale

Board: Xilinx VCU108 (https://www.xilinx.com/products/boards-and-kits/ek-u1-vcu108-g.html)

System clk freq.: 100Mhz

Model: memory networks (https://arxiv.org/abs/1410.3916)

Testbench: bAbI dataset (https://research.fb.com/downloads/babi/)


# Citation
Please cite our paper in your publications if it helps your research work:

```
@inproceedings{park2019energy,
  title={Energy-Efficient Inference Accelerator for Memory-Augmented Neural Networks on an FPGA},
  author={Park, Seongsik and Jang, Jaehee and Kim, Seijoon and Yoon, Sungroh},
  booktitle={2019 Design, Automation \& Test in Europe Conference \& Exhibition (DATE)},
  pages={1587--1590},
  year={2019},
  organization={IEEE}
}
```
