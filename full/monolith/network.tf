# VPC and Subnets
module "dev-base" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = module.vpc-host-dev.project_id
  network_name = "dev-base"

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
  firewall_rules = [
    {
      name      = "dev-base-allow-iap-rdp"
      direction = "INGRESS"
      priority  = 10000
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
      allow = [{
        protocol = "tcp"
        ports    = ["3389"]
      }]
      ranges = [
        "35.235.240.0/20",
      ]
    },
    {
      name      = "dev-base-allow-iap-ssh"
      direction = "INGRESS"
      priority  = 10000
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      ranges = [
        "35.235.240.0/20",
      ]
    },
    {
      name      = "dev-base-allow-icmp"
      direction = "INGRESS"
      priority  = 10000
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
      allow = [{
        protocol = "icmp"
        ports    = null
      }]
      ranges = [
        "10.128.0.0/9",
      ]
    }
  ]
}

# VPC and Subnets
module "network-prod" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = module.vpc-host-prod.project_id
  network_name = "network-prod"

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
  firewall_rules = [
    {
      name      = "network-prod-allow-iap-rdp"
      direction = "INGRESS"
      priority  = 10000

      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }

      allow = [{
        protocol = "tcp"
        ports    = ["3389", ]
      }]

      ranges = [
        "35.235.240.0/20",
      ]
    },
    {
      name      = "network-prod-allow-iap-ssh"
      direction = "INGRESS"
      priority  = 10000

      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }

      allow = [{
        protocol = "tcp"
        ports    = ["22", ]
      }]

      ranges = [
        "35.235.240.0/20",
      ]
    },
    {
      name      = "network-prod-allow-icmp"
      direction = "INGRESS"
      priority  = 10000

      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
      allow = [{
        protocol = "icmp"
        ports    = null
      }]
      ranges = [
        "10.128.0.0/9",
      ]
    }
  ]
}

# VPC and Subnets
module "non-prod-base" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = module.vpc-host-nonprod.project_id
  network_name = "non-prod-base"

  subnets = [

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

  firewall_rules = [
    {
      name      = "non-prod-base-allow-iap-ssh"
      direction = "INGRESS"
      priority  = 10000

      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }

      allow = [{
        protocol = "tcp"
        ports    = ["22", ]
      }]

      ranges = [
        "35.235.240.0/20",
      ]
    },
    {
      name      = "non-prod-base-allow-icmp"
      direction = "INGRESS"
      priority  = 10000

      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }

      allow = [{
        protocol = "icmp"
        ports    = null
      }]

      ranges = [
        "10.128.0.0/9",
      ]
    }
  ]
}

# NAT Router and config
resource "google_compute_address" "ca-non-prod-base-us-central1-1" {
  project = module.vpc-host-nonprod.project_id
  name    = "ca-non-prod-base-us-central1-1"
  region  = "us-central1"
}

module "cr-non-prod-base-us-central1" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 4.0"

  name    = "cr-non-prod-base-us-central1-router"
  project = module.vpc-host-nonprod.project_id
  region  = "us-central1"
  network = module.non-prod-base.network_self_link
  nats = [
    {
      name    = "rn-non-prod-base-us-central1-egress"
      nat_ips = google_compute_address.ca-non-prod-base-us-central1-1.*.self_link
      log_config = {
        filter = "TRANSLATIONS_ONLY"
      }
    }
  ]
}

resource "google_compute_address" "ca-non-prod-base-northamerica-northeast2-1" {
  project = module.vpc-host-nonprod.project_id
  name    = "ca-non-prod-base-northamerica-northeast2-1"
  region  = "northamerica-northeast2"
}

module "cr-non-prod-base-northamerica-northeast2" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 4.0"

  name    = "cr-non-prod-base-northamerica-northeast2-router"
  project = module.vpc-host-nonprod.project_id
  region  = "northamerica-northeast2"
  network = module.non-prod-base.network_self_link
  nats = [
    {
      name    = "rn-non-prod-base-northamerica-northeast2-egress"
      nat_ips = google_compute_address.ca-non-prod-base-northamerica-northeast2-1.*.self_link
      log_config = {
        filter = "TRANSLATIONS_ONLY"
      }
    }
  ]
}
