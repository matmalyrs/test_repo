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

provider "azurerm" {
  features {}
  subscription_id = "2cbef372-42ce-48e2-aaa1-6606bcf16ad2"
  tenant_id       = "570057f4-73ef-41c8-bcbb-08db2fc15c2b"
  client_id       = "268b912e-9068-448a-b4e9-be124d5bff98"
  client_secret   = "n4R8Q~LIJy.lUpOnIRXDb7JeIYIaNEUscchMYbt7"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    client_id            = "268b912e-9068-448a-b4e9-be124d5bff98"
    client_secret        = "n4R8Q~LIJy.lUpOnIRXDb7JeIYIaNEUscchMYbt7"
    subscription_id      = "2cbef372-42ce-48e2-aaa1-6606bcf16ad2"
    tenant_id            = "570057f4-73ef-41c8-bcbb-08db2fc15c2b"
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
