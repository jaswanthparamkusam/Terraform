# vpc/vpc.tf

# Create a default VPC network
resource "google_compute_network" "default" {
  name                    = "default-1"
  auto_create_subnetworks  = false  # We will define the subnet manually
}

# Create a subnetwork in the default VPC
resource "google_compute_subnetwork" "default_subnet" {
  name          = "default-subnet"
  #region        = us-central1
  network       = google_compute_network.default.id
  ip_cidr_range = "10.0.0.0/24"  # Adjust the CIDR block as needed
}

output "network_name" {
  value = google_compute_network.default.name
}

output "subnet_name" {
  value = google_compute_subnetwork.default_subnet.name
}

output "subnet_default" {
  value = google_compute_subnetwork.default_subnet.id
}
