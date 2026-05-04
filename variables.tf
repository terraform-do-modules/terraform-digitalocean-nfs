variable "name" {
  type        = string
  default     = null
  description = "The name used to create and identify the DigitalOcean NFS resource."
}

variable "environment" {
  type        = string
  default     = null
  description = "The environment name, such as dev, staging, or production."
}

variable "label_order" {
  type        = list(string)
  default     = ["name", "environment"]
  description = "The order in which labels are combined to form the resource name."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "The identifier or contact information of the team or person managing this resource."
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "A map of additional tags to apply to the DigitalOcean NFS resource."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Controls whether the DigitalOcean NFS resources should be created."
}

variable "region" {
  type        = string
  default     = null
  description = "The DigitalOcean region where the NFS resource will be created."
}

variable "size" {
  type        = number
  default     = 50
  description = "The size of the DigitalOcean NFS share in GiB."
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "The ID of the VPC where the DigitalOcean NFS resource will be provisioned."
}

variable "performance_tier" {
  type        = string
  default     = "high"
  description = "The performance tier to use for the DigitalOcean NFS share."
}

variable "enable_attachment" {
  type        = bool
  default     = false
  description = "Controls whether the DigitalOcean NFS share should be attached to a VPC."
}

variable "attachment_vpc_id" {
  type        = string
  default     = ""
  description = "The VPC ID used for attaching the DigitalOcean NFS share when attachment is enabled."
}

variable "enable_snapshot" {
  type        = bool
  default     = false
  description = "Controls whether a snapshot of the DigitalOcean NFS share should be created."
}