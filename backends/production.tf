terraform {
  backend "azurerm" {
    container_name       = "terraform-state"
    key                  = "vault-components.production.tfstate"
    resource_group_name  = "tfstate-rg-vty-prd-eastus2"
    storage_account_name = "tfstatevtyprd"
  }
}
