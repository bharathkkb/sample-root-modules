module "logsink-logbucketsink" {
  count   = var.enable_logbucket_destination ? 1 : 0
  source  = "terraform-google-modules/log-export/google"
  version = "~> 7.3.0"

  destination_uri      = module.logging-destination[0].destination_uri
  log_sink_name        = "${var.org_id}-logbucketsink-${random_id.suffix.hex}"
  parent_resource_id   = var.org_id
  parent_resource_type = "organization"
  include_children     = true
}

module "logging-destination" {
  count   = var.enable_logbucket_destination ? 1 : 0
  source  = "terraform-google-modules/log-export/google//modules/logbucket"
  version = "~> 7.4.1"

  project_id               = module.logging-project.project_id
  name                     = var.logging_logbucket_name
  location                 = var.logging_logbucket_location
  retention_days           = var.logging_logbucket_retention_days
  log_sink_writer_identity = module.logsink-logbucketsink[0].writer_identity
}

module "logsink-gcsbucketsink" {
  count   = var.enable_gcs_destination ? 1 : 0
  source  = "terraform-google-modules/log-export/google"
  version = "~> 7.3.0"

  destination_uri      = module.gcs-destination[0].destination_uri
  log_sink_name        = "${var.org_id}-gcsbucketsink-${random_id.suffix.hex}"
  parent_resource_id   = var.org_id
  parent_resource_type = "organization"
  include_children     = true
}

module "gcs-destination" {
  count                    = var.enable_gcs_destination ? 1 : 0
  source                   = "terraform-google-modules/log-export/google//modules/storage"
  version                  = "~> 7.4.1"
  project_id               = module.logging-project.project_id
  storage_bucket_name      = var.logging_gcsbucket_name
  log_sink_writer_identity = module.logsink-gcsbucketsink[0].writer_identity
}