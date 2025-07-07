provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_artifact_registry_repository" "registry" {
  location      = var.region
  repository_id = var.repository_id
  format        = var.format

  description   = "Artifact Registry via Terraform CI/CD"

  docker_config {
    immutable_tags = false
  }
}
