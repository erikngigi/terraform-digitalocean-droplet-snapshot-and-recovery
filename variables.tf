# Digitalocean variables
variable "digitalocean_token" {
  description = "DigitalOcean API token used for authentication"
  type        = string
  sensitive   = true
}

variable "current_droplet_name" {
  description = "Name of the initial droplet instance hosted on TSRV-DEV"
  type        = string
}

variable "from_snapshot_droplet_name" {
  description = "Name of the newly created droplet hosted on TSRV-DEV"
  type        = string
}

variable "droplet_region" {
  description = "Geographic region where the droplet will be deployed"
  type        = string
}

variable "droplet_size" {
  description = "Droplet plan specifying CPU, RAM, and disk size"
  type        = string
}

variable "droplet_graceful_shutdown" {
  description = "Flag to enable a graceful shutdown for the droplet during termination"
  type        = bool
}

# Cloudflare root variables
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
