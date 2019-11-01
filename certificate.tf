# Certificate : SSL from Let'sEncrypt
module "sslcert_letsencrypt" {
  source = "./modules/sslcert_letsencrypt"

  host         = var.site_record
  domain       = var.site_domain
  dns_provider = "cloudflare"
}
