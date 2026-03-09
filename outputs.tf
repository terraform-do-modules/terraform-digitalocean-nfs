output "nfs_id" { value = try(digitalocean_nfs.this[0].id, null) }
output "nfs_host" { value = try(digitalocean_nfs.this[0].host, null) }
output "nfs_mount_path" { value = try(digitalocean_nfs.this[0].mount_path, null) }
output "nfs_status" { value = try(digitalocean_nfs.this[0].status, null) }
output "nfs_performance_tier" { value = try(digitalocean_nfs.this[0].performance_tier, null) }
output "snapshot_id" { value = try(digitalocean_nfs_snapshot.this[0].id, null) }
output "attachment_id" { value = try(digitalocean_nfs_attachment.this[0].id, null) }
