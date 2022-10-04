output "vpc-host-dev" {
  value = module.vpc-host-dev.project_id
}

output "vpc-host-nonprod" {
  value = module.vpc-host-nonprod.project_id
}

output "vpc-host-prod" {
  value = module.vpc-host-prod.project_id
}
