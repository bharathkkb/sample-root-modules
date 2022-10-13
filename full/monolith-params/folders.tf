locals {
  team_folders = [for team in var.teams : team.name]
  team_env_folder = flatten([for team in var.teams :
    [for env in team.env :
      {
        name   = "${team.name} ${env.name}"
        parent = team.name
        iam    = env.iam
      }
    ]
    ]
  )
}

resource "google_folder" "common" {
  display_name = var.common_folder_name
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "teams" {
  for_each     = toset(local.team_folders)
  display_name = "${each.value} ${random_id.suffix.hex}"
  parent       = "organizations/${var.org_id}"
}


resource "google_folder" "team_envs" {
  for_each = {
    for tm in local.team_env_folder : tm.name => tm
  }
  display_name = "${each.key} ${random_id.suffix.hex}"
  parent       = google_folder.teams[each.value.parent].name
}
