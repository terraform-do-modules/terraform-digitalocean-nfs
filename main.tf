module "labels" {
  source      = "git::https://github.com/terraform-do-modules/terraform-digitalocean-labels.git"
  name        = var.name
  environment = var.environment
  label_order = var.label_order
  managedby   = var.managedby
}

locals {
  do_tags = [for k, v in var.extra_tags : "${k}:${v}"]
}

resource "digitalocean_nfs" "this" {
  count            = var.enabled ? 1 : 0
  region           = var.region
  name             = module.labels.id
  size             = var.size
  vpc_id           = var.vpc_id
  performance_tier = var.performance_tier
  tags             = local.do_tags
}

resource "digitalocean_nfs_attachment" "this" {
  count    = var.enabled && var.enable_attachment ? 1 : 0
  region   = var.region
  share_id = digitalocean_nfs.this[0].id
  vpc_id   = var.attachment_vpc_id
}

resource "digitalocean_nfs_snapshot" "this" {
  count    = var.enabled && var.enable_snapshot ? 1 : 0
  name     = "${module.labels.id}-snapshot"
  region   = var.region
  share_id = digitalocean_nfs.this[0].id
}

data "digitalocean_nfs" "this" {
  count  = var.enabled ? 1 : 0
  name   = digitalocean_nfs.this[0].name
  region = digitalocean_nfs.this[0].region
}
