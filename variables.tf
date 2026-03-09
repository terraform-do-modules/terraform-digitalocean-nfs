variable "name" {
  type = string
}

variable "environment" {
  type = string
}

variable "label_order" {
  type    = list(string)
  default = ["name", "environment"]
}

variable "managedby" {
  type    = string
  default = "hello@clouddrove.com"
}

variable "extra_tags" {
  type    = map(string)
  default = {}
}

variable "enabled" {
  type    = bool
  default = true
}

variable "region" {
  type = string
}

variable "size" {
  type    = number
  default = 50
}

variable "vpc_id" {
  type = string
}

variable "performance_tier" {
  type    = string
  default = "high"
}

variable "enable_attachment" {
  type    = bool
  default = false
}

variable "attachment_vpc_id" {
  type    = string
  default = ""
}

variable "enable_snapshot" {
  type    = bool
  default = false
}
