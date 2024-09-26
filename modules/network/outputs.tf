output "cloduflare_zone_id" {
  description = "Output of the Zone identifier for a domain"
  value       = data.cloudflare_zone.zone_id.zone_id
}

output "cloudflare_hostname" {
  description = "Output of the hostname recorded on CloudFlare"
  value       = data.cloudflare_record.current_droplet_dns.hostname
}

output "cloudflare_ttl" {
  description = "The Time to Live (TTL) value from the DNS records"
  value       = data.cloudflare_record.current_droplet_dns.ttl
}

output "current_cloudflare_dns_record" {
  description = "The current DNS record values for the droplet"
  value       = data.cloudflare_record.current_droplet_dns.value
}

# output "from_snapshot_dns_record" {
#   description = "The updated DNS record values for the droplet created from the snapshot"
#   value       = data.cloudflare_record.from_snapshor_droplet_dns.value
# }

output "from_snapshot_public_IPv4" {
  description = "The public IPv4 address of the DigitalOcean droplet mapped to the DNS records"
  value       = cloudflare_record.from_snapshot_droplet_dns.content
}
