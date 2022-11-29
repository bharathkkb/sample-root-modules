
module "common" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.0"

  parent = "organizations/${var.org_id}"
  names = [
    "Common",
  ]
}

module "teams" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 3.0"

  parent = "organizations/${var.org_id}"
  names = [
    "Team 1",
    "Team 2",
    "Team 3"
  ]
}

module "envs" {
  for_each = module.teams.ids
  source   = "terraform-google-modules/folders/google"
  version  = "~> 3.0"

  parent = each.value
  names = [
    "Development",
    "Non-Production",
    "Production",
  ]
}
