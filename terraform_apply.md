# Example of `terraform apply -auto-approve` output
```bash

 ~/../ptfe-prodmount-vc-cloud  ● terraform apply -auto-approve
module.dns_cloudflare.data.cloudflare_zones.site_zone: Refreshing state...
module.sslcert_letsencrypt.tls_private_key.private_key: Creating...
module.sslcert_letsencrypt.tls_private_key.private_key: Creation complete after 1s [id=3757347b5e8187cbe1bbbdfcc678640c3e81ff77]
module.sslcert_letsencrypt.acme_registration.reg: Creating...
module.sslcert_letsencrypt.acme_registration.reg: Creation complete after 2s [id=https://acme-v02.api.letsencrypt.org/acme/acct/70737985]
module.sslcert_letsencrypt.acme_certificate.certificate: Creating...
aws_key_pair.ptfe-key: Creating...
module.vpc_aws.aws_vpc.ag_tfe: Creating...
aws_key_pair.ptfe-key: Creation complete after 0s [id=ptfe-key]
module.vpc_aws.aws_vpc.ag_tfe: Creation complete after 3s [id=vpc-0b0893cf9e7652ad1]
module.vpc_aws.aws_route_table.ag_tfe_route_table: Creating...
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Creating...
module.vpc_aws.aws_subnet.ag_tfe_Subnet: Creating...
module.vpc_aws.aws_security_group.ag_tfe_Security_Group_elb: Creating...
module.vpc_aws.aws_security_group.ag_tfe_Security_Group: Creating...
module.vpc_aws.aws_route_table.ag_tfe_route_table: Creation complete after 2s [id=rtb-08c99168782843c43]
module.vpc_aws.aws_subnet.ag_tfe_Subnet: Creation complete after 2s [id=subnet-03be03e8ffdef3931]
module.vpc_aws.aws_route_table_association.ag_tfe_association: Creating...
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Creation complete after 2s [id=igw-0d6ef8f6403f88b1e]
module.vpc_aws.aws_route.ag_tfe_internet_access: Creating...
module.vpc_aws.aws_route_table_association.ag_tfe_association: Creation complete after 0s [id=rtbassoc-0e783a6fc2933d0cb]
module.vpc_aws.aws_route.ag_tfe_internet_access: Creation complete after 1s [id=r-rtb-08c99168782843c431080289494]
module.vpc_aws.aws_security_group.ag_tfe_Security_Group_elb: Creation complete after 3s [id=sg-0b5ba870941260172]
module.vpc_aws.aws_security_group.ag_tfe_Security_Group: Creation complete after 3s [id=sg-07d2d0148a3e6ae7f]
aws_instance.ptfe: Creating...
module.sslcert_letsencrypt.acme_certificate.certificate: Still creating... [10s elapsed]
module.sslcert_letsencrypt.acme_certificate.certificate: Creation complete after 11s [id=https://acme-v02.api.letsencrypt.org/acme/cert/033200a6a7960a7651eff62015b791de9eba]
module.sslcert_letsencrypt.local_file.ssl_cert_bundle_file: Creating...
module.sslcert_letsencrypt.local_file.ssl_cert_file: Creating...
module.sslcert_letsencrypt.local_file.ssl_private_key_file: Creating...
module.sslcert_letsencrypt.local_file.ssl_cert_bundle_file: Creation complete after 0s [id=735d6a82899b8d463f2259627749edee667d3d35]
module.sslcert_letsencrypt.local_file.ssl_cert_file: Creation complete after 0s [id=99d7beb7cc280ac8edbd141de3f630da00dbc2d8]
module.sslcert_letsencrypt.local_file.ssl_private_key_file: Creation complete after 0s [id=8e3e283fcbb0d3c0e1cfdc47826b2c59233b00f4]
aws_instance.ptfe: Still creating... [10s elapsed]
aws_instance.ptfe: Provisioning with 'remote-exec'...
aws_instance.ptfe (remote-exec): Connecting to remote host via SSH...
aws_instance.ptfe (remote-exec):   Host: 52.29.66.54
aws_instance.ptfe (remote-exec):   User: ubuntu
aws_instance.ptfe (remote-exec):   Password: false
aws_instance.ptfe (remote-exec):   Private key: true
aws_instance.ptfe (remote-exec):   Certificate: false
aws_instance.ptfe (remote-exec):   SSH Agent: true
aws_instance.ptfe (remote-exec):   Checking Host Key: false
aws_instance.ptfe: Still creating... [20s elapsed]
aws_instance.ptfe (remote-exec): Connecting to remote host via SSH...
aws_instance.ptfe (remote-exec):   Host: 52.29.66.54
aws_instance.ptfe (remote-exec):   User: ubuntu
aws_instance.ptfe (remote-exec):   Password: false
aws_instance.ptfe (remote-exec):   Private key: true
aws_instance.ptfe (remote-exec):   Certificate: false
aws_instance.ptfe (remote-exec):   SSH Agent: true
aws_instance.ptfe (remote-exec):   Checking Host Key: false
aws_instance.ptfe: Still creating... [30s elapsed]
aws_instance.ptfe (remote-exec): Connecting to remote host via SSH...
aws_instance.ptfe (remote-exec):   Host: 52.29.66.54
aws_instance.ptfe (remote-exec):   User: ubuntu
aws_instance.ptfe (remote-exec):   Password: false
aws_instance.ptfe (remote-exec):   Private key: true
aws_instance.ptfe (remote-exec):   Certificate: false
aws_instance.ptfe (remote-exec):   SSH Agent: true
aws_instance.ptfe (remote-exec):   Checking Host Key: false
aws_instance.ptfe (remote-exec): Connected!
aws_instance.ptfe: Still creating... [40s elapsed]
aws_instance.ptfe (remote-exec): 36 packages can be upgraded. Run 'apt list --upgradable' to see them.
aws_instance.ptfe (remote-exec): curl is already the newest version (7.58.0-2ubuntu3.8).
aws_instance.ptfe (remote-exec): curl set to manually installed.
aws_instance.ptfe (remote-exec): wget is already the newest version (1.19.4-1ubuntu2.2).
aws_instance.ptfe (remote-exec): wget set to manually installed.
aws_instance.ptfe (remote-exec): 0 upgraded, 0 newly installed, 0 to remove and 36 not upgraded.
aws_instance.ptfe (remote-exec): mkfs.xfs: /dev/nvme0n1 appears to contain a partition table (dos).
aws_instance.ptfe (remote-exec): mkfs.xfs: Use the -f option to force overwrite.
aws_instance.ptfe: Creation complete after 44s [id=i-0cbef3bbefd456d53]
module.dns_cloudflare.cloudflare_record.site_backend: Creating...
aws_elb.ptfe_lb: Creating...
module.dns_cloudflare.cloudflare_record.site_backend: Creation complete after 0s [id=70014aed0b54f6fd3c4b563d10a8888c]
aws_elb.ptfe_lb: Creation complete after 4s [id=ag-clb-ptfe-pm-2]
module.dns_cloudflare.cloudflare_record.site_lb: Creating...
module.dns_cloudflare.cloudflare_record.site_lb: Creation complete after 0s [id=2781459fb45b7644ca3b5209308db8a5]

Apply complete! Resources: 19 added, 0 changed, 0 destroyed.

Outputs:

backend_fqdn = ptfe-pm-2_backend.guselietov.com
cert_url = https://acme-v02.api.letsencrypt.org/acme/cert/033200a6a7960a7651eff62015b791de9eba
full_site_name = ptfe-pm-2.guselietov.com
loadbalancer_fqdn = ag-clb-ptfe-pm-2-1697935664.eu-central-1.elb.amazonaws.com
public_dns = ec2-52-29-66-54.eu-central-1.compute.amazonaws.com
public_ip = 52.29.66.54
```