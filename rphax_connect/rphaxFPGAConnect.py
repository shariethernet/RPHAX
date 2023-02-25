import CloudFlare
import os
import subprocess
import re 
import time
import argparse
import webbrowser
import connectionparams as cp

#def find_matches(d, item):
#    for k in d:
#        if re.match(k, item):
#            return d[k]

config_yaml="""

tunnel: {v_tunnel}
credentials-file: {v_credentials_file}

ingress:
    - hostname: {v_full_url}
      service: {v_service_url}
    - service: https_status:404

"""
public_url=""

def gen_config_file(config_yml_string):
    with open("config.yml",'w') as f:
        f.write(config_yml_string)
    
def cloudflared_installation_part1():
    try:
        os.system("cd /home/xilinx")
        os.system("mkdir cloudflared")
        os.system("cd cloudflared")
        os.system("wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm.deb")
    except:
        print("Error 1")
    try:
        os.system("dpkg --add-architecture arm")
        os.system("dpkg -i cloudflared-linux-arm.deb")
    except:
        print("Error insalling cloudflared")

def tunnel_setup(pynq_hostname,outside_url):

    result = subprocess.run(['cloudflared', 'tunnel', 'login'], capture_output=True, text=True)
    if(result.returncode!=0):
        if 'https://' in result.stdout:
        # If a URL is present, open it in the default web browser
            url = result.stdout.strip()
            print("Open this url:")
            #webbrowser.open(url)

    # Wait for user to authenticate
    start_time = time.time()
    while True:
        time.sleep(5)  # Wait for 5 seconds
        check_result = subprocess.run(['cloudflared', 'tunnel', 'whoami'], capture_output=True, text=True)
        if 'Logged in as' in check_result.stdout:
            break
        elif time.time() - start_time >= 600:  # Timeout after 10 minutes
            print("Authentication timed out after 10 minutes.")
            exit(1)

    # Run the "cloudflared tunnel create test" command after successful authentication
    tunnel_create = subprocess.run(['cloudflared', 'tunnel', 'create', 'test1'],capture_output=True, text =True)
    print(tunnel_create.stdout)
    config_yaml.format(v_tunnel="",
                   v_credentials_file="",
                   v_full_url="",
                   v_service_url=pynq_hostname)

def cloudflared_installation_part2():
    try:
        os.system("cloudflared service install")
        os.system("systemctl start cloudflared")
        os.system("systemctl status cloudflared")
    except:
        print("\n Error in Part2")

def cloudflare_dns_config(cname,domain):
    zone_name = domain
    cf = CloudFlare.CloudFlare(token=cp.API_KEY)
    zone_info = cf.zones.get(params={'name':zone_name})
    #print("Zones info ",zone_info)
    zone_id = zone_info[0]['id']
    #print(" Zone ID", zone_id)
    print("----------------------------------------------------")
    

    dns_records = cf.zones.dns_records.get(zone_id,params={'type':"CNAME"})
    print("DNS Records :",dns_records)
    print("----------------------------------------------------")
    argotunnel_list = []
    pynqfpga_list=[]
    for dns_record in dns_records:

        x=re.search(".*cfargotunnel\.com",dns_record['content'])
        if(x):
            print("\n ",dns_record['content'], "\t", dns_record['name'])
            argotunnel_list.append(dns_record['name'])

        y=re.search("\.*_pynq\.technowiz\.org",dns_record['name'])
        if(y):
            print("\n ",dns_record['content'], "\t", dns_record['name'])
            pynqfpga_list.append(dns_record['name'])
    print("----------------------------------------------------")
    print("Argo Tunnel List:",argotunnel_list)
    print("----------------------------------------------------")
    print("Pynq FPGA List:",pynqfpga_list)
    print("----------------------------------------------------")
    pynqfpga_list.sort(reverse=True)
    recentfpgamember= pynqfpga_list[0]
    print("\n Recent FPGA Member",recentfpgamember)
    recentfpgamember_number = recentfpgamember.split("_")[1]
    print("\n Recent FPGA member number :",recentfpgamember_number)
    nextfpgamember_number =  int(recentfpgamember_number)+1
    print("\n Current FPGA member number :",nextfpgamember_number)
    nextfpgamember="u_"+str(nextfpgamember_number)+"_pynq."+zone_name
    print("\n Current FPGA URL :",nextfpgamember)
    print("----------------------------------------------------")
    cnamerecordname ="u_"+str(nextfpgamember_number)+"_pynq" 
    in_str=cname+'.'+zone_name
    public_url=in_str
    if(isDuplicateCNAME(in_str,argotunnel_list,pynqfpga_list) or cname == " "):
        #write_dns_record = {'name':cnamerecordname,'type':'CNAME','content':cnamerecordname+'.cfargotunnel.com'}
        #cf.zones.dns_records.post(zone_id, data=write_dns_record)
        print("CNAME conflict or absent")
    else:
        #write_dns_record = {'name':cnamerecordname,'type':'CNAME','content':cname+'.cfargotunnel.com'}
        #cf.zones.dns_records.post(zone_id, data=write_dns_record)
        print("Custom CNAME Record added successfully")


    '''
        a_split = dns_record['content'].split(".")
        if( a_split[1] == "cfargotunnel"):
            print("\n ",dns_record['content'], "\t", dns_record['name'])
            fpga_list.append(dns_record['name'])
    
   
'''
    # for fpga

        #if re.match(dns_record['content'],"*.cfargotunnel.com"):
         #   print("\n ",dns_record['name'])
def main():
    parser = argparse.ArgumentParser(description = "RPHAX Remote - Configurator")
    parser.add_argument('-cn','--cname',type=str,help = "User Defined CNAME for the record", default=" ")
    parser.add_argument('-cp','--configpath',type=str,help = "Cloudflared config file path", default=" ")
    parser.add_argument('pynq_hostname',type=str,help="Provide the localhost name of pynq along with the port number Eg: pynq:9090")
    args = parser.parse_args()

    cloudflared_installation_part1()
    cloudflare_dns_config(args.cname,cp.DOMAIN)
    tunnel_setup(args.pynq_hostname,public_url)
    cloudflared_installation_part2()

def isDuplicateCNAME(name,list1,list2):
    if name in list1 or name in list2:
        return True
    else:
        return False


if __name__ == "__main__":
    main()