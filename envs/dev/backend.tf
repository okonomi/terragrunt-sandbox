# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "gcs" {
    bucket = "tf-state-gitlab-preview-app-example-terragrunt"
    prefix = "dev/"
  }
}
