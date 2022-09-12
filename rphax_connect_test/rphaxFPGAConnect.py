import CloudFlare
import os
import re 

#def find_matches(d, item):
#    for k in d:
#        if re.match(k, item):
#            return d[k]

def cloudflareFPGASetup():
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
        print("Error in insalling cloudflared")

def cloudfalredasaService():
    pass #API Authorisation required

def cloudflareDNSConfig():
    zone_name = "technowiz.org"
    cf = CloudFlare.CloudFlare(token='dlkjX3PSRMei10QdqJPD7ZrWPYn91F1Ncbb7SgZY')
    zone_info = cf.zones.get(params={'name':zone_name})
    print("Zones info ",zone_info)
    zone_id = zone_info[0]['id']
    print(" Zone ID", zone_id)
    print("---------------------------------------")
    

    dns_records = cf.zones.dns_records.get(zone_id,params={'type':"CNAME"})
    print("DNS Records :",dns_records)
    print("---------------------------------------")
    argotunnel_list = []
    pynqfpga_list=[]
    for dns_record in dns_records:

        x=re.search(".*cfargotunnel\.com",dns_record['content'])
        if(x):
            print("\n ",dns_record['content'], "\t", dns_record['name'])
            argotunnel_list.append(dns_record['name'])

        y=re.search("u.*_pynq\.technowiz\.org",dns_record['name'])
        if(y):
            print("\n ",dns_record['content'], "\t", dns_record['name'])
            pynqfpga_list.append(dns_record['name'])

    print("Argo Tunnel List:",argotunnel_list)
    print("Pynq FPGA List:",pynqfpga_list)
    pynqfpga_list.sort(reverse=True)
    recentfpgamember= pynqfpga_list[0]
    print("\n Recent FPGA Member",recentfpgamember)
    recentfpgamember_number = recentfpgamember.split("_")[1]
    print("\n Recent FPGA member number :",recentfpgamember_number)
    nextfpgamember_number =  int(recentfpgamember_number)+1
    print("\n Current FPGA member number :",nextfpgamember_number)
    nextfpgamember="u_"+str(nextfpgamember_number)+"_pynq.technowiz.org"
    print("\n Current FPGA URL :",nextfpgamember)
    cnamerecordname ="u_"+str(nextfpgamember_number)+"_pynq" 
    write_dns_record = {'name':cnamerecordname,'type':'CNAME','content':'test'+str(nextfpgamember_number)+'.cfargotunnel.com'}
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

if __name__ == "__main__":
    cloudflareDNSConfig()