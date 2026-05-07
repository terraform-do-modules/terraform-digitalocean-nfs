output "nfs_id" {
  value       = module.nfs.nfs_id
  description = "The ID of the DigitalOcean NFS resource."
}

output "nfs_host" {
  value       = module.nfs.nfs_host
  description = "The hostname or endpoint of the DigitalOcean NFS resource."
}

output "nfs_mount_path" {
  value       = module.nfs.nfs_mount_path
  description = "The mount path for the DigitalOcean NFS resource."
}

output "nfs_status" {
  value       = module.nfs.nfs_status
  description = "The current status of the DigitalOcean NFS resource."
}

output "nfs_performance_tier" {
  value       = module.nfs.nfs_performance_tier
  description = "The performance tier configured for the DigitalOcean NFS resource."
}

output "snapshot_id" {
  value       = module.nfs.snapshot_id
  description = "The ID of the DigitalOcean NFS snapshot."
}

output "attachment_id" {
  value       = module.nfs.attachment_id
  description = "The ID of the DigitalOcean NFS attachment."
}