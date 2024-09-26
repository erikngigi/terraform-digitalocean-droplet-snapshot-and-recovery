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
  description = "Region the droplet is located in"
  type        = string
}

variable "droplet_size" {
  description = "Size of the droplet"
  type        = string
}

variable "droplet_graceful_shutdown" {
  description = "Allow graceful shutdown process"
  type        = bool
}
