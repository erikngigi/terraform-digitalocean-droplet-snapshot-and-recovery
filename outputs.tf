# Digitalocean outputs
output "current_droplet_name" {
  value = format("Name of the Current DigitalOcean Droplet : %s", module.digitalocean_droplet.droplet_name)
}

output "current_droplet_size" {
  value = format("Current DigitalOcean Droplet Type : %s", module.digitalocean_droplet.droplet_size)
}

output "current_droplet_public_ipv4" {
  value = format("Current IPv4 address of the DigitalOcean Droplet for %s : %s", module.cloudflare_dns.cloudflare_hostname, module.digitalocean_droplet.droplet_ipv4_address)
}

output "from_snapshot_droplet_id" {
  value = format("Identifier from the Snapshot Droplet : %s", module.digitalocean_droplet.from_snapshot_droplet_id)
}

output "from_snapshot_droplet_name" {
  value = format("Name value of the Droplet created from the snapshot : %s", module.digitalocean_droplet.from_snapshot_droplet_name)
}

output "from_snapshot_public_ipv4" {
  value = format("Content Value of the Public IPv4 Snapshot Droplet : %s", module.digitalocean_droplet.from_snapshot_ipv4_address)
}

# Cloudflare outputs
output "cloduflare_zone_id" {
  value = format("Content Value of the Zone ID : %s : %s", module.cloudflare_dns.cloudflare_hostname, module.cloudflare_dns.cloduflare_zone_id)
}

output "cloudflare_ipv4_address" {
  value = format("Current IPv4 Address on CloudFlare for %s : %s", module.cloudflare_dns.cloudflare_hostname, module.cloudflare_dns.current_cloudflare_dns_record)
}

output "cloudflare_ttl" {
  value = format("Current TTL value on Cloudflare : %s", module.cloudflare_dns.cloudflare_ttl)
}

# output "from_snapshot_cloudflare_ipv4_address" {
#   value = format("New Public IPv4 from Droplet created from snapshot %s : %s", module.cloudflare_dns.cloudflare_hostname, module.cloudflare_dns.from_snapshot_dns_record)
# }
