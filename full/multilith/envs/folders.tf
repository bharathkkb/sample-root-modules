resource "google_folder" "team-1-development" {
  display_name = "Development ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team1_id
}

resource "google_folder" "team-1-non-production" {
  display_name = "Non-Production ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team1_id
}

resource "google_folder" "team-1-production" {
  display_name = "Production ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team1_id
}

resource "google_folder" "team-2-development" {
  display_name = "Development ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team2_id
}

resource "google_folder" "team-2-non-production" {
  display_name = "Non-Production ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team2_id
}

resource "google_folder" "team-2-production" {
  display_name = "Production ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team2_id
}

resource "google_folder" "team-3-development" {
  display_name = "Development ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team3_id
}

resource "google_folder" "team-3-non-production" {
  display_name = "Non-Production ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team3_id
}

resource "google_folder" "team-3-production" {
  display_name = "Production ${random_id.suffix.hex}"
  parent       = data.terraform_remote_state.org.outputs.folder_team3_id
}
