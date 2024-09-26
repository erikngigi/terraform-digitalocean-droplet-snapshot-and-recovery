data "digitalocean_droplet" "droplet" {
  name = var.current_droplet_name
}

resource "null_resource" "droplet_graceful_shutdown" {
  provisioner "local-exec" {
    command = "doctl compute droplet-action power-off ${data.digitalocean_droplet.droplet.id} -t ${var.digitalocean_token}"
  }

  depends_on = [data.digitalocean_droplet.droplet]
}

resource "digitalocean_droplet_snapshot" "droplet_snapshot" {
  droplet_id = data.digitalocean_droplet.droplet.id
  name       = "snapshot-${var.current_droplet_name}-${replace(substr(timestamp(), 0, 10), "-", "")}"

  depends_on = [null_resource.droplet_graceful_shutdown]
}

resource "digitalocean_droplet" "from_snapshot_droplet" {
  image  = digitalocean_droplet_snapshot.droplet_snapshot.id
  name   = var.from_snapshot_droplet_name
  region = var.droplet_region
  size   = var.droplet_size

  depends_on = [digitalocean_droplet_snapshot.droplet_snapshot]
}

# resource "null_resource" "droplet_graceful_delete" {
#   provisioner "local-exec" {
#     command = "doctl compute droplet delete --force ${data.digitalocean_droplet.droplet.id} -t ${var.digitalocean_token}"
#   }

#   depends_on = [digitalocean_droplet.from_snapshot_droplet]
# }
