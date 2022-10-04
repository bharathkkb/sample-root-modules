data "terraform_remote_state" "envs" {
  backend = "gcs"

  config = {
    bucket = "test-backend-envs-UPDATE-ME"
    prefix = "terraform/envs/${var.env}"
  }
}

# VPC and Subnets
module "env-base" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = data.terraform_remote_state.envs.outputs.vpc-host-project-id
  network_name = "${var.env}-base"

  subnets = var.subnets
}

resource "google_compute_firewall" "env-base-allow-iap-rdp" {
  count     = var.allow_rdp ? 1 : 0
  name      = "${var.env}-base-allow-iap-rdp"
  network   = module.env-base.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-project-id
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
resource "google_compute_firewall" "env-base-allow-iap-ssh" {
  name      = "${var.env}-base-allow-iap-ssh"
  network   = module.env-base.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-project-id
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

resource "google_compute_firewall" "env-base-allow-icmp" {
  name      = "${var.env}-base-allow-icmp"
  network   = module.env-base.network_name
  project   = data.terraform_remote_state.envs.outputs.vpc-host-project-id
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