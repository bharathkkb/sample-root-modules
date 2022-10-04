
module "log_export_to_biqquery" {
  source          = "terraform-google-modules/log-export/google"
  version         = "~> 5.1.0"
  destination_uri = module.bigquery_destination.destination_uri
}

module "bigquery_destination" {
  source     = "terraform-google-modules/log-export/google//modules/bigquery"
  version    = "~> 5.1.0"
  project_id = module.org_audit_logs.project_id
}
