# cluster/cluster.tf

variable "network" {
  description = "The name of the network for GKE"
  type        = string
}

variable "subnet" {
  description = "The name of the subnet for GKE"
  type        = string
}

# Create GKE Autopilot Cluster
resource "google_container_cluster" "default" {
  name     = "cluster-jas-1"
  location = "asia-south1"

  enable_autopilot = true

  # Set `deletion_protection` to true to prevent accidental deletion
  deletion_protection = false

  # Define the network and subnetwork for the GKE cluster
  network   = var.network
  subnetwork = var.subnet
}

# Fetch GKE cluster information using the data source
data "google_container_cluster" "cluster" {
  name     = google_container_cluster.default.name
  location = google_container_cluster.default.location
}

# Output the cluster endpoint
output "cluster_endpoint" {
  value = data.google_container_cluster.cluster.endpoint
}

# Output the cluster CA certificate
output "cluster_ca_certificate" {
  value = data.google_container_cluster.cluster.master_auth[0].cluster_ca_certificate
}

