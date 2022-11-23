variable "environment" {}

variable "az_sub_id" {}

variable "location" {}

variable "dns_zone_name" {}

variable "dns_zone_rg_name" {}

variable "azure_client_secret" {
  description = "For the ACME provider"
}