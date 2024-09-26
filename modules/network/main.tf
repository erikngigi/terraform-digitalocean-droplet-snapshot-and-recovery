data "cloudflare_zone" "zone_id" {
  name = var.domain_name
}

data "cloudflare_record" "current_droplet_dns" {
  zone_id  = data.cloudflare_zone.zone_id.zone_id
  hostname = "${var.dep_domain_name}.${var.domain_name}"
  type     = "A"

  depends_on = [data.cloudflare_zone.zone_id]
}

resource "cloudflare_record" "from_snapshot_droplet_dns" {
  zone_id = data.cloudflare_zone.zone_id.zone_id
  name    = var.dep_domain_name
  content = var.from_snapshot_droplet_public_IPv4
  type    = "A"
  ttl     = 60

  depends_on = [data.cloudflare_record.current_droplet_dns]
}

# data "cloudflare_record" "from_snapshor_droplet_dns" {
#   zone_id  = cloudflare_record.from_snapshot_droplet_dns.zone_id
#   hostname = "${var.dep_domain_name}.${var.domain_name}"
#   type     = "A"

#   depends_on = [cloudflare_record.from_snapshot_droplet_dns]
# }
