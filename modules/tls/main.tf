data "azurerm_client_config" "current" {}

locals {
  shared_san = "${var.vault_cluster_host_name}.${var.dns_zone_name}"
}