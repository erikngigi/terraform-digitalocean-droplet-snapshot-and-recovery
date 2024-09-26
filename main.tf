module "digitalocean_droplet" {
  source                     = "./modules/instances"
  digitalocean_token         = var.digitalocean_token
  current_droplet_name       = var.current_droplet_name
  from_snapshot_droplet_name = var.from_snapshot_droplet_name
  droplet_region             = var.droplet_region
  droplet_size               = var.droplet_size
  droplet_graceful_shutdown  = var.droplet_graceful_shutdown
}

module "cloudflare_dns" {
  source                            = "./modules/network"
  cloudflare_token                  = var.cloudflare_token
  domain_name                       = var.domain_name
  dep_domain_name                   = var.dep_domain_name
  from_snapshot_droplet_public_IPv4 = module.digitalocean_droplet.from_snapshot_ipv4_address
}
