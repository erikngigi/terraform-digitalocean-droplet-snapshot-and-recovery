variable "token_api" {
  description = "Token API from digitalocean"
  type        = string
  sensitive   = true
}

variable "droplet_name" {
  description = "Name of the droplet hosted on TSRV-DEV"
  type        = string
}

variable "new_droplet_name" {
  description = "Name of the droplet hosted on TSRV-DEV"
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

variable "droplet_ssh_file" {
  description = "SSH file for the droplet"
  type        = string
}

variable "droplet_ssh_key_name" {
  description = "Name of the SSH file"
  type        = string
}

variable "droplet_graceful_shutdown" {
  description = "Allow graceful shutdown process"
  type        = bool
}
