set fp [open "tmp_bd.txt" r]
set content [read $fp]
close $fp
set lines [split $content \n]
set pwdd [lindex $lines 0]
set output_dir "$pwdd/ip"
puts $output_dir
puts $pwdd

# set output_dir "./ip"
create_project -f rphax_harness_ip $output_dir/rphax_harness_ip -part xc7z020clg400-1
#set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
#add_files -norecurse {/home/ee19b011/Files/RPHAX/rphax_harness_ip_v1_0.v /home/ee19b011/Files/RPHAX/rphax_harness_ip_v1_0_S00_AXI.v}
file mkdir $output_dir/rphax_harness_ip/rphax_harness_ip.srcs/sources_1/new
#close [ open {/home/dhinesh/Files/RPHAX/src/inverter2.v} w ]
#add_files -fileset sources_1 {/home/dhinesh/Files/RPHAX/src/inverter2.v}
file copy -force ./src/rphax_harness_ip_v1_0.v $output_dir/rphax_harness_ip/rphax_harness_ip.srcs/sources_1/new/rphax_harness_ip_v1_0.v
file copy -force ./src/rphax_harness_ip_v1_0_S00_AXI.v $output_dir/rphax_harness_ip/rphax_harness_ip.srcs/sources_1/new/rphax_harness_ip_v1_0_S00_AXI.v
file copy -force ./src/rphax_harness_axi.v $output_dir/rphax_harness_ip/rphax_harness_ip.srcs/sources_1/new/rphax_harness_axi.v
read_verilog $output_dir/rphax_harness_ip/rphax_harness_ip.srcs/sources_1/new/rphax_harness_ip_v1_0.v
read_verilog $output_dir/rphax_harness_ip/rphax_harness_ip.srcs/sources_1/new/rphax_harness_ip_v1_0_S00_AXI.v
read_verilog $output_dir/rphax_harness_ip/rphax_harness_ip.srcs/sources_1/new/rphax_harness_axi.v
update_compile_order -fileset sources_1
ipx::package_project -root_dir $output_dir/rphax_harness_ip/rphax_harness_ip.srcs/sources_1/new -vendor user.org -library user -taxonomy /UserIP
#set_property  ip_repo_paths  /home/ee19b011/Files/RPHAX [current_project]
#update_ip_catalog
ipx::open_ipxact_file $output_dir/rphax_harness_ip/rphax_harness_ip.srcs/sources_1/new/component.xml
ipx::merge_project_changes hdl_parameters [ipx::current_core]
ipx::merge_project_changes ports [ipx::current_core]
set_property core_revision 1 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog 


