import os
filename = input("Enter the filename: ")
### TAKING THE REQUIRED INPUT FROM THE USER
os.system("echo '================================================' ")
temp = "sandpiper-saas -i "+filename+".tlv -o "+filename+".v --iArgs --default_includes --outdir=out"
<<<<<<< HEAD
#temp3= "sandpiper -i "+filename+".tlv -o "+filename+".v --iArgs --default_includes --outdir=out"
os.system(temp)
print("Sandpiper has generated the verilog/systemverilog files")
=======
os.system(temp)
>>>>>>> b476dd49f0b36c13df89b8cb80bdd56628a9817a
dirname = os.getcwd()
f = open("tmp.txt", "w")
f.write(dirname)
f.close()
<<<<<<< HEAD
'''
os.system("mkdir includes")
os.system("cd includes")
os.system("curl https://github.com/shariethernet/RPHAX/blob/main/includes/sandpiper.vh")
os.system("curl https://github.com/shariethernet/RPHAX/blob/main/includes/sp_verilog.vh")
os.system("curl https://github.com/shariethernet/RPHAX/blob/main/includes/sandpiper_gen.vh")
os.system("cd ..")
'''
os.system("vivado -mode batch -source "+dirname+"/ip_create.tcl")
os.system("vivado -mode batch -source "+dirname+"/bd_create.tcl")
#os.system("rm -f tmp.txt ")
=======

os.system("mkdir includes;cd includes;wget https://github.com/shariethernet/RPHAX/blob/main/includes/sandpiper.vh;wget https://github.com/shariethernet/RPHAX/blob/main/includes/sp_verilog.vh;wget https://github.com/shariethernet/RPHAX/blob/main/includes/sandpiper_gen.vh")
os.system("cd ..")
os.system("vivado -mode batch -source "+dirname+"/ip_create.tcl")
os.system("vivado -mode batch -source "+dirname+"/project_1.tcl")
os.system("rm -f tmp.txt ")
>>>>>>> b476dd49f0b36c13df89b8cb80bdd56628a9817a
