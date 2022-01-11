import os
import sys

def main():
    try:
        if(sys.platform =="Windows"):
            os.system('powershell.exe rm -rf ip myproj out NA *.jou *.log tmp.txt')
        if(sys.platform in ["Linux","Darwin"]):
            os.system('rm -rf ip myproj out NA *.jou *.log tmp.txt')
    except:
        print("Error Cleaning Files")
    else:
        print("Succesfully cleaned the files")




if __name__ == '__main__':
    main()