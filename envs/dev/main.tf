terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

data "google_project" "this" {}

output "project_id" {
  value = data.google_project.this.id
}
