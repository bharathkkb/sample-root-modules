data "terraform_remote_state" "envs" {
  backend = "gcs"

  config = {
    bucket = "backend-bucket"
    prefix = "terraform/envs"
  }
}

module "dev_base_shared_vpc" {
  source     = "terraform-google-modules/network/google"
  version    = "~> 5.0"
  project_id = data.terraform_remote_state.envs.dev_network_project_id
}

module "prod_base_shared_vpc" {
  source     = "terraform-google-modules/network/google"
  version    = "~> 5.0"
  project_id = data.terraform_remote_state.envs.prod_network_project_id
}