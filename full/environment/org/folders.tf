resource "google_folder" "common" {
  display_name = "Common ${random_id.suffix.hex}"
  parent       = "organizations/${var.org_id}"
}


resource "google_folder" "team-1" {
  display_name = "Team 1 ${random_id.suffix.hex}"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "team-2" {
  display_name = "Team 2 ${random_id.suffix.hex}"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "team-3" {
  display_name = "Team 3 ${random_id.suffix.hex}"
  parent       = "organizations/${var.org_id}"
}