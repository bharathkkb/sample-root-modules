data "terraform_remote_state" "envs" {
  backend = "gcs"

  config = {
    bucket = "backend-bucket"
    prefix = "terraform/envs/${var.env}"
  }
}

module "base_shared_vpc" {
  source     = "terraform-google-modules/network/google"
  version    = "~> 5.0"
  network_name = "vpc-${var.env}-shared-base"
  project_id = data.terraform_remote_state.envs.network_project_id
}