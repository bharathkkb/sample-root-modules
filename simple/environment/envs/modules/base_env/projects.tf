module "base_shared_vpc_host_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 13.0"
  name    = "prj-${var.env}-shared-base"
}
