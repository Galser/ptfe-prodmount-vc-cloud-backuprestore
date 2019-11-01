# ptfe-prodmount-vc-cloud-backuprestore
Install Prod Mount disk version with Valid Certificate - snapshot / backup / restore / use snapshot

Based on two repositories: https://github.com/Galser/ptfe-prodmount-vc-cloud and https://github.com/Galser/ptfe-demo-vagrant-vc-backuprestore

# Purpose

This repo contains all the code and instructions on how to install PTFE (Prod) version with a Valid Certificate in a cloud environment in mounted disk mode. With later making/restoration of its state from a snapshot. 

# Requirements

This repository assumes general knowledge about Terraform, if not, please get yourself accustomed first by going through [getting started guide for Terraform](https://learn.hashicorp.com/terraform?track=getting-started#getting-started). We also going to use AWS EC2 as our infrastructure provider, DNS service of CloudFlare and SSL Certificates from LetsEncrypt.

To learn more about the mentioned above tools and technologies -  please check section [Technologies near the end of the README](#technologies)


# How-to

## Prepare authentication credentials
- Beforehand, you will need to have SSH RSA key available at the default location :
  - `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`
  > This key is going to be used later to connect to the instance where TFE will be running.
  
- Prepare AWS auth credentials (You can create security credentials on [this page](https://console.aws.amazon.com/iam/home?#security_credential).) To export them via env variables, execute in the command line :
    ```
    export AWS_ACCESS_KEY_ID="YOUR ACCESS KEY"
    export AWS_SECRET_ACCESS_KEY="YOUR SECRET KEY"
    ```
- Prepare CloudFlare authentication for your domain DNS management - register and export as env variables API keys and tokens. Follow instructions from CloudFlare here: https://support.cloudflare.com/hc/en-us/articles/200167836-Managing-API-Tokens-and-Keys
    - Export generated token and API keys :
    ```bash
    export CLOUDFLARE_API_KEY=YOUR_API_KEY_HERE
    export CLOUDFLARE_API_TOKEN=YOUR_TOKEN_HERE
    export CLOUDFLARE_ZONE_API_TOKEN=YOUR_TOKEN_HERE
    export CLOUDFLARE_DNS_API_TOKEN=YOUR_TOKEN_HERE
    ```

## Deploy infrastructure
- Clone this repo (*use the tools of your choice*)
- Open the folder with cloned repo
- Define your domain name in [variables.tf](variables.tf), edit on 2-nd line, following block : 
  ```terraform
  variable "site_domain" {
    default = "guselietov.com"
  }
  ```
- From inside folder with cloned repo init Terraform by executing : 
```
terraform init
```
Example output can be found here : [terraform_init.md](terraform_init.md)

- Now let's spin up everything, by executing :
```
terraform apply -auto-approve
```
Example output can be found here : [terraform_apply.md](terraform_apply.md)

Execution will take some time, and at the very end of the output you should see something similar to : 
```bash
Outputs:

backend_fqdn = ptfe-pm-2_backend.guselietov.com
cert_url = https://acme-v02.api.letsencrypt.org/acme/cert/03affc5ce49a164a80ca47ac6041c97240a2
full_site_name = ptfe-pm-2.guselietov.com
loadbalancer_fqdn = ag-clb-ptfe-pm-2-750426138.eu-central-1.elb.amazonaws.com
public_dns = ec2-52-59-210-55.eu-central-1.compute.amazonaws.com
public_ip = 52.59.210.55
```
- Please note that the successful `apply` should create 3 files with SSL certificate information in local folder : 
```bash
# ls -l site*
-rwxr-xr-x  1 andrii  staff  1935 Oct 31 15:17 site_ssl_cert.pem
-rwxr-xr-x  1 andrii  staff  3585 Oct 31 15:17 site_ssl_cert_bundle.pem
-rwxr-xr-x  1 andrii  staff  1679 Oct 31 15:13 site_ssl_private_key.pem
```
We are going to use them later. 


## Install TFE

## Terminal-based portion of TFE installation
- Connect to VM : 
```
ssh ubuntu@52.59.210.55
``` 
> Note : Use the `public_ip` or `backend_fqdn` from the previous step

- Start the PTFE install: 
```curl https://install.terraform.io/ptfe/stable | sudo bash```
    - use Public IP-address from previous steps ( `18.184.220.142` in the example ) for the service question. You can just press [Enter],
    - Reply `N` to proxy question. Again - you can just press [Enter]
    Output example : 
  ```bash
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                  Dload  Upload   Total   Spent    Left  Speed
  100  118k  100  118k    0     0  48967      0  0:00:02  0:00:02 --:--:-- 48967
  Determining local address
  The installer will use network interface 'ens5' (with IP address '172.31.2.88')
  Determining service address
  The installer will use service address '18.184.220.142' (discovered from EC2 metadata service)
  The installer has automatically detected the service IP address of this machine as 18.184.220.142.
  Do you want to:
  [0] default: use 18.184.220.142
  [1] enter new address
  Enter desired number (0-1): 0
  Does this machine require a proxy to access the Internet? (y/N) n
  Installing docker version 18.09.2 from https://get.replicated.com/docker-install.sh
  # Executing docker install script, commit: UNKNOWN 
  ...
  + sh -c apt-get update -qq >/dev/null
  + sh -c apt-get install -y -qq apt-transport-https ca-certificates curl >/dev/null...
  Operator installation successful

  To continue the installation, visit the following URL in your browser:

    http://52.59.210.55:8800

  ```

## 

## Make snapshot

## Kill TFE

## Restore TFE


# TODO
- [ ] install TFE in Prod mode
- [ ] update README
- [ ] make snapshot
- [ ] kill TFE
- [ ] restore TFE from snapshot
- [ ] update README for restore part


# DONE
- [x] define objectives 
- [x] create (reuse) code for infrastructure


# Run logs

- terraform apply  : [terraform_apply.md](terraform_apply.md)
- TFE destruction (full disaster imitation) : [tfe_destruction.md](tfe_destruction.md)
- terraform destroy : [terraform_destroy.md](terraform_destroy.md)



# Technologies

1. **To download the content of this repository** you will need **git command-line tools**(recommended) or **Git UI Client**. To install official command-line Git tools please [find here instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) for various operating systems. 

2. **For managing infrastructure** we using Terraform - open-source infrastructure as a code software tool created by HashiCorp. It enables users to define and provision a data center infrastructure using a high-level configuration language known as Hashicorp Configuration Language, or optionally JSON. More you encouraged to [learn here](https://www.terraform.io).
    - Specifically, we going to use Terraform for creating infrastructure, and install Terraform Enterprise. TFE Overview: can be found here: https://www.terraform.io/docs/enterprise/index.html
    - Pre-Install checklist: https://www.terraform.io/docs/enterprise/before-installing/index.html

3. **This project for virtualization** uses **AWS EC2** - Amazon Elastic Compute Cloud (Amazon EC2 for short) - a web service that provides secure, resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers. You can read in details and create a free try-out account if you don't have one here :  [Amazon EC2 main page](https://aws.amazon.com/ec2/) 

4. **Cloudflare**, - is an American web infrastructure and website security company, providing content delivery network services, DDoS mitigation, Internet security, and distributed domain name server services. More information can be found here: https://www.cloudflare.com/ 

5. **Let'sEncrypt** - Let's Encrypt is a non-profit certificate authority run by Internet Security Research Group that provides X.509 certificates for Transport Layer Security encryption at no charge. The certificate is valid for 90 days, during which renewal can take place at any time. You can find out more on their [official page](https://letsencrypt.org/)




