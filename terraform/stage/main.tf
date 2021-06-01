terraform {
  # Версия terraform
  required_version = "0.12.19"
}

provider "google" {
  # ID проекта
  project = var.project
  region  = var.region
}

module "app" {
  source          = "../modules/app"
  zone            = var.zone
  i_count         = var.i_count
  disk_image      = var.disk_image_app
  public_key_path = var.public_key_path
  ssh_private_key = var.ssh_private_key
  enable_provisioner = true
}

module "db" {
  source          = "../modules/db"
  zone            = var.zone
  disk_image      = var.disk_image_db
  public_key_path = var.public_key_path
  ssh_private_key = var.ssh_private_key
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
