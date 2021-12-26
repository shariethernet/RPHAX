import os
filename = input("Enter the filename: ")
### TAKING THE REQUIRED INPUT FROM THE USER
os.system("echo '================================================' ")
temp = "sandpiper-saas -i "+filename+".tlv -o "+filename+".v --iArgs --default_includes --outdir=out"
#temp3= "sandpiper -i "+filename+".tlv -o "+filename+".v --iArgs --default_includes --outdir=out"
os.system(temp)
print("Sandpiper has generated the verilog/systemverilog files")
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

