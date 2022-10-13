# VPC and Subnets
module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = var.project_id
  network_name = var.network_name

  subnets = var.subnets
}

resource "google_compute_firewall" "allow-iap-rdp" {
  count     = var.allow_iap_rdp ? 1 : 0
  name      = var.allow_iap_rdp_fw_name
  network   = module.vpc.network_name
  project   = var.project_id
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

resource "google_compute_firewall" "allow-iap-ssh" {
  count     = var.allow_iap_ssh ? 1 : 0
  name      = var.allow_iap_ssh_fw_name
  network   = module.vpc.network_name
  project   = var.project_id
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

resource "google_compute_firewall" "allow-icmp" {
  count     = var.allow_icmp ? 1 : 0
  name      = var.allow_icmp_fw_name
  network   = module.vpc.network_name
  project   = var.project_id
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

resource "google_compute_router" "router" {
  for_each = var.nat_configs
  name     = each.value.router_name
  project  = var.project_id
  region   = each.key
  network  = module.vpc.network_self_link
}

resource "google_compute_router_nat" "egress" {
  for_each                           = var.nat_configs
  name                               = each.value.router_nat_name
  project                            = var.project_id
  router                             = google_compute_router.router[each.key].name
  region                             = each.key
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = google_compute_address.address[each.key].*.self_link
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    filter = "TRANSLATIONS_ONLY"
    enable = true
  }
}

resource "google_compute_address" "address" {
  for_each = var.nat_configs
  project  = var.project_id
  name     = each.value.nat_address_name
  region   = each.key
}
