resource "google_storage_bucket" "bucket" {
  name          = "devops-multicloud-gcp-${var.gcp_project_id}"
  location      = "ASIA-SOUTH1"
  force_destroy = true
  labels = {
    environment = "lab"
    managedby   = "terraform"
  }
}