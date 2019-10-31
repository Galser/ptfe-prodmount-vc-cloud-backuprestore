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

## Deploy infrastructure

## Install TFE

## Make snapshot

## Kill TFE

## Restore TFE


# TODO
- [ ] create (reuse) code for infrastructure
- [ ] install TFE in Prod mode
- [ ] update README
- [ ] make snapshot
- [ ] kill TFE
- [ ] restore TFE from snapshot
- [ ] update README for restore part


# DONE
- [x] define objectives 


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


