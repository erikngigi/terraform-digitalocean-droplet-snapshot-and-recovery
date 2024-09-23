module "digitalocean_droplet" {
  source                    = "./modules/instances"
  token_api                 = var.token_api
  droplet_name              = var.droplet_name
  new_droplet_name          = var.new_droplet_name
  droplet_region            = var.droplet_region
  droplet_size              = var.droplet_size
  droplet_graceful_shutdown = var.droplet_graceful_shutdown
  droplet_ssh_file          = var.droplet_ssh_file
  droplet_ssh_key_name      = var.droplet_ssh_key_name
}
