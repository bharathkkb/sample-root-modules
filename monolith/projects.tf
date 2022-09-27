module "org_audit_logs" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 13.0"
  name    = "logging-c-logging"
}

module "dev_base_shared_vpc_host_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 13.0"
  name    = "prj-dev-shared-base"
}

module "prod_base_shared_vpc_host_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 13.0"
  name    = "prj-prod-shared-base"
}
