# VPC and Subnets
module "dev-base" {
  source       = "./modules/network"
  project_id   = module.vpc-host-dev.project_id
  network_name = var.dev_network_name

  subnets       = var.dev_subnets
  allow_iap_ssh = var.dev_fw_config.allow_iap_ssh
  allow_icmp    = var.dev_fw_config.allow_icmp
  allow_iap_rdp = var.dev_fw_config.allow_iap_rdp
  nat_configs   = var.dev_nat_configs
}

# VPC and Subnets
module "network-prod" {
  source = "./modules/network"

  project_id   = module.vpc-host-prod.project_id
  network_name = var.prod_network_name

  subnets       = var.prod_subnets
  allow_iap_ssh = var.prod_fw_config.allow_iap_ssh
  allow_icmp    = var.prod_fw_config.allow_icmp
  allow_iap_rdp = var.prod_fw_config.allow_iap_rdp
  nat_configs   = var.prod_nat_configs
}

# VPC and Subnets
module "non-prod-base" {
  source = "./modules/network"

  project_id   = module.vpc-host-nonprod.project_id
  network_name = var.nonprod_network_name

  subnets       = var.nonprod_subnets
  allow_iap_ssh = var.nonprod_fw_config.allow_icmp
  allow_icmp    = var.nonprod_fw_config.allow_icmp
  allow_iap_rdp = var.nonprod_fw_config.allow_icmp
  nat_configs   = var.nonprod_nat_configs
}
