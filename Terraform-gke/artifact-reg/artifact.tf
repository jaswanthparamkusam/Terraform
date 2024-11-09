# artifact_registry/artifact.tf

resource "google_artifact_registry_repository" "jaswanth_repo" {
  name     = "jaswanth-repo-1"
  location = var.region
  format   = "DOCKER"  # You can change this to other formats like "MAVEN", "NPM", etc.

  description = "Docker repository for GKE cluster"

  # Optional: Set repository permissions
  # You can specify access control rules or IAM bindings here
}

output "artifact_registry_repository_name" {
  value = google_artifact_registry_repository.jaswanth_repo.name
}

output "artifact_registry_location" {
  value = google_artifact_registry_repository.jaswanth_repo.location
}
