locals {
  google_project = "gitlab-preview-app-example"
  google_region  = "asia-northeast1"
  stage          = path_relative_to_include()
}

remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket   = "tf-state-gitlab-preview-app-example-terragrunt"
    prefix   = "${local.stage}/"
    project  = local.google_project
    location = local.google_region
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project = "${local.google_project}"
  region  = "${local.google_region}"
}
EOF
}
