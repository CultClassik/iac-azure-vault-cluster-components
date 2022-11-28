terraform {
  backend "azurerm" {
    container_name       = "terraform-state"
    key                  = "vault-components.production.tfstate"
    resource_group_name  = "tfstate-rg-vty-prd-eastus2"
    storage_account_name = "tfstatevtyprd"
    subscription_id      = "951a295c-41c3-45ec-8b32-2149f85581c1"
  }
}
