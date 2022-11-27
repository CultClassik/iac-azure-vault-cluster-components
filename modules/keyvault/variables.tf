variable "common_tags" {
  default     = {}
  description = "(Optional) Map of common tags for all taggable resources"
  type        = map(string)
}

variable "resource_group" {
  description = "Azure resource group in which resources will be deployed"

  type = object({
    name     = string
    location = string
  })
}

variable "resource_name_prefix" {
  default     = "dev"
  description = "Prefix applied to resource names"
  type        = string

  # azurerm_key_vault name must not exceed 24 characters and has this as a prefix
  validation {
    condition     = length(var.resource_name_prefix) < 16 && (replace(var.resource_name_prefix, " ", "") == var.resource_name_prefix)
    error_message = "The resource_name_prefix value must be fewer than 16 characters and may not contain spaces."
  }
}

variable "user_supplied_key_vault_key_name" {
  default     = null
  description = "(Optional) User-provided Key Vault Key name. Providing this will disable the generation of a Key Vault Key used for Vault auto-unseal"
  type        = string
}

variable "vault_server_certificate" {
  description = "Contents of TLS certificate used by Vault cluster nodes (PFX format)"
}

variable "vault_nodes_ssh_private_key" {
  type        = string
  description = "ssh private key for the vault cluster nodes"
}

variable "vault_nodes_ssh_public_key" {
  type        = string
  description = "ssh public key for the vault cluster nodes"
}

variable "bastion_ssh_private_key" {
  type        = string
  description = "ssh private key for the bastion host"
}

variable "bastion_ssh_public_key" {
  type        = string
  description = "ssh public key for the bastion host"
}
variable "keyvault_readers" {
  type        = map(string)
  description = <<EOF
Map of objects IDs to grant read access on certificates and secrets for.
Ex:
{ devops = "8f2fccad-59de-4699-8e72-33adea4bcc8b" }
EOF
}

variable "root_ca_pem" {
  type        = string
  description = "The private root CA PEM to be used by the AGW"
}
