module "prod" {
  source          = "../modules/base_env"
  env             = "prod"
  org_id          = var.org_id
  billing_account = var.billing_account
}