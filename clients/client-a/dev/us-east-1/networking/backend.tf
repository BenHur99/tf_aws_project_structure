terraform {
  backend "azurerm" {
    resource_group_name  = "orel"
    storage_account_name = "awstfstatepoc"
    container_name       = "tfstate"
    key                  = "client-a/dev/us-east-1/networking/terraform.tfstate"
  }
}