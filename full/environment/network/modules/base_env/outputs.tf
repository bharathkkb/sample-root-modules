output "vpc-id" {
  value = module.env-base.network_name
}

output "vpc-host-project-id" {
  value = data.terraform_remote_state.envs.outputs.vpc-host-project-id
}
