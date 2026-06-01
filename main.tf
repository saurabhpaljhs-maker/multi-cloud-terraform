terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.50.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {                    # ← Add this block here
      source  = "hashicorp/random"
      version = "~> 3.0"
    }                             # ← Close here
  }
}

provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.azure_subscription_id
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

# AWS Module
module "aws" {
  source     = "./modules/aws"
  aws_region = var.aws_region
}

# Azure Module
module "azure" {
  source                = "./modules/azure"
  azure_subscription_id = var.azure_subscription_id
  azure_location        = var.azure_location
}

# GCP Module
module "gcp" {
  source         = "./modules/gcp"
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
}