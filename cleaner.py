import os
import sys

def main():
    try:
        if(sys.platform =="Windows"):
            os.system("rmdir /f /s ip myproj out NA")
            os.system("del /f *.jou")
        if(sys.platform in ["Linux","Darwin"]):
            os.system('rm -rf ip myproj out NA *.jou *.log tmp.txt')
    except:
        print("Error Cleaning Files")
    else:
        print("Succesfully cleaned the files")




if __name__ == '__main__':
    main()