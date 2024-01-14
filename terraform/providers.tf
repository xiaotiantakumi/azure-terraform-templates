# Azure Provider source and version being used
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.57.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-sa-sample"
    storage_account_name = "saxiaotianprincipal"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {
}