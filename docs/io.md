# Inputs and Outputs: terraform-digitalocean-nfs

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `attachment_vpc_id` | ID of the additional VPC to attach the NFS share to. Used when `enable_attachment` is true. | `string` | `""` | no |
| `enable_attachment` | Set to true to attach the NFS share to an additional VPC. | `bool` | `false` | no |
| `enable_snapshot` | Set to true to create a snapshot of the NFS share. | `bool` | `false` | no |
| `enabled` | Flag to control creation of all resources in this module. | `bool` | `true` | no |
| `environment` | Environment (e.g. `prod`, `dev`, `staging`). | `string` | n/a | yes |
| `extra_tags` | Extra tags as a map. Each entry is applied to the NFS share as a `key:value` tag. | `map(string)` | `{}` | no |
| `label_order` | Label order, e.g. `name`, `environment`. | `list(string)` | `["name", "environment"]` | no |
| `managedby` | ManagedBy, eg `terraform-do-modules` or `hello@clouddrove.com`. | `string` | `"hello@clouddrove.com"` | no |
| `name` | Name (e.g. `app` or `shared-storage`). | `string` | n/a | yes |
| `performance_tier` | Performance tier for the NFS share (`standard` or `high`). | `string` | `"high"` | no |
| `region` | The DigitalOcean region slug where the NFS share is created (e.g. `atl1`). | `string` | n/a | yes |
| `size` | Size of the NFS share in GiB. | `number` | `50` | no |
| `vpc_id` | ID of the VPC the NFS share is placed in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `attachment_id` | The ID of the NFS attachment. |
| `nfs_host` | Value exported by output `nfs_host`. |
| `nfs_id` |  |
| `nfs_mount_path` |  |
| `nfs_performance_tier` |  |
| `nfs_status` | Value exported by output `nfs_status`. |
| `snapshot_id` | Output value for snapshot_id. |
