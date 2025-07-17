terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "mytfstatestorage"
    container_name       = "tfstate"
    key                  = "client-a/stg/us-east-1/loadbalancing/terraform.tfstate"
  }
}