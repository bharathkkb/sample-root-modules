module "nonprod" {
  source = "../modules/base_env"
  env    = "nonprod"
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
  allow_rdp = false
}

# NAT Router and config
resource "google_compute_router" "cr-non-prod-base-us-central1-router" {
  name    = "cr-non-prod-base-us-central1-router"
  project = module.nonprod.vpc-host-project-id
  region  = "us-central1"
  network = module.nonprod.vpc-id
}

resource "google_compute_router_nat" "rn-non-prod-base-us-central1-egress" {
  name                               = "rn-non-prod-base-us-central1-egress"
  project                            = module.nonprod.vpc-host-project-id
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
  project = module.nonprod.vpc-host-project-id
  name    = "ca-non-prod-base-us-central1-1"
  region  = "us-central1"
}
resource "google_compute_router" "cr-non-prod-base-northamerica-northeast2-router" {
  name    = "cr-non-prod-base-northamerica-northeast2-router"
  project = module.nonprod.vpc-host-project-id
  region  = "northamerica-northeast2"
  network = module.nonprod.vpc-id
}

resource "google_compute_router_nat" "rn-non-prod-base-northamerica-northeast2-egress" {
  name                               = "rn-non-prod-base-northamerica-northeast2-egress"
  project                            = module.nonprod.vpc-host-project-id
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
  project = module.nonprod.vpc-host-project-id
  name    = "ca-non-prod-base-northamerica-northeast2-1"
  region  = "northamerica-northeast2"
}