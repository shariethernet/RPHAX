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

- To add your own custom design refer [templates](/templates) or create your own depending on the given example.

### Customizing Clock Bus parameters 

#### Using Vivado TCL 

##### Changing the Clock Frequency

- The script sets the default frequency to be `100 Mhz`. However this can be changed by placing the below TCL Command in [ip_create.tcl](src/ip_create.tcl)

 ```
set_property VALUE _your_clk_freq_in_Hz_ [ipx::get_bus_parameters -of_objects [ipx::get_bus_interfaces -of_objects [ipx::current_core]  axi_clk] FREQ_HZ]
```
##### Associating more ports with the same clock

- The `ASSOCIATED_BUSIF` parameter is used to tell which AXI Buses use which clock in a multiple clock domain design. Here we use a single clock domain and so we associated all the AXI Buses to `axis_clk`. This can be done by adding the following command in [ip_create.tcl](src/ip_create.tcl)

```
set_property VALUE m_axis:s_axis [ipx::get_bus_parameters -of_objects [ipx::get_bus_interfaces -of_objects [ipx::current_core]  axi_clk] ASSOCIATED_BUSIF]
```

- Make sure that the different buses are separated by a colon `:`

#### Using GUI

- Open the VIVADO Project and from sources click on `component.xml` then right click `axi_clk` > `edit interface` > Parameters and then set the `ASSOCIATED_BUSIF`'s value to m_axis:s_axis
- Similarly set `FREQ_HZ` to `100000000` (100Mhz) 
- Repackage the IP
- Open the block design project from `myproj` and Upgrade IP
- Generate Bitstream

### Repackaging

- After making any changes in the IP. Repackage the IP. This is done automatically in the TCL Scripts
- The block design has to be upgraded. This is also done automatically in the TCL Scripts
- So every time you call `ip_create()` and `bd_create()` functions in python, the updates are checked and the latest design is used
- Alternatively, this can also be done in GUI

## TO-DO

- Add `TLV` templates for various interfaces (AXI4, AXI4 Lite, RoCC etc.,)
- Templates are found [here](./templates)
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