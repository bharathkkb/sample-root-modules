module "nonprod" {
  source          = "../modules/base_env"
  env             = "nonprod"
  org_id          = var.org_id
  billing_account = var.billing_account
}