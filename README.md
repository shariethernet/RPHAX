# RPHAX - Rapid Prototyping of Hardware Accelerators on Xilinx FPGAs 

This framework (WiP) provides a quick automation flow to develop and prototype hardware accelerators on Xilinx FPGAs. Currently, the framework has support for AXI-Stream IP with Single Master and Single Slave Template. The user can develop the Hardware Accelerator in TL-Verilog/Verilog/System Verilog and use this flow to automatically package into an IP, create a Zynq based block design, and generate the bitstream.

## Requirements

If you are using [TL-Verilog](https://www.redwoodeda.com/tl-verilog) then [Sandpiper - SaaS](https://gitlab.com/rweda/sandpiper-saas), a TL-Verilog interpreter as a microservice on cloud is required. Install the python package

```pip install sandpiper-saas```

## Getting Started 

- Clone the repo 

```git clone https://github.com/shariethernet/RPHAX.git```

- Run the python script

```python rphax.py Filename [-b]```

This will generate the folder `ip` where your design will be packaged as an AXI Stream IP with 1 master and 1 slave interface. The `myproj` folder will contain your block design. If you use `-b` flag then the bitstream will also be generated. However, for new designs, it is preferred to geenrate till blockdesign and proceed with the GUI for generating bitstream to catch any errors. 


### Adding AXI-S Clock Bus parameters 

*A suitable work around will be built into the script to avoid going back to GUI. Current approach would be to parse `component.xml` and add the interface parameters at the right spot. However, a TCL Level command would be simpler.*

- Open the VIVADO Project and from sources click on `component.xml` then right click `axi_clk` > `edit interface` > Parameters and then set the `ASSOCIATED_BUSIF`'s value to m_axis:s_axis
- Similarly set `FREQ_HZ` to `100000000` (100Mhz) 
- Repackage the IP
- Open the block design project from `myproj` and Upgrade IP
- Generate Bitstream

## TO-DO

- Add `TLV` templates for various interfaces (AXI4, AXI4 Lite, AXI Stream, RoCC etc.,)
- Provide `TLV` examples with the above interfaces and Pynq Overlays 
- Re-structure RPHAX, as a python library to enable creation of custom interfaces

## Note

- This project is Work In Progress
- Currently there is support for single master - single slave AXI Streaming interfaces 
- The hardware accelerator must have the ports named as given in the template
- In `TL-Verilog` map the pipesignals to the ports 

## Acknowledgements

- [Steve Hoover](https://github.com/stevehoover), Founder, Redwood EDA
- [Akos Hadnagy](https://github.com/ahadnagy), Advisor

## Contributors

- [Shrihari](https://www.linkedin.com/in/shariethernet/)
- [Bala Dhinesh](https://www.linkedin.com/in/bala-dhinesh/)