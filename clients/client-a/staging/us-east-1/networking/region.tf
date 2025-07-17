provider "azurerm" {
  features = {}
  alias    = "default"
  skip_provider_registration = true
}

variable "region" {
  type    = string
  default = "East US"
}