module "organization-iam" {
  source  = "terraform-google-modules/iam/google//modules/organizations_iam"
  version = "~> 7.4"

  organizations = [var.org_id]
  bindings      = var.org_iam
}


module "team-folder-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"
  for_each = {
    for tm in local.team_env_folder : tm.name => tm
  }

  folders = [google_folder.team_envs[each.key].name]

  bindings = each.value.iam
}

