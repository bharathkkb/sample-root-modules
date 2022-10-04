module "prod" {
  source = "../modules/base_env"
  env    = "prod"
  subnets = [

    {
      subnet_name               = "sub-1"
      subnet_ip                 = "192.192.0.0/24"
      subnet_region             = "northamerica-northeast1"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
    {
      subnet_name               = "sub-2"
      subnet_ip                 = "192.193.0.0/24"
      subnet_region             = "northamerica-northeast2"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
  ]
}