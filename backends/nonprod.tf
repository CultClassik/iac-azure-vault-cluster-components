terraform {
  backend "azurerm" {
    container_name       = "terraform-state"
    key                  = "vault-components.nonprod.tfstate"
    resource_group_name  = "tfstate-rg-vty-nop-eastus2"
    storage_account_name = "tfstatevtynop"
    subscription_id      = "3810f594-f91b-404a-b6eb-ebf9b9e4f62c"
  }
}
