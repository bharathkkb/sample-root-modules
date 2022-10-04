module "org_vm_external_ip_access" {
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 3.0"
  organization_id = var.org_id
  constraint      = "constraints/compute.vmExternalIpAccess"
}

module "org_skip_default_network" {
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 3.0"
  organization_id = var.org_id
  constraint      = "constraints/compute.skipDefaultNetworkCreation"
}