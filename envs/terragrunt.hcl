remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket   = "tf-state-gitlab-preview-app-example-terragrunt"
    prefix   = "${path_relative_to_include()}/"
    project  = "gitlab-preview-app-example"
    location = "asia-northeast1"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "google" {
  project = "gitlab-preview-app-example"
  region  = "asia-northeast1"
}
EOF
}
