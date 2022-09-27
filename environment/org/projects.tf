module "org_audit_logs" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 13.0"
  name    = "logging-c-logging"
}
