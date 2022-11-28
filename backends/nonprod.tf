terraform {
  backend "azurerm" {
    container_name       = "terraform-state"
    key                  = "vault-components.nonprod.tfstate"
    resource_group_name  = "tfstate-rg-vty-nop-eastus2"
    storage_account_name = "tfstatevtynop"
  }
}
