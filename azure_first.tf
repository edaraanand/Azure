variable "client_secret" {
}

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "2.4.0"

  subscription_id = "4c006a2b-62ca-4348-95bc-5395f22e53b9"
  client_id       = "4fb3162d-c151-492c-9994-e3c3004f6b4a"
  client_secret   = var.client_secret
  tenant_id       = "e0dc0361-ec2e-4432-903d-d918b1089ba9"

  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "m4695062050account1"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
