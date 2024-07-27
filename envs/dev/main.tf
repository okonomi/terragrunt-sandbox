terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

provider "google" {
  project = "gitlab-preview-app-example"
  region  = "asia-northeast1"
}

data "google_project" "this" {}

output "project_id" {
  value = data.google_project.this.id
}
