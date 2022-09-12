# Expected arguments
# hw_server: ip address or hostname
# jtag_id: SN of the JTAG device to program
# fpga_bitfile: Path to the FPGA Bitfile
# fpga_probes: Optiona. Path to the FPGA probes file.



connect_hw_server -url $hostname:3121 -allow_non_jtag
current_hw_target [get_hw_targets */$JTAGID]
set_property PARAM.FREQUENCY 7500000 [get_hw_targets */$JTAGID]
open_hw_target
set cur_hw_device [get_hw_devices *]
current_hw_device $cur_hw_device
set_property PROBES.FILE {$fpga_probes} [get_hw_devices $cur_hw_device]
set_property FULL_PROBES.FILE {$fpga_probes} [get_hw_devices $cur_hw_device]
set_property PROGRAM.FILE {$fpga_bitfile} [get_hw_devices $cur_hw_device]
program_hw_devices [get_hw_devices $cur_hw_device]