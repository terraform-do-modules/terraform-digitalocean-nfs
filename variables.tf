variable "name" {
  description = "Name (e.g. `app` or `shared-storage`)."
  type        = string
}

variable "environment" {
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
  type        = string
}

variable "label_order" {
  description = "Label order, e.g. `name`, `environment`."
  type        = list(string)
  default     = ["name", "environment"]
}

variable "managedby" {
  description = "ManagedBy, eg `terraform-do-modules` or `hello@clouddrove.com`."
  type        = string
  default     = "hello@clouddrove.com"
}

variable "extra_tags" {
  description = "Extra tags as a map. Each entry is applied to the NFS share as a `key:value` tag."
  type        = map(string)
  default     = {}
}

variable "enabled" {
  description = "Flag to control creation of all resources in this module."
  type        = bool
  default     = true
}

variable "region" {
  description = "The DigitalOcean region slug where the NFS share is created (e.g. `atl1`)."
  type        = string
}

variable "size" {
  description = "Size of the NFS share in GiB."
  type        = number
  default     = 50
}

variable "vpc_id" {
  description = "ID of the VPC the NFS share is placed in."
  type        = string
}

variable "performance_tier" {
  description = "Performance tier for the NFS share (`standard` or `high`)."
  type        = string
  default     = "high"
}

variable "enable_attachment" {
  description = "Set to true to attach the NFS share to an additional VPC."
  type        = bool
  default     = false
}

variable "attachment_vpc_id" {
  description = "ID of the additional VPC to attach the NFS share to. Used when `enable_attachment` is true."
  type        = string
  default     = ""
}

variable "enable_snapshot" {
  description = "Set to true to create a snapshot of the NFS share."
  type        = bool
  default     = false
}
