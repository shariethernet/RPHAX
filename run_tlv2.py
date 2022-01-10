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
    temp = "sandpiper-saas -i "+filename+" -o "+out_file+".v --iArgs --default_includes --outdir=out"
    try:
        os.system(temp)
        print("Sandpiper has generated the verilog/systemverilog files")
        print("*******************************************************")
    except:
        print("Error - Verilog file not generated")
        exit()

def test1(filename):
    print("Filename is ",filename)
    print("Extension checker=",filename[len(filename)-4:len(filename)])

def pwd(dirname):
    f = open("tmp.txt", "w")
    f.write(dirname)
    f.close()

def ipgen(dirname):
    try:
        os.system("vivado -mode batch -source "+dirname+"/ip_create.tcl")
        print("*******************************************************")
        print("****************Vivado IP Created**********************")
        print("*******************************************************")
    except:
        print("Error - IP Generation")
        exit()
        
def bdgen(dirname):
    try:
        os.system("vivado -mode batch -source "+dirname+"/bd_create.tcl")
        print("*******************************************************")
        print("****************Vivado Block Design Created**********************")
        print("*******************************************************")
    except:
        print("Error generating Block Design")

def bdgen_bitstream(dirname):
    try:
        os.system("vivado -mode batch -source "+dirname+"/bd_bitstream_create.tcl")
        print("*******************************************************")
        print("****************Vivado Block Design and Bitstream Created**********************")
        print("*******************************************************")
    except:
        print("Error generating block design and bitstream. Try generating upto block design and use gui for bitstream ")

def projgen():
    try:
        os.system("vivado -mode batch -source"+dirname+"/project.tcl")
        print("*******************************************************")
        print("****************Block Design Generated*****************")
        print("*******************************************************")
    except:
        print("Error generating project")
        exit()


def clean():
    os.system("rm -f tmp.txt ")

def check_extension(filename):
    print("Design file = ",filename)
    if(filename[len(filename)-4:len(filename)]==".tlv"):
        pass
    else:
        print("Only .tlv files are supported")
        exit()

def main(filename,dirname):#en_bitstream):
    '''
    parser = argparse.ArgumentParser(description='RPHAX')
    parser.add_argument('--i', type=str)
    parser.add_argument('--b', type=int)
    args = parser.parse_args()
'''

    intro()
    pwd(dirname)
    # test1(filename)
    check_extension(filename)
    tlv(filename)
    ipgen(dirname)
    bdgen(dirname)
    '''if(en_bitstream == "-b"):
        bdgen_bitstream()
    else:
        bdgen()'''

    #tlv()

if __name__ == '__main__':
        dirname = os.getcwd()
    #try:
        filename = sys.argv[1]
        '''try:
            en_bitstream = sys.argv[2]
        except:
            pass '''
        main(filename,dirname)
    #except:
        #print("Syntax Error: python run_tlv.py filename.tlv [Option to generate bitstream: -b] (By default till block design will be created) ")
    