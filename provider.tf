terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.23.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.key
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "07f136e5-d168-4950-a26f-e1a528a1a87c"
  client_id = "a37a1b53-6024-4931-8c80-b5aaa26154e7"
  tenant_id = "77711e6a-2454-45d2-9683-aa6b2f67926f"

}