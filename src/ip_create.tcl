set fp [open "tmp_bd.txt" r]
set content [read $fp]
close $fp
set lines [split $content \n]
set pwdd [lindex $lines 0]
set output_dir "$pwdd/ip"
puts $output_dir
puts $pwdd


set fp [open "tmp_projectname.txt" r]
set content [read $fp]
close $fp
set lines [split $content \n]
set project_name0 [lindex $lines 0]
set project_name1 "${project_name0}"
puts $project_name0
puts $project_name1



create_project -f $project_name1 $output_dir/$project_name1 -part xc7z020clg400-1
#set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]

file mkdir $output_dir/$project_name1/${project_name1}.srcs/sources_1/new
#close [ open {/home/dhinesh/Files/RPHAX/src/inverter2.v} w ]
#add_files -fileset sources_1 {/home/dhinesh/Files/RPHAX/src/inverter2.v}
file copy -force ./tlv_out/${project_name1}.v $output_dir/${project_name1}/${project_name1}.srcs/sources_1/new/${project_name1}.v
file copy -force ./tlv_out/${project_name1}_gen.v $output_dir/${project_name1}/${project_name1}.srcs/sources_1/new/${project_name1}_gen.v
file copy -force ./tlv_out/includes/proj_verilog/sp_verilog.vh $output_dir/${project_name1}/${project_name1}.srcs/sources_1/new/sp_verilog.vh
file copy -force ./tlv_out/includes/sandpiper.vh $output_dir/${project_name1}/${project_name1}.srcs/sources_1/new/sandpiper.vh
file copy -force ../../includes/sandpiper_gen.vh $output_dir/${project_name1}/${project_name1}.srcs/sources_1/new/sandpiper_gen.vh
read_verilog $output_dir/${project_name1}/${project_name1}.srcs/sources_1/new/${project_name1}.v
update_compile_order -fileset sources_1

############Packaging to AXI-Stream##################
# 1 Master Port, 1 stream port
ipx::package_project -root_dir $output_dir/${project_name1}/${project_name1}.srcs/sources_1/new -vendor xilinx.com -library user -taxonomy /UserIP
# Master bus
ipx::add_bus_interface m_axis [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:axis_rtl:1.0 [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:axis:1.0 [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]
set_property interface_mode master [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]
set_property description {Master : The inverted data is sent out from this} [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]
ipx::add_port_map TDATA [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]
set_property physical_name m_axis_data [ipx::get_port_maps TDATA -of_objects [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]]
ipx::add_port_map TREADY [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]
set_property physical_name m_axis_ready [ipx::get_port_maps TREADY -of_objects [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]]
ipx::add_port_map TVALID [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]
set_property physical_name m_axis_valid [ipx::get_port_maps TVALID -of_objects [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]]

# Slave Bus
ipx::add_bus_interface s_axis [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:axis_rtl:1.0 [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:axis:1.0 [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]
set_property description {Slace: This interface takes in the input data} [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]
ipx::add_port_map TDATA [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]
set_property physical_name s_axis_data [ipx::get_port_maps TDATA -of_objects [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]]
ipx::add_port_map TVALID [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]
set_property physical_name s_axis_valid [ipx::get_port_maps TVALID -of_objects [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]]
ipx::add_port_map TREADY [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]
set_property physical_name s_axis_ready [ipx::get_port_maps TREADY -of_objects [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]]

# Add Default parameters
ipx::add_bus_parameter ASSOCIATED_BUSIF [ipx::get_bus_interfaces axi_clk -of_objects [ipx::current_core]] 
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces axi_clk -of_objects [ipx::current_core]]

#Setting Bus parameters
set_property VALUE 100000000 [ipx::get_bus_parameters -of_objects [ipx::get_bus_interfaces -of_objects [ipx::current_core]  axi_clk] FREQ_HZ]
set_property VALUE m_axis:s_axis [ipx::get_bus_parameters -of_objects [ipx::get_bus_interfaces -of_objects [ipx::current_core]  axi_clk] ASSOCIATED_BUSIF]

# Package IP

set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
#set_property  ip_repo_paths  {} [current_project]
#set_property  ip_repo_paths  "D:\RISC-V\Pynq\Projects\AutomateIP_TCL\ip3/ip/${project_name1}/${project_name1}.srcs/sources_1/new" [current_project]
update_ip_catalog
