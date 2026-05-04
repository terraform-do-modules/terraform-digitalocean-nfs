# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------

output "nfs_id" {
  value       = try(digitalocean_nfs.main[0].id, null)
  description = "The ID of the DigitalOcean NFS share."
}

output "nfs_host" {
  value       = try(digitalocean_nfs.main[0].host, null)
  description = "The hostname or endpoint of the DigitalOcean NFS share."
}

output "nfs_mount_path" {
  value       = try(digitalocean_nfs.main[0].mount_path, null)
  description = "The mount path of the DigitalOcean NFS share."
}

output "nfs_status" {
  value       = try(digitalocean_nfs.main[0].status, null)
  description = "The current status of the DigitalOcean NFS share."
}

output "nfs_performance_tier" {
  value       = try(digitalocean_nfs.main[0].performance_tier, null)
  description = "The performance tier configured for the DigitalOcean NFS share."
}

output "snapshot_id" {
  value       = try(digitalocean_nfs_snapshot.main[0].id, null)
  description = "The ID of the snapshot created for the DigitalOcean NFS share."
}

output "attachment_id" {
  value       = try(digitalocean_nfs_attachment.main[0].id, null)
  description = "The ID of the DigitalOcean NFS attachment."
}