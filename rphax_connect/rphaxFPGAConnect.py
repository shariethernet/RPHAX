import CloudFlare
import os
import subprocess
import re 
import time
import argparse
import webbrowser
import connectionparams as cp
import requests
import json


########### DO NOT MODIFY #################
cf = CloudFlare.CloudFlare(token=cp.API_KEY)
api_key=cp.API_KEY
#api_email=cp.API_EMAIL
zone_info = cf.zones.get(params={'name':cp.DOMAIN})
#print("Zones info ",zone_info)
zone_id = zone_info[0]['id']
final_cname=""
config_yaml="""\
tunnel: {v_tunnel}
credentials-file: {v_credentials_file}

ingress:
    - hostname: {v_full_url}
      service: http://{v_service_url}:9090
    - service: http_status:404
"""
public_url=""
############################################
def extract_tunnel_credentials(string):
    pattern = r"Tunnel credentials written to (\S+\/\S+\.json).* with id (\S+)"
    match = re.search(pattern, string, re.DOTALL)
    if match:
        file_path = match.group(1)
        unique_id = match.group(2)
        return (file_path, unique_id)
    else:
        return None

def isDuplicateCNAME(name,list1,list2):
    if name in list1 or name in list2:
        return True
    else:
        return False

def gen_config_file(config_yml_string,config_fpath):
    print("\n === Writing configuration file ===")
    with open(config_fpath,'w') as f:
        f.write(config_yml_string)
    
def cloudflared_installation_part1():
    print("\n === Starting Cloudflared Download ===")
    try:
        os.system("cd /home/xilinx")
        os.system("mkdir -p cloudflared")
        os.system("cd cloudflared")
        os.system("wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm.deb")
        print("\n === Finished Cloudflared Download ===")
    except:
        raise Exception("Error downloading cloudflared")
    try:
        print("\n === Starting Cloudflared Installation ===")
        os.system("sudo dpkg --add-architecture arm")
        os.system("sudo dpkg -i cloudflared-linux-arm.deb")
        print("\n === Finished Cloudflared Installation ===")
    except:
        raise Exception("Error insalling cloudflared")

def tunnel_setup_part1():
    '''
    global api_key
    global api_email
    global zone_id
    global final_cname
    '''
    print("\n === Cloudflare Authorization ===")
    try:
        os.system("mkdir -p $HOME/.cloudflared")
    except:
        raise Exception("Could not create .cloudflared directory")
        '''
    api_url = 'https://api.cloudflare.com/client/v4/accounts/{}/tokens'.format(api_key)
    api_headers = {'X-Auth-Email': api_email, 'X-Auth-Key': api_key, 'Content-Type': 'application/json'}
    api_data = {'name': 'Cloudflare Tunnel Token', 'policies': [{'id': 'Tunnel:Edit', 'resource': {'type': 'zone', 'id': zone_id}}]}
    api_response = requests.post(api_url, headers=api_headers, data=json.dumps(api_data))
    api_token = api_response.json()['result']['value']

    # Authorize the Tunnel to the domain using the API token
    api_url = 'https://api.cloudflare.com/client/v4/zones/{}/tunnels'.format(zone_id)
    api_headers = {'Authorization': 'Bearer {}'.format(api_token), 'Content-Type': 'application/json'}
    api_data = {'name': final_cname, 'credentials': {}}
    api_response = requests.post(api_url, headers=api_headers, data=json.dumps(api_data))

    if api_response.status_code == 200:
        print('Cloudflare Tunnel authorized successfully.')
    else:
        raise Exception('Cloudflare Tunnel authorization failed.')
'''
    result = subprocess.run(['cloudflared', 'tunnel', 'login'], capture_output=True, text=True)
    if(result.returncode!=0):
        print(result.stdout)
        if 'https://' in result.stdout:
        # If a URL is present, open it in the default web browser
            url = result.stdout.strip()
            print("\nOpen this url:")
            #webbrowser.open(url)

    # Run the "cloudflared tunnel create test" command after successful authentication
def tunnel_setup_part2(cname,pynq_hostname,config_yml_string):
    global final_cname
    global tunnel_id
    tunnel_create = subprocess.run(['cloudflared', 'tunnel', 'create', cname],capture_output=True, text =True)
    tunnel_create_out = tunnel_create.stdout
    tunnel_create_err = tunnel_create.stderr
    if("tunnel with name already exists" in tunnel_create_out):
        raise Exception("Tunnel Name exists")
    else:
        print(tunnel_create_out,tunnel_create_err)
        cred_file,tunnel_id = extract_tunnel_credentials(tunnel_create_out)

        a=config_yml_string.format(v_tunnel=tunnel_id,
                       v_credentials_file=cred_file,
                       v_full_url=final_cname+'.'+cp.DOMAIN,
                       v_service_url=pynq_hostname)

        print(a)
        p=r'(.*)/[^/]*$'
        match=re.search(p,cred_file)
        dir_path=match.group(1)
        gen_config_file(a,dir_path+"/config.yml")

def cloudflared_service_install():
    try:
        print("\n === Installing Cloudflared as a system service ===")
        os.system("sudo cp /home/xilinx/.cloudflared/config.yml /etc/cloudflared/config.yml")
        os.system("sudo cloudflared service install")
        os.system("sudo systemctl start cloudflared")
        #os.system("sudo systemctl status cloudflared")
        print("\n === Cloudflared as a system service is active ===")
    except:
        print("\n !!! Error installing cloudflared as a service !!!")

def cloudflare_dns_read(cname,domain):
    global final_cname
    global public_url
    zone_name = domain

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
    try:
        recentfpgamember= pynqfpga_list[0]
    except:
        pynqfpga_list.append("u_0_pynq."+zone_name)
        recentfpgamember=pynqfpga_list[0]
    print("\n Recent FPGA Member",recentfpgamember)
    recentfpgamember_number = recentfpgamember.split("_")[1]
    print("\n Recent FPGA member number :",recentfpgamember_number)
    nextfpgamember_number =  int(recentfpgamember_number)+1
    print("\n Current FPGA member number :",nextfpgamember_number)
    nextfpgamember="u_"+str(nextfpgamember_number)+"_pynq."+zone_name
    print("\n Current FPGA URL :",nextfpgamember)
    print("----------------------------------------------------")
    gen_cnamerecordname ="u_"+str(nextfpgamember_number)+"_pynq" 
    in_str=cname+"."+domain
    if(isDuplicateCNAME(in_str,argotunnel_list,pynqfpga_list) or cname == " "):
        final_cname = gen_cnamerecordname
        public_url=final_cname+'.'+zone_name
        print("CNAME conflict or absent")
    else:
        final_cname = cname
        public_url=final_cname+'.'+zone_name
        print("Custom CNAME Record added successfully")
    print(f"public_url: {public_url}".format(public_url=public_url))

def cloudflare_dns_write(domain,tunnel_id_a):
    zone_name = domain
    zone_info = cf.zones.get(params={'name':zone_name})
    #print("Zones info ",zone_info)
    zone_id = zone_info[0]['id']
    write_dns_record = {'name':final_cname,'type':'CNAME','content':tunnel_id+'.cfargotunnel.com'}
    cf.zones.dns_records.post(zone_id, data=write_dns_record)


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
    parser.add_argument('-cp','--configpath',type=str,help = "Cloudflared config file path", default="$HOME/.cloudflared/config.yml")
    parser.add_argument('pynq_hostname',type=str,help="Provide the localhost name of pynq along with the port number Eg: pynq:9090")
    args = parser.parse_args()

    cloudflared_installation_part1()
    cloudflare_dns_read(args.cname,cp.DOMAIN)
    tunnel_setup_part1()
    print(final_cname)
    tunnel_setup_part2(final_cname,args.pynq_hostname,config_yaml)
    cloudflare_dns_write(cp.DOMAIN,tunnel_id)
    cloudflared_service_install()

if __name__ == "__main__":
    main()