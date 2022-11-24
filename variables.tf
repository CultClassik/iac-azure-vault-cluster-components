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

variable "keyvault_readers" {
  type        = map(string)
  description = <<EOF
Map of objects IDs to grant read access on certificates and secrets for.
Ex:
{ devops = "8f2fccad-59de-4699-8e72-33adea4bcc8b" }
EOF
}