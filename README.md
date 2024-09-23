# Terraform Droplet Snapshot and New Instance Creation

This Terraform script automates the process of creating a snapshot of an existing DigitalOcean droplet, creating a new instance from the snapshot, and managing the snapshot lifecycle. It uses `doctl`, the DigitalOcean CLI, for the snapshot operations and ensures data consistency by powering down the droplet before taking the snapshot.

## Features

- **Power Down Droplet**: The script powers down the droplet to ensure data integrity before taking a snapshot.
- **Create Snapshot**: A snapshot of the droplet is created, named in the format: `droplet-name-<unix-time>`.
- **Launch New Instance**: A new droplet instance is created from the snapshot.
- **Delete Snapshot**: The snapshot is deleted after the new instance is successfully created to save storage costs.

## Prerequisites

- **Terraform**: Make sure Terraform is installed on your system. [Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- **doctl (DigitalOcean CLI)**: The script requires `doctl` for managing droplets and snapshots. [Installation Guide](https://docs.digitalocean.com/reference/doctl/how-to/install/)
- **DigitalOcean API Token**: Generate a Personal Access Token from your DigitalOcean account and configure it with `doctl` or use it in the Terraform script.
  
  ```bash
  doctl auth init
  ```

## Variables

The script accepts the following configurable variables:

- `token_api`: DigitalOcean API token used for authentication.
- `droplet_name`: The name of the droplet to snapshot.
- `new_droplet_name`: Name of the new droplet created from the snapshot.
- `droplet_region`: The region in which the new droplet will be created.
- `droplet_size`: The size of the new droplet.
- `droplet_ssh_file`: The SSH key file path for authenticating with the droplet.
- `droplet_ssh_key_name`: The name of the SSH key used for droplet access.
- `droplet_graceful_shutdown`: A boolean value to ensure the droplet shuts down gracefully before snapshotting.

## Usage

1. **Set Up Environment**: 
   - Install Terraform and `doctl`.
   - Authenticate `doctl` with your DigitalOcean account using `doctl auth init`.

2. **Configure Variables**: 
   Define the variables required in the `terraform.tfvars` file or pass them as command-line arguments during execution. Example:

   ```hcl
   token_api = "your-digitalocean-api-token"
   droplet_name = "your-existing-droplet-name"
   new_droplet_name = "your-new-droplet-name"
   droplet_region = "nyc3"
   droplet_size = "s-1vcpu-1gb"
   droplet_ssh_file = "~/.ssh/id_rsa"
   droplet_ssh_key_name = "your-ssh-key-name"
   droplet_graceful_shutdown = true
   ```

3. **Run Terraform**:
   Initialize Terraform, plan the changes, and then apply the configuration to perform the snapshot and droplet creation.

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

4. **Snapshot Process**:
   - The droplet is powered off to ensure data consistency.
   - A snapshot is created with the name format `droplet-name-<unix-timestamp>`.
   - A new droplet instance is created from the snapshot.
   - The snapshot is deleted once the new droplet is up and running.

5. **Clean Up**: 
   The snapshot is automatically deleted after the new droplet is created, preventing unnecessary storage costs.

## Notes

- **Droplet Power Off**: If `droplet_graceful_shutdown` is set to `true`, the droplet will be powered down gracefully before taking the snapshot.
- **Snapshot Timing**: The Unix timestamp ensures that each snapshot has a unique name and can be easily tracked.
- **Deleting Snapshots**: If you prefer to keep snapshots for backup purposes, you can modify the script to skip deleting the snapshot after the new droplet is created.

## Dependencies

- **Terraform 1.x** or later
- **doctl** version 1.6.0 or later
- **DigitalOcean Account** with access to API tokens

## Contributing

Feel free to submit issues or pull requests for any features, bugs, or suggestions.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_digitalocean_droplet"></a> [digitalocean\_droplet](#module\_digitalocean\_droplet) | ./modules/instances | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_droplet_graceful_shutdown"></a> [droplet\_graceful\_shutdown](#input\_droplet\_graceful\_shutdown) | Flag to enable a graceful shutdown for the droplet during termination | `bool` | n/a | yes |
| <a name="input_droplet_name"></a> [droplet\_name](#input\_droplet\_name) | Name of the initial droplet instance hosted on TSRV-DEV | `string` | n/a | yes |
| <a name="input_droplet_region"></a> [droplet\_region](#input\_droplet\_region) | Geographic region where the droplet will be deployed | `string` | n/a | yes |
| <a name="input_droplet_size"></a> [droplet\_size](#input\_droplet\_size) | Droplet plan specifying CPU, RAM, and disk size | `string` | n/a | yes |
| <a name="input_droplet_ssh_file"></a> [droplet\_ssh\_file](#input\_droplet\_ssh\_file) | Path to the SSH key file used for authenticating to the droplet | `string` | n/a | yes |
| <a name="input_droplet_ssh_key_name"></a> [droplet\_ssh\_key\_name](#input\_droplet\_ssh\_key\_name) | Name identifier for the SSH key used to access the droplet | `string` | n/a | yes |
| <a name="input_new_droplet_name"></a> [new\_droplet\_name](#input\_new\_droplet\_name) | Name of the newly created droplet hosted on TSRV-DEV | `string` | n/a | yes |
| <a name="input_token_api"></a> [token\_api](#input\_token\_api) | DigitalOcean API token used for authentication | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_droplet_id"></a> [droplet\_id](#output\_droplet\_id) | n/a |
| <a name="output_droplet_ipv4_address"></a> [droplet\_ipv4\_address](#output\_droplet\_ipv4\_address) | n/a |
| <a name="output_droplet_pricing_hourly"></a> [droplet\_pricing\_hourly](#output\_droplet\_pricing\_hourly) | n/a |
<!-- END_TF_DOCS -->
