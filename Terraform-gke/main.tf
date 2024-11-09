terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 6.5"
    }
  }
}

provider "google" {
  credentials = file("jump-machine-273ce180fcc0.json")
  project     = var.project_id
  region      = "asia-south1"
}
# VPC Configuration
module "vpc" {
  source = "./vpc"
}

# GKE Cluster Configuration
module "cluster" {
  source   = "./cluster"
  network  = module.vpc.network_name
  subnet   = module.vpc.subnet_name
}

output "cluster_endpoint" {
  value = module.cluster.cluster_endpoint
}

output "cluster_ca_certificate" {
  value = module.cluster.cluster_ca_certificate
}
