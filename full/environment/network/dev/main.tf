module "dev" {
  source = "../modules/base_env"
  env    = "dev"
  subnets = [

    {
      subnet_name               = "sb-dev-shared-base-1"
      subnet_ip                 = "192.192.0.0/24"
      subnet_region             = "us-central1"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
    {
      subnet_name               = "sb-dev-shared-base-2"
      subnet_ip                 = "192.192.128.0/24"
      subnet_region             = "europe-west1"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
  ]
}