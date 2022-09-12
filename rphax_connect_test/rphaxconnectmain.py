import CloudFlare
import os
import re 

class RphaxConnect():
    zone_name = "technowiz.org"
    cf = CloudFlare.CloudFlare(token='dlkjX3PSRMei10QdqJPD7ZrWPYn91F1Ncbb7SgZY')
    zone_info = cf.zones.get(params={'name':zone_name})
    zone_id = zone_info[0]['id']

    def getCNAMErecords(self):
        dns_records = self.cf.zones.dns_records.get(self.zone_id,params={'type':"CNAME"})
        return dns_records
    
    def argoTunnelList(self,cname_records):
        argotunnel_list = []
        dns_records = cname_records;
        for dns_record in dns_records:
            x=re.search(".*cfargotunnel\.com",dns_record['content'])
            if(x):
                print("\n ",dns_record['content'], "\t", dns_record['name'])
                argotunnel_list.append(dns_record['name'])
        return argotunnel_list
        



