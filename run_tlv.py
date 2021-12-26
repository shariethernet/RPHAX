import os
print("*****************************************************************")
print(''' 

    ____   ____   __  __ ___    _  __
   / __ \ / __ \ / / / //   |  | |/ /
  / /_/ // /_/ // /_/ // /| |  |   / 
 / _, _// ____// __  // ___ | /   |  
/_/ |_|/_/    /_/ /_//_/  |_|/_/|_|  
                               
Rapid Prototyping of Hardware Accelerators on Xilinx FPGAs - v0.1

''')
print("*****************************************************************")
filename = input("Enter the filename: ")
### TAKING THE REQUIRED INPUT FROM THE USER
print("*******************************************************")
temp = "sandpiper-saas -i "+filename+".tlv -o "+filename+".v --iArgs --default_includes --outdir=out"
#temp3= "sandpiper -i "+filename+".tlv -o "+filename+".v --iArgs --default_includes --outdir=out"
os.system(temp)
print("Sandpiper has generated the verilog/systemverilog files")
print("*******************************************************")
dirname = os.getcwd()
f = open("tmp.txt", "w")
f.write(dirname)
f.close()
#
#os.system("mkdir includes")
#os.system("cd includes")
#os.system("curl https://github.com/shariethernet/RPHAX/blob/main/includes/sandpiper.vh")
#os.system("curl https://github.com/shariethernet/RPHAX/blob/main/includes/sp_verilog.vh")
#os.system("curl https://github.com/shariethernet/RPHAX/blob/main/includes/sandpiper_gen.vh")
#os.system("cd ..")
os.system("vivado -mode batch -source "+dirname+"/ip_create.tcl")
os.system("vivado -mode batch -source "+dirname+"/bd_create.tcl")
#os.system("rm -f tmp.txt ")

