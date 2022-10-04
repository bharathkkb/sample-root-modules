
resource "random_id" "suffix" {
  byte_length = 4
}

data "terraform_remote_state" "org" {
  backend = "gcs"

  config = {
    bucket = "test-backend-multilith-UPDATE-ME"
    prefix = "terraform/org"
  }
}


module "monitoring-dev" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-dev"
  project_id = "monitoring-dev-${random_id.suffix.hex}"
  org_id     = var.org_id
  folder_id  = data.terraform_remote_state.org.outputs.folder_common_id

  billing_account = var.billing_account
}

module "monitoring-nonprod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-nonprod"
  project_id = "monitoring-nonprod-${random_id.suffix.hex}"
  org_id     = var.org_id
  folder_id  = data.terraform_remote_state.org.outputs.folder_common_id

  billing_account = var.billing_account
}

module "monitoring-prod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-prod"
  project_id = "monitoring-prod-${random_id.suffix.hex}"
  org_id     = var.org_id
  folder_id  = data.terraform_remote_state.org.outputs.folder_common_id

  billing_account = var.billing_account
}


module "vpc-host-dev" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-dev"
  project_id = "vpc-host-dev-${random_id.suffix.hex}"
  org_id     = var.org_id
  folder_id  = data.terraform_remote_state.org.outputs.folder_common_id

  billing_account = var.billing_account
}

module "vpc-host-nonprod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-nonprod"
  project_id = "vpc-host-nonprod-${random_id.suffix.hex}"
  org_id     = var.org_id
  folder_id  = data.terraform_remote_state.org.outputs.folder_common_id

  billing_account = var.billing_account
}

module "vpc-host-prod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-prod"
  project_id = "vpc-host-prod-${random_id.suffix.hex}"
  org_id     = var.org_id
  folder_id  = data.terraform_remote_state.org.outputs.folder_common_id

  billing_account = var.billing_account
}
