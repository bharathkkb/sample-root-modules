module "dev_base_shared_vpc" {
  source     = "terraform-google-modules/network/google"
  version    = "~> 5.0"
  project_id = module.dev_base_shared_vpc_host_project
}

module "prod_base_shared_vpc" {
  source     = "terraform-google-modules/network/google"
  version    = "~> 5.0"
  project_id = module.prod_base_shared_vpc_host_project
}