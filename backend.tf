terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 4.65.0"
    }
  }
# backend "azurerm" {
# resource_group_name = "test-rg"
# storage_account_name = "maalgodam123"
# container_name = "containermaalda"
# key = "terraform.tfstate"
# }  
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "mytestrg12" {
  name     = "test-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "mymoneygodam" {
  name                     = "maalgodam123"
  resource_group_name      = azurerm_resource_group.mytestrg12.name
  location                 = azurerm_resource_group.mytestrg12.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "maaldacontainer" {
  name                  = "containermaalda"
  storage_account_id    = azurerm_storage_account.mymoneygodam.id
  container_access_type = "private"
}