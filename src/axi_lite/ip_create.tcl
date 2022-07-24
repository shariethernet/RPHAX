set output_dir "./"
create_project -f harness_axi_ip $output_dir/harness_axi_ip -part xc7z020clg400-1

file mkdir $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new
file copy -force $output_dir/src/axi_lite/harness_axi_ip_v1_0.v $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/harness_axi_ip_v1_0.v
file copy -force $output_dir/src/axi_lite/harness_axi_ip_v1_0_S00_AXI.v $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/harness_axi_ip_v1_0_S00_AXI.v
file copy -force $output_dir/out/harness_axi.v $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/harness_axi.v
file copy -force $output_dir/out/harness_axi_gen.v $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/harness_axi_gen.v
file copy -force $output_dir/includes/sp_verilog.vh $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/sp_verilog.vh
file copy -force $output_dir/includes/sandpiper.vh $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/sandpiper.vh
file copy -force $output_dir/includes/sandpiper_gen.vh $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/sandpiper_gen.vh

read_verilog $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/harness_axi_ip_v1_0.v
read_verilog $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/harness_axi_ip_v1_0_S00_AXI.v
read_verilog $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/harness_axi.v
read_verilog $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/harness_axi_gen.v
read_verilog $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/sp_verilog.vh
read_verilog $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/sandpiper.vh
read_verilog $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/sandpiper_gen.vh


update_compile_order -fileset sources_1
ipx::package_project -root_dir $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new -vendor user.org -library user -taxonomy /UserIP
ipx::open_ipxact_file $output_dir/harness_axi_ip/harness_axi_ip.srcs/sources_1/new/component.xml
ipx::merge_project_changes hdl_parameters [ipx::current_core]
ipx::merge_project_changes ports [ipx::current_core]
set_property core_revision 1 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog 


