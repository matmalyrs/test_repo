variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "tenant_id" {
  type      = string
  sensitive = true
}

variable "client_id" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}

terraform {

}


provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "test_rg"
    storage_account_name = "tfstatestrg543654576"
    container_name       = "2cbef372-42ce-48e2-aaa1-6606bcf16ad2-tfstate"
    key                  = "base.tfstate"
  }
}


resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup1"
  location = "eastus2"
}
