# Rapid Prototyping of Hardware Accelerators on Xilinx FPGAs (WIP)

This framework provides a quick automation flow to develop and prototype hardware accelerators on Xilinx FPGAs. Currently, the framework has support for AXI-Stream IP with Single Master and Single Slave Template. The user can code the Hardware Accelerator in TL-Verilog/Verilog/System Verilog and use this flow to automatically package into an IP and create a Zynq based block design.

## Getting Started with the default design

- Clone the repo 

```git clone https://github.com/shariethernet/RPHAX.git```

- Run the python script

```python run_tlv.py```

This will generate the folder `ip` where your design will be packaged as an AXI Stream IP

- Open the VIVADO Project and from sources click on `component.xml` then right click `axi_clk` > `edit interface` > Parameters and then set the `ASSOCIATED_BUSIF`'s value to m_axis:s_axis
- Similarly set `FREQ_HZ` to `100000000` (100Mhz) 
- Repackage the IP
- Open the block design project from `myproj` and Upgrade IP
- Generate Bitstream


## Note
- This project is Work In Progress
- Complete and detailed documentation will be updated in the first release