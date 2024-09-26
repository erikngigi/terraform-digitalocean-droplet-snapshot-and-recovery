output "droplet_name" {
  description = "The name value of the digitalocean droplet"
  value       = data.digitalocean_droplet.droplet.name
}

output "droplet_size" {
  description = "The type of digitalocean droplet in use"
  value       = data.digitalocean_droplet.droplet.size
}

output "droplet_ipv4_address" {
  description = "The current IPv4 address of the droplet before snapshot and creation of new droplet"
  value       = data.digitalocean_droplet.droplet.ipv4_address
}

output "from_snapshot_droplet_id" {
  description = "The new identifier of the droplet created from the snapshot"
  value       = digitalocean_droplet_snapshot.droplet_snapshot.id
}

output "from_snapshot_droplet_name" {
  description = "The name value of the DigitalOcean droplet created from the snapshot"
  value       = digitalocean_droplet.from_snapshot_droplet.name
}

output "from_snapshot_ipv4_address" {
  description = "The content value of the IPv4 address of the droplet created from the snapshot"
  value       = digitalocean_droplet.from_snapshot_droplet.ipv4_address
}
