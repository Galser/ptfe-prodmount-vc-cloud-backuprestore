# Example of `terraform init` output

```bash
terraform init
Initializing modules...
- dns_cloudflare in modules/dns_cloudflare
- sslcert_letsencrypt in modules/sslcert_letsencrypt
- vpc_aws in modules/vpc_aws

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "cloudflare" (terraform-providers/cloudflare) 2.0.1...
- Downloading plugin for provider "tls" (hashicorp/tls) 2.1.1...
- Downloading plugin for provider "local" (hashicorp/local) 1.4.0...
- Downloading plugin for provider "acme" (terraform-providers/acme) 1.5.0...
- Downloading plugin for provider "aws" (hashicorp/aws) 2.33.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.33"
* provider.cloudflare: version = "~> 2.0"
* provider.local: version = "~> 1.4"
* provider.tls: version = "~> 2.1"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```