# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------
output "nfs_id" {
  value       = try(digitalocean_nfs.this[0].id, null)
  description = "The ID of the DigitalOcean NFS resource."
}

output "nfs_host" {
  value       = try(digitalocean_nfs.this[0].host, null)
  description = "The hostname or endpoint of the DigitalOcean NFS resource."
}

output "nfs_mount_path" {
  value       = try(digitalocean_nfs.this[0].mount_path, null)
  description = "The mount path for the DigitalOcean NFS resource."
}

output "nfs_status" {
  value       = try(digitalocean_nfs.this[0].status, null)
  description = "The current status of the DigitalOcean NFS resource."
}

output "nfs_performance_tier" {
  value       = try(digitalocean_nfs.this[0].performance_tier, null)
  description = "The performance tier configured for the DigitalOcean NFS resource."
}

output "snapshot_id" {
  value       = try(digitalocean_nfs_snapshot.this[0].id, null)
  description = "The ID of the DigitalOcean NFS snapshot."
}

output "attachment_id" {
  value       = try(digitalocean_nfs_attachment.this[0].id, null)
  description = "The ID of the DigitalOcean NFS attachment."
}