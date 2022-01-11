# Rapid Prototyping of Hardware Accelerators on Xilinx FPGAs (WIP)

This framework provides a quick automation flow to develop and prototype hardware accelerators on Xilinx FPGAs. Currently, the framework has support for AXI-Stream IP with Single Master and Single Slave Template. The user can code the Hardware Accelerator in TL-Verilog/Verilog/System Verilog and use this flow to automatically package into an IP and create a Zynq based block design.

## Requirements

This relies on Sandpiper - SaaS, a TL-Verilog interpreter as a microservice. Install the python package

```pip install sandpiper-saas```

## Getting Started 

- Clone the repo 

```git clone https://github.com/shariethernet/RPHAX.git```

- Run the python script

```python rphax.py Filename [-b]```

This will generate the folder `ip` where your design will be packaged as an AXI Stream IP with 1 master and 1 slave interface. The `myproj` folder will contain your block design. If you use `-b` flag then the bitstream will also be generated. However, for new designs, it is preferred to geenrate till blockdesign and proceed with the GUI for generating bitstream to catch any errors. 

### Adding AXI-S Clock Bus parameters 

- Open the VIVADO Project and from sources click on `component.xml` then right click `axi_clk` > `edit interface` > Parameters and then set the `ASSOCIATED_BUSIF`'s value to m_axis:s_axis
- Similarly set `FREQ_HZ` to `100000000` (100Mhz) 
- Repackage the IP
- Open the block design project from `myproj` and Upgrade IP
- Generate Bitstream


## Note
- This project is Work In Progress
- Currently there is support for single master - single slave AXI Streaming interfaces 
- The hardware accelerator must have the ports named as given in the template
- In `TL-Verilog` map the pipesignals to the ports 
