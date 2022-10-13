
org_iam = {
  "roles/billing.admin" = [
    "user:bbaiju@google.com",
  ]

  "roles/resourcemanager.organizationAdmin" = [
    "user:bbaiju@google.com",
  ]
}
enable_logbucket_destination = true
logging_logbucket_name       = "example-logdest"
logging_logbucket_location   = "global"

logging_logbucket_retention_days = 123
enable_gcs_destination           = false

common_folder_name = "Common"

teams = [
  {
    name = "Team 1"
    env = [
      {
        name = "Development"
        iam = {
          "roles/compute.instanceAdmin.v1" = [
            "user:bbaiju@google.com",
          ]
          "roles/container.admin" = [
            "user:bbaiju@google.com",
          ]
        }
      },
      {
        name = "Non Production"
        iam = {
          "roles/compute.instanceAdmin.v1" = [
            "user:bbaiju@google.com",
          ]
          "roles/container.admin" = [
            "user:bbaiju@google.com",
          ]
        }
      },
      {
        name = "Production"
        iam = {
          "roles/compute.instanceAdmin.v1" = [
            "user:bbaiju@google.com",
          ]
          "roles/container.admin" = [
            "user:bbaiju@google.com",
          ]
        }
      },
    ]
  },
  {
    name = "Team 2"
    env = [
      {
        name = "Development"
        iam = {
          "roles/compute.instanceAdmin.v1" = [
            "user:bbaiju@google.com",
          ]
          "roles/container.admin" = [
            "user:bbaiju@google.com",
          ]
        }
      },
      {
        name = "Non Production"
        iam = {
          "roles/compute.instanceAdmin.v1" = [
            "user:bbaiju@google.com",
          ]
          "roles/container.admin" = [
            "user:bbaiju@google.com",
          ]
        }
      },
      {
        name = "Production"
        iam = {
          "roles/compute.instanceAdmin.v1" = [
            "user:bbaiju@google.com",
          ]
          "roles/container.admin" = [
            "user:bbaiju@google.com",
          ]
        }
      },
    ]
  }
]

dev_network_name = "dev-base"
dev_subnets = [
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

dev_fw_config = {
  allow_iap_rdp = true
  allow_iap_ssh = true
  allow_icmp    = true
}

prod_network_name = "prod-base"
prod_subnets = [
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

prod_fw_config = {
  allow_iap_rdp = true
  allow_iap_ssh = true
  allow_icmp    = true
}

nonprod_network_name = "nonprod-base"
nonprod_subnets = [

  {
    subnet_name               = "sb-nonprod-shared-base-1"
    subnet_ip                 = "192.192.0.0/24"
    subnet_region             = "us-central1"
    subnet_private_access     = true
    subnet_flow_logs          = true
    subnet_flow_logs_sampling = "0.5"
    subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    subnet_flow_logs_interval = "INTERVAL_10_MIN"
  },
  {
    subnet_name   = "sb-nonprod-shared-base-2"
    subnet_ip     = "10.0.0.0/24"
    subnet_region = "europe-west1"
  },
  {
    subnet_name           = "subnet-non-prod-3"
    subnet_ip             = "10.1.0.0/24"
    subnet_region         = "northamerica-northeast2"
    subnet_private_access = true
  },
]

nonprod_fw_config = {
  allow_iap_rdp = true
  allow_iap_ssh = true
  allow_icmp    = true
}

nonprod_nat_configs = {
  "us-central1" = {
    router_name      = "router-usc1"
    router_nat_name  = "nat-usc1"
    nat_address_name = "address-usc1"
  },
  "us-east1" = {
    router_name      = "router-use1"
    router_nat_name  = "nat-use1"
    nat_address_name = "address-use1"
  }
}