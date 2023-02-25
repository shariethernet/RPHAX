## RPHAX Connect

RPHAX connect is a quick way to expose your FPGA to the internet for Public/Classroom/Personal use without having to deal with complicated network configurations.
 
`rphaxFPGAConnect.py` does the following 

- Download and Install Cloudflared Tunnel Daemon
- Authorize cloudflared with your cloudflare account and domain
- Create Cloudflare tunnel
- Generate Cloudflare configuration files and set up tunnel
- Install cloudflare as a system service

## Prerequisites
- [Cloudflare] (https://dash.cloudflare.com/)  account
- Your own domain with Cloudflare as your DNS Provider
    - If you don't have your own domain you can get a free domain from https://freenom.com . Change the DNS Server to cloudflare
- Xilinx Zynq FPGA running Pynq v2.5 and above (may work on older version)

## Running rphax connect
After cloning the repo or copying this sub-directory to pynq, Run the following commands from the PYNQ Terminal
- Rename `connectionparams_template.py`
    - `mv connectionparams_template.py connectionparams.py`
- Enter your Cloudflare `API_KEY` and `DOMAIN` in `connectionparams.py`
- `pip install -r requirements.txt`
- `cd rphax_connect`
- `python rphaxFPGAConnect.py -cn <Optional: sub-domain name for your board\> <your pynq hostname eg: 192.168.0.121:9090 or pynq1:9090 etc.,>
- Use `python rphaxFPGAConnect.py -h` to view additional options

## Disclaimer

This script performs critical changes to your cloudflare DNS Records. Do not run this on domains holding something important, unless you know what you are doing. 

The developer is not responsible for any loss/distruption of your resources 