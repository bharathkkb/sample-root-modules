output "dev_network_project_id" {
  value = module.dev_base_shared_vpc_host_project.project_id
}

output "prod_network_project_id" {
  value = module.prod_base_shared_vpc_host_project.project_id
}
