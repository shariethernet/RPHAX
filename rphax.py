import os
import sys
import argparse


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
    out_file=filename[0:len(filename)-4]
    print("Compiling "+filename+" with Sandpiper-Saas")
    sp = "sandpiper-saas -i "+filename+" -o "+out_file+".v --iArgs --default_includes --outdir=out"
    try:
        os.system(sp)
        print("Sandpiper has generated the verilog/systemverilog files")
        print("*******************************************************")
    except:
        print("Error - Verilog file not generated")
        exit()

def test1(filename):
    print("Filename is ",filename)
    print("Extension checker=",filename[len(filename)-4:len(filename)])

def pwd_write(dirname):
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
    try:
        os.system("vivado -mode batch -source "+dirname+"/ip_create.tcl")
        
    except:
        print("Error - IP Generation")
        exit()
    else:
        print("*******************************************************")
        print("****************Vivado IP Created**********************")
        print("*******************************************************")
        
def bdgen(dirname):
    try:
        os.system("vivado -mode batch -source "+dirname+"/bd_create.tcl")
    except:
        print("Error generating Block Design")
    else:
        print("*******************************************************")
        print("****************Vivado Block Design Created**********************")
        print("*******************************************************")

def bdgen_bitstream(dirname):
    try:
        os.system("vivado -mode batch -source "+dirname+"/bd_bitstream_create.tcl")
    except:
        print("Error generating block design and bitstream. Try generating upto block design and use gui for bitstream ")
    else:
        print("*******************************************************")
        print("****Vivado Block Design and Bitstream Created**********")
        print("*******************************************************")

def projgen(dirname):
    try:
        os.system("vivado -mode batch -source"+dirname+"/project.tcl")
    except:
        print("Error generating project")
        exit()
    else:
        print("*******************************************************")
        print("****************Block Design Generated*****************")
        print("*******************************************************")



def clean():
    if (sys.platform == "Windows"):
        os.system("powershell.exe rm -f tmp.txt")
    elif sys.platform in ["Linux","Darwin"] :
        os.system("rm -rf tmp.txt")
    else:
        print("Error cleaning temporary files")


def check_extension(filename):
    print("Design file = ",filename)
    if(filename[len(filename)-4:len(filename)]==".tlv"):
        pass
    else:
        print("Only .tlv files are supported")
        exit()

def main():

    intro()
    parser = argparse.ArgumentParser(description = "RPHAX")
    parser.add_argument("input_file", help = "Input .tlv file", type=str)
    parser.add_argument('-b', action="store_true", help = "Generate upto Bitstream")
    args = parser.parse_args()

    filename = args.input_file
    check_extension(filename)
    dirname = os.getcwd()
      
    pwd_write(dirname)
    
    
    tlv(filename)
    
    ipgen(dirname)
    
    if(args.b):
        bdgen_bitstream(dirname)
    else:
        bdgen(dirname)

    #clean() 

if __name__ == '__main__':
    main()
        
    