from code import interact
import os
import sys
import re
import argparse
import datetime as dt
import webbrowser as wb


def intro():
    print("*****************************************************************")
    print(
''' 
    ____   ____   __  __ ___    _  __
   / __ \ / __ \ / / / //   |  | |/ /
  / /_/ // /_/ // /_/ // /| |  |   / 
 / _, _// ____// __  // ___ | /   |  
/_/ |_|/_/    /_/ /_//_/  |_|/_/|_|  
                               
Rapid Prototyping of Hardware Accelerators on Xilinx FPGAs - v0.1

'''
    )
    print("*****************************************************************")
    


def tlv(filename,rundir):
    print("\n************Interpreting TL-V with Sandpiper****************\n")
    out_file=filename[0:len(filename)-4]
    print("Compiling "+filename+" with Sandpiper-Saas")
    sp = "sandpiper-saas -i "+filename+" -o "+out_file+".v --iArgs --default_includes --outdir=runs/"+rundir+"/tlv_out"
    try:
        
        os.system(sp)
        print("Sandpiper has generated the verilog/systemverilog files")
        print("\n*******************************************************\n")
    except:
        print("Error - Verilog file not generated")
        exit()

def bsc():
    # TO DO
    pass
    
def test1(filename):
    print("Filename is ",filename)
    print("Extension checker=",filename[len(filename)-4:len(filename)])

def var_share(var,fsuffix):
    """ Function to share variables by writing into a file which can be later read by TCL or Shell script"""
    print("\n Content to be written in tmp_"+fsuffix+".txt: ", var)
    filename="tmp_"+fsuffix+".txt"
    try:
        rm_file="rm -rf "+filename
        os.system(rm_file)
    except:
        pass

    try:
        f=open(filename,"w")
        f.write(var+"\n")
    except:
        print("Couldnt create temporary file")
    else:
        print("\n Variable written in tmp_"+fsuffix+".txt: ", var)
    finally:
        f.close()

def pwd_write(dirname):
    print("\n****************Setting Paths**********************\n")
    f = open("tmp.txt", "w")
    try:
        f.write(dirname)
    except:
        print("Error - Writing path to temporary file")
    else:
        print("Path stored to read from TCL in temporary file")
    finally:
        f.close()

def merge_files(files, out_file):
    with open(out_file, 'w') as outfile:
        # Iterate through list
        for names in files:
            # Open each file in read mode
            with open(names) as infile:
                # read the data from file1 and
                # file2 and write it in file3
                outfile.write(infile.read())
            # Add '\n' to enter data of file2
            # from next line
            outfile.write("\n")

def automate_axi():
        fname = "./tlv_out/harness_axi.v"
        with open(fname, "r") as f:
            ports = []
            for line in f:
                if(len(line.split()) > 0):
                    if(line.split()[0] == "input" or line.split()[0] == "output"):
                        if (re.findall('\[.*?\]', line.split()[1:][0]) != []):
                            width = int(line.split()[1:][0][1:-1].split(":")[0]) + 1
                        else:
                            width = 1
                    if(line.split()[0] == "input"):
                        for text in (line.split()[1:]):
                            if (re.findall('\[.*?\]', text) == []):
                                ports.append([text.replace(",", ""), "in", width])
                    elif(line.split()[0] == "output"):
                        for text in (line.split()[1:]):
                            if (re.findall('\[.*?\]', text) == []):
                                ports.append([text.replace(",", ""), "out", width])
            f_wires = open("wires.txt", "w")
            f_addr_dec = open("addr_dec.txt", "w")
            f_inst = open("inst.txt", "w")
            inputs = 0
            curr_port = 0
            f_addr_dec.write(
                "	always @(*)\n	begin\n		case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )\n")
            f_inst.write("	harness_axi harness_axi_inst(\n")
            f_inst.write("		."+ports[0][0]+"(S_AXI_ACLK),\n")
            f_inst.write("		."+ports[1][0]+"(S_AXI_ARESETN),\n")
            for port in ports[2:]:
                if curr_port >= 8:
                    sys.exit("Error: Maximum allowed ports is eight.")
                if port[1] == "in":
                    f_inst.write("		."+port[0]+"(slv_reg"+str(inputs)+"),\n")
                    f_addr_dec.write("			3'h"+str(curr_port) +
                                    "		:	reg_data_out <= "+"slv_reg"+str(inputs)+";\n")
                    inputs += 1
                else:
                    f_inst.write("		."+port[0]+"("+port[0]+"),\n")
                    f_addr_dec.write("			3'h"+str(curr_port) +
                                    "		:	reg_data_out <= "+port[0]+";\n")
                    f_wires.write("	wire [C_S_AXI_DATA_WIDTH-1:0] "+port[0]+";\n")
                curr_port += 1
            f_addr_dec.write("			default	: 	reg_data_out <= 0;\n")
            f_addr_dec.write("		endcase\n")
            f_addr_dec.write("	end\n")
            f_inst.seek(f_inst.tell() - 2, os.SEEK_SET)
            f_inst.write("\n	);\n\n")
            f_inst.write("endmodule\n")
            f_wires.close()
            f_addr_dec.close()
            f_inst.close()

            merge_files(["wires.txt", "addr_dec.txt", "inst.txt"],
                        "../../src/axi_lite/harness_axi_ip_v1_0_S00_AXI_part2.v")
            merge_files(["../../src/axi_lite/harness_axi_ip_v1_0_S00_AXI_part1.v", "../../src/axi_lite/harness_axi_ip_v1_0_S00_AXI_part2.v"],
                        "../../src/axi_lite/harness_axi_ip_v1_0_S00_AXI.v")
            os.system("rm wires.txt addr_dec.txt inst.txt")

def ipgen(dirname, interface):
    print("\n**************Starting IP Packaging******************\n")
    automate_axi()
    try:
        if(interface == "axi_s"):
            os.system("vivado -mode batch -source "+dirname+"/src/ip_create.tcl")
        elif(interface == "axi_l"):
            
            os.system("vivado -mode batch -source "+dirname+"/src/axi_lite/ip_create.tcl")
        else:
            print("Error: Invalid --interface argument. Available values are 'axi_s' and 'axi_l'")
            sys.exit()
    except:
        print("Error - IP Generation")
        exit()
    else:
        print("\n****************Vivado IP Created**********************\n")
    finally:
        ip_set_params()
        
                
def bdgen(dirname, interface):
    print("\n****************Starting Block Design**********************\n")
    try:
        os.system("vivado -mode batch -source "+dirname+"/src/bd_create.tcl")
    except:
        print("Error generating Block Design")
        exit()
    else:
        print("\n****************Vivado Block Design Created**********************\n")
        
def bdgen_bitstream(dirname, interface):
    print("\n****************Starting Block Design and Bitstream**********************\n")
    try:
        if(interface == "axi_s"):
            os.system("vivado -mode batch -source "+dirname+"/src/bd_bitstream_create.tcl")
        elif(interface == "axi_l"):
            os.system("vivado -mode batch -source "+dirname+"/src/axi_lite/bd_bitstream.tcl")
        else:
            print("Error: Invalid --interface argument. Available values are 'axi_s' and 'axi_l'")
            sys.exit()
    except:
        print("Error generating block design and bitstream. Try generating upto block design and use gui for bitstream ")
        exit()
    else:
        print("\n****Vivado Block Design and Bitstream Created**********\n")

def projgen(dirname):
    print("\n****************Creating Vivado Project from IP**********************\n")
    try:
        os.system("vivado -mode batch -source"+dirname+"/src/project.tcl")
    except:
        print("Error generating project")
        exit()
    else:
        print("\n****************Block Design Generated*****************\n")

def ip_set_params():
    pass

def makerchip_create(design,fromURL=None):
    if(fromURL == None):
        cmd1="makerchip "+design
        os.system(cmd1)
    elif (fromURL != None):
        cmd2="makerchip --from-url "+fromURL+" "+design
        os.system(cmd2)

def create_rundir():
    try:
        os.mkdir("runs",0o777)
    except:
        print("** Run directory already exists")
def setup_runs(project_name):
    try:
        create_rundir()
        os.chdir("runs")
    except:
        pass
    a=dt.datetime.now()
    b=str(a).split(" ")
    c=b[1].split(":")
    d=c[0]+c[1]+c[2][0:2]
    try:
        run_dirname = "run_"+project_name+d
        os.mkdir(run_dirname)
        os.chdir("../")
        print(os.getcwd())
    except:
        print("** Error configuring runs")
        exit()
    # try:
    #     os.chdir(run_dirname)
    # except:
    #     print(" Error changing to run_dir")
    return run_dirname

def clean(rphax_dir_path):
    run_dirs = rphax_dir_path+"/runs/*"
    if (sys.platform == "Windows"):
        os.system("powershell.exe rm -f tmp.txt")
    elif sys.platform in ["Linux","Darwin"] :
        os.system("rm -rf run_dirs")
    else:
        print("Error cleaning temporary files")


def check_extension(filename):
    print("\n****************Validating file extensions**********************\n")
    print("Design file = ",filename)
    if(filename[len(filename)-4:len(filename)]==".tlv"):
        pass
    else:
        print("Only .tlv files are supported")
        exit()

def main():

    intro()
    parser = argparse.ArgumentParser(description = "RPHAX")

    subparsers = parser.add_subparsers(help="commands")

    generate_parser = subparsers.add_parser('generate',help="Generate mode: IP-> Block Design -> Bitstream")

    generate_parser.add_argument('-b', action="store_true", help = "Generate upto Bitstream")
    generate_parser.add_argument('-connect',action="store_true",help = "Connect Local/Remote FPGA")
    generate_parser.add_argument('-pynq',action="store_true",help = "Open PYNQ Jupyter Notebook")
    generate_parser.add_argument('-url',type=str,help = "PYNQ URL Format = http://url:port",default="http://pynq:9090")
    generate_parser.add_argument("input_file", help = "Input .tlv file", type=str)
    generate_parser.add_argument("--interface", help = "AXI Interface: axi_l for axi lite and axi_s for axi stream", type=str,default="axi_s")


    #parser.add_argument()

    #Connect Mode
    connect_parser = subparsers.add_parser('connect',help="Connect mode: Connect (Local/Remote) Program &| probe designs on FPGA")

    connect_parser.add_argument('bit_file',help="Bitstream Path",type=str)
    connect_parser.add_argument('-ip',help="IP address of FPGA. Defaults to localhost",default="localhost",type=str)
    connect_parser.add_argument('-p',help="Port number. Defaults to 3121", default=3121, type=int)
    connect_parser.add_argument('-probe',help="Probe File Path",type=str)



    #makerchip create mode
    create_parser = subparsers.add_parser('makerchip',help="Develop RTL Design in Makerchip App")
    create_parser.add_argument('input_mfile', help="Name of the .tlv file", type=str,nargs=1,default=None)
    create_parser.add_argument('--from_url', help="Template URL", type=str)

    args = parser.parse_args()

    filename = args.input_file
    check_extension(filename)
    rphax_dir_path = os.getcwd()
    l_filename = filename.split(".")
    project_name = l_filename[0]
      

    
    rundir = setup_runs(project_name)
    run_dir_path = "runs/"+rundir
    run_dir_abs_path = rphax_dir_path+"/runs/"+rundir

  
    tlv(filename,rundir)
    
    os.chdir(run_dir_path)
    var_share(run_dir_abs_path,"bd")

    var_share(project_name,"projectname")
    
    
    
    ipgen(rphax_dir_path, args.interface)

    if(args.pynq):
        wb.open(args.url,new=2)

    
    if(args.b):
        bdgen_bitstream(rphax_dir_path, args.interface)
    else:
        bdgen(rphax_dir_path, args.interface)

    #clean() 

if __name__ == '__main__':
    main()
        
    
