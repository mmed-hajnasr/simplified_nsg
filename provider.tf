terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.89.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.0"
  suffix = ["${terraform.workspace}-sqlapp"]
  unique-include-numbers = true
}