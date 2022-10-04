locals {
  envs = {
    "dev" : "Development",
    "nonprod" : "Non-Production",
    "prod" : "Production",
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}

data "terraform_remote_state" "org" {
  backend = "gcs"

  config = {
    bucket = "test-backend-envs-UPDATE-ME"
    prefix = "terraform/org"
  }
}

module "monitoring-env" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-${var.env}"
  project_id = "monitoring-${var.env}-${random_id.suffix.hex}"
  org_id     = var.org_id
  folder_id  = data.terraform_remote_state.org.outputs.folder_common_id

  billing_account = var.billing_account
}

module "vpc-host-env" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-${var.env}"
  project_id = "vpc-host-${var.env}-${random_id.suffix.hex}"
  org_id     = var.org_id
  folder_id  = data.terraform_remote_state.org.outputs.folder_common_id

  billing_account = var.billing_account
}