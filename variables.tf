#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "terraform-do-modules"
  description = "ManagedBy, eg 'terraform-do-modules' or 'hello@clouddrove.com'"
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to apply to the resource."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources."
}

variable "region" {
  type        = string
  default     = null
  description = "DigitalOcean region where the NFS resource will be created."
}

variable "size" {
  type        = number
  default     = 50
  description = "Size of the NFS volume in GiB."
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "The VPC ID where the NFS resource will be created."
}

variable "performance_tier" {
  type        = string
  default     = "high"
  description = "Performance tier for the NFS resource."
}

variable "enable_attachment" {
  type        = bool
  default     = false
  description = "Whether to create and attach the NFS attachment resource."
}

variable "attachment_vpc_id" {
  type        = string
  default     = ""
  description = "The VPC ID to use for the NFS attachment when attachment is enabled."
}

variable "enable_snapshot" {
  type        = bool
  default     = false
  description = "Whether to create an NFS snapshot."
}