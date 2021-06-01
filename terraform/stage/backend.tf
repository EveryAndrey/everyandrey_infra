terraform {
  backend "gcs" {
    bucket = "puma-service-modules"
    prefix = "prod"
  }
}

data "terraform_remote_state" "prod" {
  backend = "gcs"
  config = {
    bucket = "puma-service-modules"
    prefix = "prod"
  }
}
