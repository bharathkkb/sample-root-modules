data "terraform_remote_state" "envs" {
  backend = "gcs"

  config = {
    bucket = "test-backend-multilith-UPDATE-ME"
    prefix = "terraform/envs"
  }
}

# VPC and Subnets
module "dev-base" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = data.terraform_remote_state.envs.outputs.vpc-host-dev
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
}
# Firewall Rules
resource "google_compute_firewall" "dev-base-allow-iap-rdp" {
  name      = "dev-base-allow-iap-rdp"
  network   = module.dev-base.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-dev
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["3389", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "dev-base-allow-iap-ssh" {
  name      = "dev-base-allow-iap-ssh"
  network   = module.dev-base.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-dev
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "dev-base-allow-icmp" {
  name      = "dev-base-allow-icmp"
  network   = module.dev-base.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-dev
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}

# VPC and Subnets
module "network-prod" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = data.terraform_remote_state.envs.outputs.vpc-host-prod
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
}
# Firewall Rules
resource "google_compute_firewall" "network-prod-allow-iap-rdp" {
  name      = "network-prod-allow-iap-rdp"
  network   = module.network-prod.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-prod
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["3389", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "network-prod-allow-iap-ssh" {
  name      = "network-prod-allow-iap-ssh"
  network   = module.network-prod.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-prod
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "network-prod-allow-icmp" {
  name      = "network-prod-allow-icmp"
  network   = module.network-prod.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-prod
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}

# VPC and Subnets
module "non-prod-base" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = data.terraform_remote_state.envs.outputs.vpc-host-nonprod
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
}
# Firewall Rules
resource "google_compute_firewall" "non-prod-base-allow-iap-ssh" {
  name      = "non-prod-base-allow-iap-ssh"
  network   = module.non-prod-base.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-nonprod
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "non-prod-base-allow-icmp" {
  name      = "non-prod-base-allow-icmp"
  network   = module.non-prod-base.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-nonprod
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}
# NAT Router and config
resource "google_compute_router" "cr-non-prod-base-us-central1-router" {
  name    = "cr-non-prod-base-us-central1-router"
  project = data.terraform_remote_state.envs.outputs.vpc-host-nonprod
  region  = "us-central1"
  network = module.non-prod-base.network_self_link
}

resource "google_compute_router_nat" "rn-non-prod-base-us-central1-egress" {
  name                               = "rn-non-prod-base-us-central1-egress"
  project                            = data.terraform_remote_state.envs.outputs.vpc-host-nonprod
  router                             = google_compute_router.cr-non-prod-base-us-central1-router.name
  region                             = "us-central1"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = google_compute_address.ca-non-prod-base-us-central1-1.*.self_link
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    filter = "TRANSLATIONS_ONLY"
    enable = true
  }
}

resource "google_compute_address" "ca-non-prod-base-us-central1-1" {
  project = data.terraform_remote_state.envs.outputs.vpc-host-nonprod
  name    = "ca-non-prod-base-us-central1-1"
  region  = "us-central1"
}
resource "google_compute_router" "cr-non-prod-base-northamerica-northeast2-router" {
  name    = "cr-non-prod-base-northamerica-northeast2-router"
  project = data.terraform_remote_state.envs.outputs.vpc-host-nonprod
  region  = "northamerica-northeast2"
  network = module.non-prod-base.network_self_link
}

resource "google_compute_router_nat" "rn-non-prod-base-northamerica-northeast2-egress" {
  name                               = "rn-non-prod-base-northamerica-northeast2-egress"
  project                            = data.terraform_remote_state.envs.outputs.vpc-host-nonprod
  router                             = google_compute_router.cr-non-prod-base-northamerica-northeast2-router.name
  region                             = "northamerica-northeast2"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = google_compute_address.ca-non-prod-base-northamerica-northeast2-1.*.self_link
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    filter = "TRANSLATIONS_ONLY"
    enable = true
  }
}

resource "google_compute_address" "ca-non-prod-base-northamerica-northeast2-1" {
  project = data.terraform_remote_state.envs.outputs.vpc-host-nonprod
  name    = "ca-non-prod-base-northamerica-northeast2-1"
  region  = "northamerica-northeast2"
}
