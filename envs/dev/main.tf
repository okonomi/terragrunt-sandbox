terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.38.0"
    }
  }

  backend "gcs" {
    bucket  = "tf-state-gitlab-preview-app-example"
    prefix  = "terraform/state"
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
