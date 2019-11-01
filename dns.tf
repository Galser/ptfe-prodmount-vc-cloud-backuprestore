# Network : DNS CloudFlare
module "dns_cloudflare" {
  source = "./modules/dns_cloudflare"

  host         = var.site_record
  domain       = var.site_domain
  cname_target = aws_elb.ptfe_lb.dns_name
  record_ip    = "${aws_instance.ptfe.public_ip}"
}
