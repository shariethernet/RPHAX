### TAKING THE REQUIRED INPUT FROM THE USER
echo "================================================"
read -p "WHICH FILE YOU WANT TO UPLOAD ON VIVADO : " filename
echo "================================================"
sandpiper-saas -i "$filename".tlv -o "$filename".v --iArgs --default_includes --outdir=out
shell_path=$(cd "$(dirname "$0")" && pwd)
mkdir includes
cd includes
wget https://github.com/shariethernet/RPHAX/blob/main/includes/sandpiper.vh
wget https://github.com/shariethernet/RPHAX/blob/main/includes/sp_verilog.vh
wget https://github.com/shariethernet/RPHAX/blob/main/includes/sandpiper_gen.vh
cd ..
echo "$shell_path" >>tmp.txt
vivado -mode batch -source "$shell_path"/ip_create.tcl
vivado -mode batch -source "$shell_path"/project_1.tcl
rm -f tmp.txt
