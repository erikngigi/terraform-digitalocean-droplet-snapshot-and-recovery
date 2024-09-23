variable "token_api" {
  description = "DigitalOcean API token used for authentication"
  type        = string
  sensitive   = true
}

variable "droplet_name" {
  description = "Name of the initial droplet instance hosted on TSRV-DEV"
  type        = string
}

variable "new_droplet_name" {
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

variable "droplet_ssh_file" {
  description = "Path to the SSH key file used for authenticating to the droplet"
  type        = string
}

variable "droplet_ssh_key_name" {
  description = "Name identifier for the SSH key used to access the droplet"
  type        = string
}

variable "droplet_graceful_shutdown" {
  description = "Flag to enable a graceful shutdown for the droplet during termination"
  type        = bool
}
