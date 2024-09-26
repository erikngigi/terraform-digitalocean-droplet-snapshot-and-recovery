# Digitalocean variables
variable "from_snapshot_droplet_public_IPv4" {
  description = "Public IPv4 address from droplet created from snapshot"
  type        = string
}

# Cloudflare variables
variable "cloudflare_token" {
  description = "CloudFlare API token used for authentication"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "CloudFlare registered domain name"
  type        = string
}

variable "dep_domain_name" {
  description = "Subdomain name value mapped to DNS records for the droplet"
  type        = string
}
