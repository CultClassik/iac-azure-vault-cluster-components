variable "environment" {
  type        = string
  description = "production or nonprod"
}

variable "az_sub_id" {
  type        = string
  description = "Azure subscription ID to create resources in"
}

variable "location" {
  type = string
}

variable "dns_zone_name" {
  type        = string
  description = "The DNS zone name the Vault cluster will use"
}