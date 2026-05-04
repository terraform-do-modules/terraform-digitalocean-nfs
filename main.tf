##-----------------------------------------------------------------------------
## Labels module used for naming and tags.
##-----------------------------------------------------------------------------
module "labels" {
  source      = "terraform-do-modules/labels/digitalocean"
  version     = "1.0.6"
  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
}

locals {
  do_tags = [for k, v in var.extra_tags : "${k}:${v}"]
}

##-----------------------------------------------------------------------------
## Create DigitalOcean NFS.
##-----------------------------------------------------------------------------
resource "digitalocean_nfs" "main" {
  count            = var.enabled ? 1 : 0
  region           = var.region
  name             = module.labels.id
  size             = var.size
  vpc_id           = var.vpc_id
  performance_tier = var.performance_tier
  tags             = local.do_tags
}

##-----------------------------------------------------------------------------
## Attach DigitalOcean NFS to VPC.
##-----------------------------------------------------------------------------
resource "digitalocean_nfs_attachment" "main" {
  count    = var.enabled && var.enable_attachment ? 1 : 0
  region   = var.region
  share_id = digitalocean_nfs.main[0].id
  vpc_id   = var.attachment_vpc_id
}

##-----------------------------------------------------------------------------
## Create snapshot for DigitalOcean NFS.
##-----------------------------------------------------------------------------
resource "digitalocean_nfs_snapshot" "main" {
  count    = var.enabled && var.enable_snapshot ? 1 : 0
  name     = "${module.labels.id}-snapshot"
  region   = var.region
  share_id = digitalocean_nfs.main[0].id
}

##-----------------------------------------------------------------------------
## Fetch DigitalOcean NFS details.
##-----------------------------------------------------------------------------
data "digitalocean_nfs" "main" {
  count  = var.enabled ? 1 : 0
  name   = digitalocean_nfs.main[0].name
  region = digitalocean_nfs.main[0].region
}