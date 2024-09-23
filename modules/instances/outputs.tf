output "droplet_ipv4_address" {
  value = digitalocean_droplet.dev2_droplet_from_snapshot.ipv4_address
}

output "droplet_id" {
  value = digitalocean_droplet.dev2_droplet_from_snapshot.id
}

output "droplet_pricing_hourly" {
  value = digitalocean_droplet.dev2_droplet_from_snapshot.price_hourly
}
