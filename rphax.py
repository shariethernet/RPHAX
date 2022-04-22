import os
import sys
import argparse
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
    


def tlv(filename):
    print("\n************Interpreting TL-V with Sandpiper****************\n")
    out_file=filename[0:len(filename)-4]
    print("Compiling "+filename+" with Sandpiper-Saas")
    sp = "sandpiper-saas -i "+filename+" -o "+out_file+".v --iArgs --default_includes --outdir=out"
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
        f=open(filename,"a")
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

def ipgen(dirname):
    print("\n**************Starting IP Packaging******************\n")
    try:
        os.system("vivado -mode batch -source "+dirname+"/src/ip_create.tcl")
        
    except:
        print("Error - IP Generation")
        exit()
    else:
        print("\n****************Vivado IP Created**********************\n")
    finally:
        ip_set_params()
        
                
def bdgen(dirname):
    print("\n****************Starting Block Design**********************\n")
    try:
        os.system("vivado -mode batch -source "+dirname+"/src/bd_create.tcl")
    except:
        print("Error generating Block Design")
        exit()
    else:
        print("\n****************Vivado Block Design Created**********************\n")
        
def bdgen_bitstream(dirname):
    print("\n****************Starting Block Design and Bitstream**********************\n")
    try:
        os.system("vivado -mode batch -source "+dirname+"/src/bd_bitstream_create.tcl")
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



def clean():
    if (sys.platform == "Windows"):
        os.system("powershell.exe rm -f tmp.txt")
    elif sys.platform in ["Linux","Darwin"] :
        os.system("rm -rf tmp.txt")
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


    #parser.add_argument()

    connect_parser = subparsers.add_parser('connect',help="Connect mode: Connect (Local/Remote) Program &| probe designs on FPGA")
    connect_parser.add_argument('bit_file',help="Bitstream Path",type=str)
    connect_parser.add_argument('-ip',help="IP address of FPGA. Defaults to localhost",default="localhost",type=str)
    connect_parser.add_argument('-p',help="Port number. Defaults to 3121", default=3121, type=int)
    connect_parser.add_argument('-probe',help="Probe File Path",type=str)




    args = parser.parse_args()

    filename = args.input_file
    check_extension(filename)
    dirname = os.getcwd()
      
    var_share(dirname,"bd")
    
    
    tlv(filename)
    
    ipgen(dirname)

    if(args.pynq):
        wb.open(args.url,new=2)

    
    if(args.b):
        bdgen_bitstream(dirname)
    #else:
        #bdgen(dirname)

    #clean() 

if __name__ == '__main__':
    main()
        
    
