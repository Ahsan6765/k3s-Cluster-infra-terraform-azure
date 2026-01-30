terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

 #Remote backend configuration (Azure Storage)
  backend "azurerm" {
    resource_group_name   = "ah-db-rg"        
    storage_account_name  = "tfstate1234512" 
    container_name        = "k3s-cluster-infra"
    key                   = "K3S-Cluster-terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = ""
}
