provider "azurerm" {
  features {}
  subscription_id = var.az_sub_id
}

data "azurerm_client_config" "current" {}

locals {
  resource_name_prefix = "hcv"
  resource_base_name   = "${local.resource_name_prefix}-RESTYPE-${var.environment}-${var.location}"
  tags = {
    git_repo    = var.git_repo
    environment = var.environment,
    location    = var.location
    product     = "vault"
  }
}

resource "azurerm_resource_group" "vault" {
  name     = replace(local.resource_base_name, "RESTYPE", "rg")
  location = var.location
  tags     = local.tags
}

resource "tls_private_key" "vault_nodes" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_private_key" "bastion" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

module "iam" {
  source               = "./modules/iam"
  common_tags          = local.tags
  key_vault_id         = module.keyvault.key_vault_id
  resource_group       = azurerm_resource_group.vault
  resource_name_prefix = local.resource_name_prefix
  tenant_id            = data.azurerm_client_config.current.tenant_id
}

module "tls" {
  source                  = "./modules/tls"
  common_tags             = local.tags
  resource_group          = azurerm_resource_group.vault
  resource_name_prefix    = local.resource_name_prefix
  vault_cluster_host_name = "vault"
  dns_zone_name           = var.dns_zone_name
}

module "keyvault" {
  source                           = "./modules/keyvault"
  common_tags                      = local.tags
  resource_group                   = azurerm_resource_group.vault
  resource_name_prefix             = local.resource_name_prefix
  user_supplied_key_vault_key_name = "hashivault"
  vault_server_certificate         = module.tls.vault_server_cert_pfx
  vault_nodes_ssh_private_key      = tls_private_key.vault_nodes.private_key_openssh
  bastion_ssh_private_key          = tls_private_key.bastion.private_key_openssh
  vault_nodes_ssh_public_key       = tls_private_key.vault_nodes.public_key_openssh
  bastion_ssh_public_key           = tls_private_key.bastion.public_key_openssh
  keyvault_readers                 = var.keyvault_readers
  root_ca_pem                      = module.tls.root_ca_pem
  root_ca_pfx                      = module.tls.root_ca_pfx
}