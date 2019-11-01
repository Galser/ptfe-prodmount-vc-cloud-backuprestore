# Example of `terraform destroy` output
```bash
terraform destroy
module.sslcert_letsencrypt.tls_private_key.private_key: Refreshing state... [id=61ae8291217c9d8b85d7ab20e54ed586482a9659]
module.dns_cloudflare.data.cloudflare_zones.site_zone: Refreshing state...
module.sslcert_letsencrypt.acme_registration.reg: Refreshing state... [id=https://acme-v02.api.letsencrypt.org/acme/acct/70805966]
module.sslcert_letsencrypt.acme_certificate.certificate: Refreshing state... [id=https://acme-v02.api.letsencrypt.org/acme/cert/03cdaf715f30edb4dfb05ee7ec533f742b37]
module.sslcert_letsencrypt.local_file.ssl_private_key_file: Refreshing state... [id=181603f76964b32315b8b4846de5add8d9d470b0]
module.sslcert_letsencrypt.local_file.ssl_cert_file: Refreshing state... [id=c301ceb81016c76cec4d20ac9dad6a069d699968]
module.sslcert_letsencrypt.local_file.ssl_cert_bundle_file: Refreshing state... [id=b3f60f39c2d06d30d285f7c1edf7bafde71d614d]
aws_key_pair.ptfe-key: Refreshing state... [id=ptfe-key]
module.vpc_aws.aws_vpc.ag_tfe: Refreshing state... [id=vpc-0d3045d653b28dbff]
aws_ebs_volume.tfe_snapshot: Refreshing state... [id=vol-04eed28d1fe2ae33e]
aws_ebs_volume.tfe_data: Refreshing state... [id=vol-0c7ea044b2b7c23aa]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Refreshing state... [id=igw-01cdb4cb7d24e1a5a]
module.vpc_aws.aws_subnet.ag_tfe_Subnet: Refreshing state... [id=subnet-080c67631678950ca]
module.vpc_aws.aws_route_table.ag_tfe_route_table: Refreshing state... [id=rtb-004865bc19d1cdeeb]
module.vpc_aws.aws_security_group.ag_tfe_Security_Group_elb: Refreshing state... [id=sg-01a678137f83ab887]
module.vpc_aws.aws_security_group.ag_tfe_Security_Group: Refreshing state... [id=sg-0b3d22e65590fca52]
module.vpc_aws.aws_route_table_association.ag_tfe_association: Refreshing state... [id=rtbassoc-0385be22bc3f45581]
module.vpc_aws.aws_route.ag_tfe_internet_access: Refreshing state... [id=r-rtb-004865bc19d1cdeeb1080289494]
aws_instance.ptfe: Refreshing state... [id=i-0ab05015235500fe9]
aws_volume_attachment.tfe_snapshot: Refreshing state... [id=vai-3536475254]
null_resource.ebs-provision: Refreshing state... [id=6669482392174652310]
aws_volume_attachment.tfe_data: Refreshing state... [id=vai-2904214743]
module.dns_cloudflare.cloudflare_record.site_backend: Refreshing state... [id=313d3fb276b6ac58a803409ef4940a41]
aws_elb.ptfe_lb: Refreshing state... [id=ag-clb-ptfe-pm-2]
module.dns_cloudflare.cloudflare_record.site_lb: Refreshing state... [id=528c3c7d1a6f2faf2040a6c9641380de]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_ebs_volume.tfe_data will be destroyed
  - resource "aws_ebs_volume" "tfe_data" {
      - arn               = "arn:aws:ec2:eu-central-1:729476260648:volume/vol-0c7ea044b2b7c23aa" -> null
      - availability_zone = "eu-central-1a" -> null
      - encrypted         = false -> null
      - id                = "vol-0c7ea044b2b7c23aa" -> null
      - iops              = 123 -> null
      - size              = 41 -> null
      - tags              = {} -> null
      - type              = "gp2" -> null
    }

  # aws_ebs_volume.tfe_snapshot will be destroyed
  - resource "aws_ebs_volume" "tfe_snapshot" {
      - arn               = "arn:aws:ec2:eu-central-1:729476260648:volume/vol-04eed28d1fe2ae33e" -> null
      - availability_zone = "eu-central-1a" -> null
      - encrypted         = false -> null
      - id                = "vol-04eed28d1fe2ae33e" -> null
      - iops              = 300 -> null
      - size              = 100 -> null
      - tags              = {} -> null
      - type              = "gp2" -> null
    }

  # aws_elb.ptfe_lb will be destroyed
  - resource "aws_elb" "ptfe_lb" {
      - arn                         = "arn:aws:elasticloadbalancing:eu-central-1:729476260648:loadbalancer/ag-clb-ptfe-pm-2" -> null
      - availability_zones          = [
          - "eu-central-1a",
        ] -> null
      - connection_draining         = true -> null
      - connection_draining_timeout = 400 -> null
      - cross_zone_load_balancing   = true -> null
      - dns_name                    = "ag-clb-ptfe-pm-2-248558019.eu-central-1.elb.amazonaws.com" -> null
      - id                          = "ag-clb-ptfe-pm-2" -> null
      - idle_timeout                = 400 -> null
      - instances                   = [
          - "i-0ab05015235500fe9",
        ] -> null
      - internal                    = false -> null
      - name                        = "ag-clb-ptfe-pm-2" -> null
      - security_groups             = [
          - "sg-01a678137f83ab887",
        ] -> null
      - source_security_group       = "729476260648/ag_ptfe_pm-sg-elb" -> null
      - source_security_group_id    = "sg-01a678137f83ab887" -> null
      - subnets                     = [
          - "subnet-080c67631678950ca",
        ] -> null
      - tags                        = {
          - "Name"      = "ptfe-prodmount-2-andrii"
          - "andriitag" = "true"
          - "learntag"  = "200tf"
        } -> null
      - zone_id                     = "Z215JYRZR1TBD5" -> null

      - health_check {
          - healthy_threshold   = 3 -> null
          - interval            = 30 -> null
          - target              = "TCP:8800" -> null
          - timeout             = 10 -> null
          - unhealthy_threshold = 10 -> null
        }

      - listener {
          - instance_port     = 443 -> null
          - instance_protocol = "tcp" -> null
          - lb_port           = 443 -> null
          - lb_protocol       = "tcp" -> null
        }
      - listener {
          - instance_port     = 8800 -> null
          - instance_protocol = "tcp" -> null
          - lb_port           = 8800 -> null
          - lb_protocol       = "tcp" -> null
        }
    }

  # aws_instance.ptfe will be destroyed
  - resource "aws_instance" "ptfe" {
      - ami                          = "ami-08a162fe1419adb2a" -> null
      - arn                          = "arn:aws:ec2:eu-central-1:729476260648:instance/i-0ab05015235500fe9" -> null
      - associate_public_ip_address  = true -> null
      - availability_zone            = "eu-central-1a" -> null
      - cpu_core_count               = 1 -> null
      - cpu_threads_per_core         = 2 -> null
      - disable_api_termination      = false -> null
      - ebs_optimized                = false -> null
      - get_password_data            = false -> null
      - id                           = "i-0ab05015235500fe9" -> null
      - instance_state               = "running" -> null
      - instance_type                = "m5.large" -> null
      - ipv6_address_count           = 0 -> null
      - ipv6_addresses               = [] -> null
      - key_name                     = "ptfe-key" -> null
      - monitoring                   = false -> null
      - primary_network_interface_id = "eni-05c0b1d78489e20a5" -> null
      - private_dns                  = "ip-10-0-1-155.eu-central-1.compute.internal" -> null
      - private_ip                   = "10.0.1.155" -> null
      - public_dns                   = "ec2-18-196-156-123.eu-central-1.compute.amazonaws.com" -> null
      - public_ip                    = "18.196.156.123" -> null
      - security_groups              = [] -> null
      - source_dest_check            = true -> null
      - subnet_id                    = "subnet-080c67631678950ca" -> null
      - tags                         = {
          - "Name"      = "ptfe-prodmount-2-andrii"
          - "andriitag" = "true"
          - "learntag"  = "200tf"
        } -> null
      - tenancy                      = "default" -> null
      - volume_tags                  = {
          - "Name"      = "ptfe-prodmount-2-andrii"
          - "andriitag" = "true"
        } -> null
      - vpc_security_group_ids       = [
          - "sg-0b3d22e65590fca52",
        ] -> null

      - ebs_block_device {
          - delete_on_termination = false -> null
          - device_name           = "/dev/sdf" -> null
          - encrypted             = false -> null
          - iops                  = 123 -> null
          - volume_id             = "vol-0c7ea044b2b7c23aa" -> null
          - volume_size           = 41 -> null
          - volume_type           = "gp2" -> null
        }
      - ebs_block_device {
          - delete_on_termination = false -> null
          - device_name           = "/dev/sdg" -> null
          - encrypted             = false -> null
          - iops                  = 300 -> null
          - volume_id             = "vol-04eed28d1fe2ae33e" -> null
          - volume_size           = 100 -> null
          - volume_type           = "gp2" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - encrypted             = false -> null
          - iops                  = 120 -> null
          - volume_id             = "vol-02c5b3a17266e9e40" -> null
          - volume_size           = 40 -> null
          - volume_type           = "gp2" -> null
        }
    }

  # aws_key_pair.ptfe-key will be destroyed
  - resource "aws_key_pair" "ptfe-key" {
      - fingerprint = "01:ca:46:0b:ea:ba:4e:28:0e:c9:b4:9e:2d:f3:29:66" -> null
      - id          = "ptfe-key" -> null
      - key_name    = "ptfe-key" -> null
      - public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC704xhVAxg9Bhq0jIbABWVjKl2DW7apvfFj3UtvActT9a9w1Xt5Fa2jEFuzMXceFtpDjgq5j8E8vsrICu8Wpeqwuo2SR2aAjEjBDfJzOM3kmF9wuWdpacDhVm1luPJiqqM4wLAPufht5vhdlqD8QtW/q84MMHbbkXNjdvgqsIcvDWcCRLQDa1Du3ElF9V+/n182ihIDfQCUtQS0zc9lIcUemZMSLRhxAWA9BZYCu8wnUuLBE/fv8apC0NxOayklSBEj7Pk/HxJnYxTeskqGs5MkzHydObPZSnAtX4Hfe1KlmsAVwt6Sj2bG2AYpt9G0jF7Oq9sYQ6nBTMAxENIsmhB andrii@guselietovs-mbp.home" -> null
    }

  # aws_volume_attachment.tfe_data will be destroyed
  - resource "aws_volume_attachment" "tfe_data" {
      - device_name = "/dev/sdf" -> null
      - id          = "vai-2904214743" -> null
      - instance_id = "i-0ab05015235500fe9" -> null
      - volume_id   = "vol-0c7ea044b2b7c23aa" -> null
    }

  # aws_volume_attachment.tfe_snapshot will be destroyed
  - resource "aws_volume_attachment" "tfe_snapshot" {
      - device_name = "/dev/sdg" -> null
      - id          = "vai-3536475254" -> null
      - instance_id = "i-0ab05015235500fe9" -> null
      - volume_id   = "vol-04eed28d1fe2ae33e" -> null
    }

  # null_resource.ebs-provision will be destroyed
  - resource "null_resource" "ebs-provision" {
      - id       = "6669482392174652310" -> null
      - triggers = {
          - "esb_volumes_ids" = "vol-0c7ea044b2b7c23aa, vol-04eed28d1fe2ae33e, i-0ab05015235500fe9"
        } -> null
    }

  # module.dns_cloudflare.cloudflare_record.site_backend will be destroyed
  - resource "cloudflare_record" "site_backend" {
      - created_on  = "2019-11-01T11:03:52.385242Z" -> null
      - data        = {} -> null
      - hostname    = "ptfe-pm-2_backend.guselietov.com" -> null
      - id          = "313d3fb276b6ac58a803409ef4940a41" -> null
      - metadata    = {
          - "auto_added"             = "false"
          - "managed_by_apps"        = "false"
          - "managed_by_argo_tunnel" = "false"
        } -> null
      - modified_on = "2019-11-01T11:03:52.385242Z" -> null
      - name        = "ptfe-pm-2_backend" -> null
      - priority    = 0 -> null
      - proxiable   = true -> null
      - proxied     = false -> null
      - ttl         = 600 -> null
      - type        = "A" -> null
      - value       = "18.196.156.123" -> null
      - zone_id     = "2032750a75777e59b3bf6c73333ee2b0" -> null
    }

  # module.dns_cloudflare.cloudflare_record.site_lb will be destroyed
  - resource "cloudflare_record" "site_lb" {
      - created_on  = "2019-11-01T10:44:03.992663Z" -> null
      - data        = {} -> null
      - hostname    = "ptfe-pm-2.guselietov.com" -> null
      - id          = "528c3c7d1a6f2faf2040a6c9641380de" -> null
      - metadata    = {
          - "auto_added"             = "false"
          - "managed_by_apps"        = "false"
          - "managed_by_argo_tunnel" = "false"
        } -> null
      - modified_on = "2019-11-01T10:44:03.992663Z" -> null
      - name        = "ptfe-pm-2" -> null
      - priority    = 0 -> null
      - proxiable   = true -> null
      - proxied     = false -> null
      - ttl         = 600 -> null
      - type        = "CNAME" -> null
      - value       = "ag-clb-ptfe-pm-2-248558019.eu-central-1.elb.amazonaws.com" -> null
      - zone_id     = "2032750a75777e59b3bf6c73333ee2b0" -> null
    }

  # module.sslcert_letsencrypt.acme_certificate.certificate will be destroyed
  - resource "acme_certificate" "certificate" {
      - account_key_pem    = (sensitive value)
      - certificate_domain = "ptfe-pm-2.guselietov.com" -> null
      - certificate_p12    = (sensitive value)
      - certificate_pem    = "-----BEGIN CERTIFICATE-----\nMIIFaTCCBFGgAwIBAgISA82vcV8w7bTfsF7n7FM/dCs3MA0GCSqGSIb3DQEBCwUA\nMEoxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MSMwIQYDVQQD\nExpMZXQncyBFbmNyeXB0IEF1dGhvcml0eSBYMzAeFw0xOTExMDEwOTQzMTJaFw0y\nMDAxMzAwOTQzMTJaMCMxITAfBgNVBAMTGHB0ZmUtcG0tMi5ndXNlbGlldG92LmNv\nbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJuz3sVQ+NwWQaVwubT6\nHmKOTmhJlKR6/mI7xN/S4DoCAC67z0v5Zv1I7NCO9iG5+FcFhAyA9/1fNPP/mOn6\nMHbgiacWuh4LP9uPFyLeGn5oxC/hBiiRCE5IadulxCSVkdyjebAQYyheG8U6xuk5\nmeWCHCtBcGkQ1aceToZmbgA2hEed4D5rH8cHR8K1rYLCb4iOZNykYSusElItzy7b\nh1knHkmjQ+OlGVB44J/jn9zzqe4llO5kCzdHfDTIHrcrew/bTaUuxS3Iq9ymXxFL\n343OdzikIGButAvCMIbAiqwr0jHqcKyP+rnbZrRRPxcGTR8PEwDVO8yDLkbdLTH1\nIPUCAwEAAaOCAm4wggJqMA4GA1UdDwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEF\nBQcDAQYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUpZmC1CXbOc3b\nbl6Ev66jcxcQ2jwwHwYDVR0jBBgwFoAUqEpqYwR93brm0Tm3pkVl7/Oo7KEwbwYI\nKwYBBQUHAQEEYzBhMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcC5pbnQteDMubGV0\nc2VuY3J5cHQub3JnMC8GCCsGAQUFBzAChiNodHRwOi8vY2VydC5pbnQteDMubGV0\nc2VuY3J5cHQub3JnLzAjBgNVHREEHDAaghhwdGZlLXBtLTIuZ3VzZWxpZXRvdi5j\nb20wTAYDVR0gBEUwQzAIBgZngQwBAgEwNwYLKwYBBAGC3xMBAQEwKDAmBggrBgEF\nBQcCARYaaHR0cDovL2Nwcy5sZXRzZW5jcnlwdC5vcmcwggEFBgorBgEEAdZ5AgQC\nBIH2BIHzAPEAdwBep3P531bA57U2SH3QSeAyepGaDIShEhKEGHWWgXFFWAAAAW4m\nj9qWAAAEAwBIMEYCIQDG+FadLtaO6ONG2PJM1B9xmz6r1iuU7zglXatRJojE2wIh\nAIY7zN5mdgbKT4JP2QYPgRzMUuuVPkIUADA27LfuoN4dAHYAB7dcG+V9aP/xsMYd\nIxXHuuZXfFeUt2ruvGE6GmnTohwAAAFuJo/auwAABAMARzBFAiBnwWoF1Uw7G3DP\nou5khQh08Pp1TLp5SCsg7N2XRltGQQIhAP/IZCE901Zk85MR7D7/r8uPVDvbDXUk\nKZlPnjraWcICMA0GCSqGSIb3DQEBCwUAA4IBAQBRDVSMikFBJbwxhEzFP1hohbiJ\nOGrsigK9mw3BJfS+3x6WF7sfdnjIwCsOcMc8rHwSCxy1NhQ9X+GkRa/wwYB+/eeC\ndfMkH2rV9spsasl65+lw1oWxqJDF3Ow4Hm8Jt1WAtNTzLMap2hjuM/Y+fGtPTbA8\n6dG08f281qPvc9VyqLt1lQejq6n0tbUu1NSCnlDWBmEEjAHGrGvhLCv1SaJcdz+Q\nzPOohBnlmqQYgQb8d0VGwKQxbT7wEhj6cVYTWGMSTHJ233IOqW8strarLX394hIE\nu1Xoi5y1J/+8vSd+lCF3Pz+18rvKNvKwbcQqBi82CgAOTT4oP4+XjkAF48CS\n-----END CERTIFICATE-----\n" -> null
      - certificate_url    = "https://acme-v02.api.letsencrypt.org/acme/cert/03cdaf715f30edb4dfb05ee7ec533f742b37" -> null
      - common_name        = "ptfe-pm-2.guselietov.com" -> null
      - id                 = "https://acme-v02.api.letsencrypt.org/acme/cert/03cdaf715f30edb4dfb05ee7ec533f742b37" -> null
      - issuer_pem         = "-----BEGIN CERTIFICATE-----\nMIIEkjCCA3qgAwIBAgIQCgFBQgAAAVOFc2oLheynCDANBgkqhkiG9w0BAQsFADA/\nMSQwIgYDVQQKExtEaWdpdGFsIFNpZ25hdHVyZSBUcnVzdCBDby4xFzAVBgNVBAMT\nDkRTVCBSb290IENBIFgzMB4XDTE2MDMxNzE2NDA0NloXDTIxMDMxNzE2NDA0Nlow\nSjELMAkGA1UEBhMCVVMxFjAUBgNVBAoTDUxldCdzIEVuY3J5cHQxIzAhBgNVBAMT\nGkxldCdzIEVuY3J5cHQgQXV0aG9yaXR5IFgzMIIBIjANBgkqhkiG9w0BAQEFAAOC\nAQ8AMIIBCgKCAQEAnNMM8FrlLke3cl03g7NoYzDq1zUmGSXhvb418XCSL7e4S0EF\nq6meNQhY7LEqxGiHC6PjdeTm86dicbp5gWAf15Gan/PQeGdxyGkOlZHP/uaZ6WA8\nSMx+yk13EiSdRxta67nsHjcAHJyse6cF6s5K671B5TaYucv9bTyWaN8jKkKQDIZ0\nZ8h/pZq4UmEUEz9l6YKHy9v6Dlb2honzhT+Xhq+w3Brvaw2VFn3EK6BlspkENnWA\na6xK8xuQSXgvopZPKiAlKQTGdMDQMc2PMTiVFrqoM7hD8bEfwzB/onkxEz0tNvjj\n/PIzark5McWvxI0NHWQWM6r6hCm21AvA2H3DkwIDAQABo4IBfTCCAXkwEgYDVR0T\nAQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAYYwfwYIKwYBBQUHAQEEczBxMDIG\nCCsGAQUFBzABhiZodHRwOi8vaXNyZy50cnVzdGlkLm9jc3AuaWRlbnRydXN0LmNv\nbTA7BggrBgEFBQcwAoYvaHR0cDovL2FwcHMuaWRlbnRydXN0LmNvbS9yb290cy9k\nc3Ryb290Y2F4My5wN2MwHwYDVR0jBBgwFoAUxKexpHsscfrb4UuQdf/EFWCFiRAw\nVAYDVR0gBE0wSzAIBgZngQwBAgEwPwYLKwYBBAGC3xMBAQEwMDAuBggrBgEFBQcC\nARYiaHR0cDovL2Nwcy5yb290LXgxLmxldHNlbmNyeXB0Lm9yZzA8BgNVHR8ENTAz\nMDGgL6AthitodHRwOi8vY3JsLmlkZW50cnVzdC5jb20vRFNUUk9PVENBWDNDUkwu\nY3JsMB0GA1UdDgQWBBSoSmpjBH3duubRObemRWXv86jsoTANBgkqhkiG9w0BAQsF\nAAOCAQEA3TPXEfNjWDjdGBX7CVW+dla5cEilaUcne8IkCJLxWh9KEik3JHRRHGJo\nuM2VcGfl96S8TihRzZvoroed6ti6WqEBmtzw3Wodatg+VyOeph4EYpr/1wXKtx8/\nwApIvJSwtmVi4MFU5aMqrSDE6ea73Mj2tcMyo5jMd6jmeWUHK8so/joWUoHOUgwu\nX4Po1QYz+3dszkDqMp4fklxBwXRsW10KXzPMTZ+sOPAveyxindmjkW8lGy+QsRlG\nPfZ+G6Z6h7mjem0Y+iWlkYcV4PIWL1iwBi8saCbGS5jN2p8M+X+Q7UNKEkROb3N6\nKOqkqm57TH2H3eDJAkSnh6/DNFu0Qg==\n-----END CERTIFICATE-----\n" -> null
      - key_type           = "2048" -> null
      - min_days_remaining = 30 -> null
      - must_staple        = false -> null
      - private_key_pem    = (sensitive value)

      - dns_challenge {
          - config   = (sensitive value)
          - provider = "cloudflare" -> null
        }
    }

  # module.sslcert_letsencrypt.acme_registration.reg will be destroyed
  - resource "acme_registration" "reg" {
      - account_key_pem  = (sensitive value)
      - email_address    = "andrii@guselietov.com" -> null
      - id               = "https://acme-v02.api.letsencrypt.org/acme/acct/70805966" -> null
      - registration_url = "https://acme-v02.api.letsencrypt.org/acme/acct/70805966" -> null
    }

  # module.sslcert_letsencrypt.local_file.ssl_cert_bundle_file will be destroyed
  - resource "local_file" "ssl_cert_bundle_file" {
      - directory_permission = "0777" -> null
      - file_permission      = "0777" -> null
      - filename             = "./site_ssl_cert_bundle.pem" -> null
      - id                   = "b3f60f39c2d06d30d285f7c1edf7bafde71d614d" -> null
      - sensitive_content    = (sensitive value)
    }

  # module.sslcert_letsencrypt.local_file.ssl_cert_file will be destroyed
  - resource "local_file" "ssl_cert_file" {
      - directory_permission = "0777" -> null
      - file_permission      = "0777" -> null
      - filename             = "./site_ssl_cert.pem" -> null
      - id                   = "c301ceb81016c76cec4d20ac9dad6a069d699968" -> null
      - sensitive_content    = (sensitive value)
    }

  # module.sslcert_letsencrypt.local_file.ssl_private_key_file will be destroyed
  - resource "local_file" "ssl_private_key_file" {
      - directory_permission = "0777" -> null
      - file_permission      = "0777" -> null
      - filename             = "./site_ssl_private_key.pem" -> null
      - id                   = "181603f76964b32315b8b4846de5add8d9d470b0" -> null
      - sensitive_content    = (sensitive value)
    }

  # module.sslcert_letsencrypt.tls_private_key.private_key will be destroyed
  - resource "tls_private_key" "private_key" {
      - algorithm                  = "RSA" -> null
      - ecdsa_curve                = "P224" -> null
      - id                         = "61ae8291217c9d8b85d7ab20e54ed586482a9659" -> null
      - private_key_pem            = (sensitive value)
      - public_key_fingerprint_md5 = "7f:03:55:fa:a1:8d:13:dd:45:a5:78:04:48:89:81:4d" -> null
      - public_key_openssh         = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFhD2ljanQ2oRh4rclIL4xNk3Nf1yPnG5ososx0HPa3rTLcFz7V++3BPVaZ5gklFower+HX76rh5JBqtBa/XCxZEZPNGoPhgr1giflJhnXZz24CtQUtemeelpcW1njnVqHIyuG5msgZd7UYuuDkDohNztx1IxXudeQv8IB5xpzI9LF5V/nRLaA/lOCa91oHvRlrEDSUdCJRDrsw1Hco0uGVcB+AjKpoRQflA74OtkGYQ9YJiYFtVm31yzRi68piAp3GLbB0rO0wPnMCaAdVuiWc5i381n2NiXzHT9GnzrIi5PWSudK443l0r7q80EKa5AwpcYMCKf9TfKi4DMJTV9d\n" -> null
      - public_key_pem             = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxYQ9pY2p0NqEYeK3JSC+\nMTZNzX9cj5xuaLKLMdBz2t60y3Bc+1fvtwT1WmeYJJRaMHq/h1++q4eSQarQWv1w\nsWRGTzRqD4YK9YIn5SYZ12c9uArUFLXpnnpaXFtZ451ahyMrhuZrIGXe1GLrg5A6\nITc7cdSMV7nXkL/CAecacyPSxeVf50S2gP5TgmvdaB70ZaxA0lHQiUQ67MNR3KNL\nhlXAfgIyqaEUH5QO+DrZBmEPWCYmBbVZt9cs0YuvKYgKdxi2wdKztMD5zAmgHVbo\nlnOYt/NZ9jYl8x0/Rp86yIuT1krnSuON5dK+6vNBCmuQMKXGDAin/U3youAzCU1f\nXQIDAQAB\n-----END PUBLIC KEY-----\n" -> null
      - rsa_bits                   = 2048 -> null
    }

  # module.vpc_aws.aws_internet_gateway.ag_tfe_GW will be destroyed
  - resource "aws_internet_gateway" "ag_tfe_GW" {
      - id       = "igw-01cdb4cb7d24e1a5a" -> null
      - owner_id = "729476260648" -> null
      - tags     = {
          - "Name" = "ag_ptfe_pm_internet_gateway"
        } -> null
      - vpc_id   = "vpc-0d3045d653b28dbff" -> null
    }

  # module.vpc_aws.aws_route.ag_tfe_internet_access will be destroyed
  - resource "aws_route" "ag_tfe_internet_access" {
      - destination_cidr_block = "0.0.0.0/0" -> null
      - gateway_id             = "igw-01cdb4cb7d24e1a5a" -> null
      - id                     = "r-rtb-004865bc19d1cdeeb1080289494" -> null
      - origin                 = "CreateRoute" -> null
      - route_table_id         = "rtb-004865bc19d1cdeeb" -> null
      - state                  = "active" -> null
    }

  # module.vpc_aws.aws_route_table.ag_tfe_route_table will be destroyed
  - resource "aws_route_table" "ag_tfe_route_table" {
      - id               = "rtb-004865bc19d1cdeeb" -> null
      - owner_id         = "729476260648" -> null
      - propagating_vgws = [] -> null
      - route            = [
          - {
              - cidr_block                = "0.0.0.0/0"
              - egress_only_gateway_id    = ""
              - gateway_id                = "igw-01cdb4cb7d24e1a5a"
              - instance_id               = ""
              - ipv6_cidr_block           = ""
              - nat_gateway_id            = ""
              - network_interface_id      = ""
              - transit_gateway_id        = ""
              - vpc_peering_connection_id = ""
            },
        ] -> null
      - tags             = {
          - "Name" = "ag_ptfe_pm_route_table"
        } -> null
      - vpc_id           = "vpc-0d3045d653b28dbff" -> null
    }

  # module.vpc_aws.aws_route_table_association.ag_tfe_association will be destroyed
  - resource "aws_route_table_association" "ag_tfe_association" {
      - id             = "rtbassoc-0385be22bc3f45581" -> null
      - route_table_id = "rtb-004865bc19d1cdeeb" -> null
      - subnet_id      = "subnet-080c67631678950ca" -> null
    }

  # module.vpc_aws.aws_security_group.ag_tfe_Security_Group will be destroyed
  - resource "aws_security_group" "ag_tfe_Security_Group" {
      - arn                    = "arn:aws:ec2:eu-central-1:729476260648:security-group/sg-0b3d22e65590fca52" -> null
      - description            = "ag_ptfe_pm Security Group" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 1024
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 65535
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 443
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 443
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 80
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 80
            },
        ] -> null
      - id                     = "sg-0b3d22e65590fca52" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 443
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 443
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 8800
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 8800
            },
        ] -> null
      - name                   = "ag_ptfe_pm Security Group" -> null
      - owner_id               = "729476260648" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Name" = "ag_ptfe_pm_security_group"
        } -> null
      - vpc_id                 = "vpc-0d3045d653b28dbff" -> null
    }

  # module.vpc_aws.aws_security_group.ag_tfe_Security_Group_elb will be destroyed
  - resource "aws_security_group" "ag_tfe_Security_Group_elb" {
      - arn                    = "arn:aws:ec2:eu-central-1:729476260648:security-group/sg-01a678137f83ab887" -> null
      - description            = "ag_ptfe_pm ELB Security Group" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-01a678137f83ab887" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 443
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 443
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 8800
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 8800
            },
        ] -> null
      - name                   = "ag_ptfe_pm-sg-elb" -> null
      - owner_id               = "729476260648" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {} -> null
      - vpc_id                 = "vpc-0d3045d653b28dbff" -> null
    }

  # module.vpc_aws.aws_subnet.ag_tfe_Subnet will be destroyed
  - resource "aws_subnet" "ag_tfe_Subnet" {
      - arn                             = "arn:aws:ec2:eu-central-1:729476260648:subnet/subnet-080c67631678950ca" -> null
      - assign_ipv6_address_on_creation = false -> null
      - availability_zone               = "eu-central-1a" -> null
      - availability_zone_id            = "euc1-az2" -> null
      - cidr_block                      = "10.0.1.0/24" -> null
      - id                              = "subnet-080c67631678950ca" -> null
      - map_public_ip_on_launch         = true -> null
      - owner_id                        = "729476260648" -> null
      - tags                            = {
          - "Name" = "ag_ptfe_pm_subnet"
        } -> null
      - vpc_id                          = "vpc-0d3045d653b28dbff" -> null
    }

  # module.vpc_aws.aws_vpc.ag_tfe will be destroyed
  - resource "aws_vpc" "ag_tfe" {
      - arn                              = "arn:aws:ec2:eu-central-1:729476260648:vpc/vpc-0d3045d653b28dbff" -> null
      - assign_generated_ipv6_cidr_block = false -> null
      - cidr_block                       = "10.0.0.0/16" -> null
      - default_network_acl_id           = "acl-0169e8554af3eb37b" -> null
      - default_route_table_id           = "rtb-06bb32391d0d7a375" -> null
      - default_security_group_id        = "sg-0b33240d7606957a4" -> null
      - dhcp_options_id                  = "dopt-4f934827" -> null
      - enable_dns_hostnames             = true -> null
      - enable_dns_support               = true -> null
      - id                               = "vpc-0d3045d653b28dbff" -> null
      - instance_tenancy                 = "default" -> null
      - main_route_table_id              = "rtb-06bb32391d0d7a375" -> null
      - owner_id                         = "729476260648" -> null
      - tags                             = {
          - "Name" = "ag_ptfe_pm"
        } -> null
    }

Plan: 0 to add, 0 to change, 24 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

null_resource.ebs-provision: Destroying... [id=6669482392174652310]
module.sslcert_letsencrypt.local_file.ssl_cert_file: Destroying... [id=c301ceb81016c76cec4d20ac9dad6a069d699968]
module.sslcert_letsencrypt.local_file.ssl_private_key_file: Destroying... [id=181603f76964b32315b8b4846de5add8d9d470b0]
module.sslcert_letsencrypt.local_file.ssl_cert_bundle_file: Destroying... [id=b3f60f39c2d06d30d285f7c1edf7bafde71d614d]
null_resource.ebs-provision: Destruction complete after 0s
module.sslcert_letsencrypt.local_file.ssl_cert_bundle_file: Destruction complete after 0s
module.sslcert_letsencrypt.local_file.ssl_private_key_file: Destruction complete after 0s
module.sslcert_letsencrypt.local_file.ssl_cert_file: Destruction complete after 0s
module.dns_cloudflare.cloudflare_record.site_lb: Destroying... [id=528c3c7d1a6f2faf2040a6c9641380de]
module.dns_cloudflare.cloudflare_record.site_backend: Destroying... [id=313d3fb276b6ac58a803409ef4940a41]
module.sslcert_letsencrypt.acme_certificate.certificate: Destroying... [id=https://acme-v02.api.letsencrypt.org/acme/cert/03cdaf715f30edb4dfb05ee7ec533f742b37]
module.dns_cloudflare.cloudflare_record.site_backend: Destruction complete after 1s
module.dns_cloudflare.cloudflare_record.site_lb: Destruction complete after 1s
module.sslcert_letsencrypt.acme_certificate.certificate: Destruction complete after 1s
module.sslcert_letsencrypt.acme_registration.reg: Destroying... [id=https://acme-v02.api.letsencrypt.org/acme/acct/70805966]
aws_volume_attachment.tfe_snapshot: Destroying... [id=vai-3536475254]
aws_volume_attachment.tfe_data: Destroying... [id=vai-2904214743]
module.vpc_aws.aws_route_table_association.ag_tfe_association: Destroying... [id=rtbassoc-0385be22bc3f45581]
module.vpc_aws.aws_route.ag_tfe_internet_access: Destroying... [id=r-rtb-004865bc19d1cdeeb1080289494]
aws_elb.ptfe_lb: Destroying... [id=ag-clb-ptfe-pm-2]
module.vpc_aws.aws_route_table_association.ag_tfe_association: Destruction complete after 1s
module.vpc_aws.aws_route.ag_tfe_internet_access: Destruction complete after 1s
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Destroying... [id=igw-01cdb4cb7d24e1a5a]
module.vpc_aws.aws_route_table.ag_tfe_route_table: Destroying... [id=rtb-004865bc19d1cdeeb]
module.sslcert_letsencrypt.acme_registration.reg: Destruction complete after 1s
module.sslcert_letsencrypt.tls_private_key.private_key: Destroying... [id=61ae8291217c9d8b85d7ab20e54ed586482a9659]
module.sslcert_letsencrypt.tls_private_key.private_key: Destruction complete after 0s
module.vpc_aws.aws_route_table.ag_tfe_route_table: Destruction complete after 0s
aws_elb.ptfe_lb: Destruction complete after 1s
module.vpc_aws.aws_security_group.ag_tfe_Security_Group_elb: Destroying... [id=sg-01a678137f83ab887]
aws_volume_attachment.tfe_data: Still destroying... [id=vai-2904214743, 10s elapsed]
aws_volume_attachment.tfe_snapshot: Still destroying... [id=vai-3536475254, 10s elapsed]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Still destroying... [id=igw-01cdb4cb7d24e1a5a, 10s elapsed]
module.vpc_aws.aws_security_group.ag_tfe_Security_Group_elb: Still destroying... [id=sg-01a678137f83ab887, 10s elapsed]
aws_volume_attachment.tfe_data: Destruction complete after 20s
aws_ebs_volume.tfe_data: Destroying... [id=vol-0c7ea044b2b7c23aa]
aws_volume_attachment.tfe_snapshot: Still destroying... [id=vai-3536475254, 20s elapsed]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Still destroying... [id=igw-01cdb4cb7d24e1a5a, 20s elapsed]
module.vpc_aws.aws_security_group.ag_tfe_Security_Group_elb: Still destroying... [id=sg-01a678137f83ab887, 20s elapsed]
aws_ebs_volume.tfe_data: Destruction complete after 1s
module.vpc_aws.aws_security_group.ag_tfe_Security_Group_elb: Destruction complete after 27s
aws_volume_attachment.tfe_snapshot: Still destroying... [id=vai-3536475254, 30s elapsed]
aws_volume_attachment.tfe_snapshot: Destruction complete after 30s
aws_ebs_volume.tfe_snapshot: Destroying... [id=vol-04eed28d1fe2ae33e]
aws_instance.ptfe: Destroying... [id=i-0ab05015235500fe9]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Still destroying... [id=igw-01cdb4cb7d24e1a5a, 30s elapsed]
aws_ebs_volume.tfe_snapshot: Destruction complete after 1s
aws_instance.ptfe: Still destroying... [id=i-0ab05015235500fe9, 10s elapsed]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Still destroying... [id=igw-01cdb4cb7d24e1a5a, 40s elapsed]
aws_instance.ptfe: Still destroying... [id=i-0ab05015235500fe9, 20s elapsed]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Still destroying... [id=igw-01cdb4cb7d24e1a5a, 50s elapsed]
aws_instance.ptfe: Still destroying... [id=i-0ab05015235500fe9, 30s elapsed]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Still destroying... [id=igw-01cdb4cb7d24e1a5a, 1m0s elapsed]
aws_instance.ptfe: Still destroying... [id=i-0ab05015235500fe9, 41s elapsed]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Still destroying... [id=igw-01cdb4cb7d24e1a5a, 1m10s elapsed]
aws_instance.ptfe: Still destroying... [id=i-0ab05015235500fe9, 51s elapsed]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Still destroying... [id=igw-01cdb4cb7d24e1a5a, 1m20s elapsed]
aws_instance.ptfe: Still destroying... [id=i-0ab05015235500fe9, 1m1s elapsed]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Still destroying... [id=igw-01cdb4cb7d24e1a5a, 1m30s elapsed]
module.vpc_aws.aws_internet_gateway.ag_tfe_GW: Destruction complete after 1m37s
aws_instance.ptfe: Still destroying... [id=i-0ab05015235500fe9, 1m11s elapsed]
aws_instance.ptfe: Destruction complete after 1m11s
aws_key_pair.ptfe-key: Destroying... [id=ptfe-key]
module.vpc_aws.aws_subnet.ag_tfe_Subnet: Destroying... [id=subnet-080c67631678950ca]
module.vpc_aws.aws_security_group.ag_tfe_Security_Group: Destroying... [id=sg-0b3d22e65590fca52]
aws_key_pair.ptfe-key: Destruction complete after 0s
module.vpc_aws.aws_security_group.ag_tfe_Security_Group: Destruction complete after 0s
module.vpc_aws.aws_subnet.ag_tfe_Subnet: Destruction complete after 0s
module.vpc_aws.aws_vpc.ag_tfe: Destroying... [id=vpc-0d3045d653b28dbff]
module.vpc_aws.aws_vpc.ag_tfe: Destruction complete after 1s

Destroy complete! Resources: 24 destroyed.
```
