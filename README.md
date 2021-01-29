# MANN-FPGA
Energy-Efficient Inference Accelerator for Memory-Augmented Neural Networks on an FPGA (DATE-19)
(https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=8715013)

Memory-Augmented Neural Networks on FPGA for Real-Time and Energy-Efficient Question Answering (TVLSI-21)
(https://ieeexplore.ieee.org/abstract/document/9269453)


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

<img width="512" alt="measurement" src="https://user-images.githubusercontent.com/13957658/59736966-c33fd180-9296-11e9-95b4-288d35160f24.png">


# Implementation detail
Language: Verilog

FPGA: Xilinx Ultrascale

Board: Xilinx VCU108 (https://www.xilinx.com/products/boards-and-kits/ek-u1-vcu108-g.html)

HOST-FPGA interface: PCI-E (Xillybus, http://xillybus.com/)

System clk freq.: 100Mhz

Model: memory networks (https://arxiv.org/abs/1410.3916)

Testbench: bAbI dataset (https://research.fb.com/downloads/babi/)

# Block diagram
![hw_archi](https://user-images.githubusercontent.com/13957658/59738422-27b15f80-929c-11e9-97ac-52488adb8dd0.png)

# Schematic
<img width="1632" alt="schematic" src="https://user-images.githubusercontent.com/13957658/59738589-bfaf4900-929c-11e9-9a1c-06014bcb74dd.PNG">

# Placement and Routing
<img width="249" alt="pnr" src="https://user-images.githubusercontent.com/13957658/59738690-19b00e80-929d-11e9-99b5-f3362be6f777.PNG">


# Resource Utilization (post implementation)
<img width="258" alt="util_post_imp_1" src="https://user-images.githubusercontent.com/13957658/59737263-de5f1100-9297-11e9-8772-eeac229f0661.PNG">


# Power consumption
<img width="248" alt="power" src="https://user-images.githubusercontent.com/13957658/59737258-d7d09980-9297-11e9-84f0-774709d7d3f3.PNG">

# Waveform example
<img width="826" alt="waveform" src="https://user-images.githubusercontent.com/13957658/59741249-6bf52d80-92a5-11e9-9e01-cf178c9543f2.PNG">

# Experimental Results on the bAbI dataset
<img width="512" alt="results" src="https://user-images.githubusercontent.com/13957658/59738860-b4105200-929d-11e9-9f58-93a6bb2cf78a.PNG">


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

```
@article{park2020memory,
  title={Memory-Augmented Neural Networks on FPGA for Real-Time and Energy-Efficient Question Answering},
  author={Park, Seongsik and Jang, Jaehee and Kim, Seijoon and Na, Byunggook and Yoon, Sungroh},
  journal={IEEE Transactions on Very Large Scale Integration (VLSI) Systems},
  volume={29},
  number={1},
  pages={162--175},
  year={2020},
  publisher={IEEE}
}
```
