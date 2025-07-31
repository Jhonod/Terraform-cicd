provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_artifact_registry_repository" "registry" {
  location      = var.region
  repository_id = var.repository_id
  format        = var.format

  docker_config {
    immutable_tags = false
  }

}

resource "google_cloud_run_service_iam_member" "noauth" {
  location = google_cloud_run_service.app.location
  service  = google_cloud_run_service.app.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
