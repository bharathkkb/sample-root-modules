resource "google_folder" "team-1-env" {
  display_name = "${local.envs[var.env]} ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team1_id
}


resource "google_folder" "team-2-env" {
  display_name = "${local.envs[var.env]} ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team2_id
}


resource "google_folder" "team-3-env" {
  display_name = "${local.envs[var.env]} ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team3_id
}

