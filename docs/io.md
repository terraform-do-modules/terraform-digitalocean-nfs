# terraform-digitalocean-nfs — Inputs and Outputs

## Inputs

| Name                | Description                                                          | Type           | Default                   | Required |
| ------------------- | -------------------------------------------------------------------- | -------------- | ------------------------- | -------- |
| `name`              | Name of the NFS resource.                                            | `string`       | `null`                    | no       |
| `environment`       | Environment name, such as `dev`, `staging`, or `prod`.               | `string`       | `null`                    | no       |
| `label_order`       | Order in which labels are combined to create resource names.         | `list(string)` | `["name", "environment"]` | no       |
| `managedby`         | Identifier for the team or person managing this resource.            | `string`       | `"hello@clouddrove.com"`  | no       |
| `extra_tags`        | Additional tags to apply to the resource.                            | `map(string)`  | `{}`                      | no       |
| `enabled`           | Whether the module should create resources.                          | `bool`         | `true`                    | no       |
| `region`            | DigitalOcean region where the NFS resource will be created.          | `string`       | `null`                    | no       |
| `size`              | Size of the NFS volume in GiB.                                       | `number`       | `50`                      | no       |
| `vpc_id`            | The VPC ID where the NFS resource will be created.                   | `string`       | `null`                    | no       |
| `performance_tier`  | Performance tier for the NFS resource.                               | `string`       | `"high"`                  | no       |
| `enable_attachment` | Whether to create and attach the NFS attachment resource.            | `bool`         | `false`                   | no       |
| `attachment_vpc_id` | The VPC ID to use for the NFS attachment when attachment is enabled. | `string`       | `""`                      | no       |
| `enable_snapshot`   | Whether to create an NFS snapshot.                                   | `bool`         | `false`                   | no       |


---

## Outputs

| Name                   | Description                                                        |
| ---------------------- | ------------------------------------------------------------------ |
| `nfs_id`               | The ID of the DigitalOcean NFS resource.                           |
| `nfs_host`             | The hostname or endpoint of the DigitalOcean NFS resource.         |
| `nfs_mount_path`       | The mount path for the DigitalOcean NFS resource.                  |
| `nfs_status`           | The current status of the DigitalOcean NFS resource.               |
| `nfs_performance_tier` | The performance tier configured for the DigitalOcean NFS resource. |
| `snapshot_id`          | The ID of the DigitalOcean NFS snapshot.                           |
| `attachment_id`        | The ID of the DigitalOcean NFS attachment.                         |
