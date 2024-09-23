data "digitalocean_droplet" "droplet" {
  name = var.droplet_name
}

resource "null_resource" "droplet_graceful_shutdown" {
  provisioner "local-exec" {
    command = "doctl compute droplet-action power-off ${data.digitalocean_droplet.droplet.id} -t ${var.token_api}"
  }

  depends_on = [data.digitalocean_droplet.droplet]
}

resource "digitalocean_droplet_snapshot" "droplet_snapshot" {
  droplet_id = data.digitalocean_droplet.droplet.id
  name       = "${var.droplet_name}-snapshot-${replace(timestamp(), "[:T-]", "-")}"

  depends_on = [null_resource.droplet_graceful_shutdown]
}

# resource "null_resource" "droplet_graceful_delete" {
#   provisioner "local-exec" {
#     command = "doctl compute droplet delete --force ${data.digitalocean_droplet.droplet.id} -t ${var.token_api}"
#   }

#   depends_on = [digitalocean_droplet_snapshot.droplet_snapshot]
# }

# resource "null_resource" "droplet_graceful_poweron" {
#   provisioner "local-exec" {
#     command = "doctl compute droplet-action power-on ${data.digitalocean_droplet.droplet.id} -t ${var.token_api}"
#   }

#   depends_on = [digitalocean_droplet_snapshot.droplet_snapshot]
# }


# resource "digitalocean_ssh_key" "droplet_dev2" {
#   name       = var.droplet_ssh_key_name
#   public_key = file(var.droplet_ssh_file)
# }

resource "digitalocean_droplet" "dev2_droplet_from_snapshot" {
  image    = digitalocean_droplet_snapshot.droplet_snapshot.id
  name     = var.new_droplet_name
  region   = var.droplet_region
  size     = var.droplet_size
  # ssh_keys = [digitalocean_ssh_key.droplet_dev2.fingerprint]

  # depends_on = [null_resource.droplet_graceful_poweron]
}
