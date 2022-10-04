resource "google_folder" "common" {
  display_name = "Common ${random_id.suffix.hex}"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "team-1" {
  display_name = "Team 1 ${random_id.suffix.hex}"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "team-1-development" {
  display_name = "Development ${random_id.suffix.hex}"
  parent       = google_folder.team-1.name
}

resource "google_folder" "team-1-non-production" {
  display_name = "Non-Production ${random_id.suffix.hex}"
  parent       = google_folder.team-1.name
}

resource "google_folder" "team-1-production" {
  display_name = "Production ${random_id.suffix.hex}"
  parent       = google_folder.team-1.name
}

resource "google_folder" "team-2" {
  display_name = "Team 2 ${random_id.suffix.hex}"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "team-2-development" {
  display_name = "Development ${random_id.suffix.hex}"
  parent       = google_folder.team-2.name
}

resource "google_folder" "team-2-non-production" {
  display_name = "Non-Production ${random_id.suffix.hex}"
  parent       = google_folder.team-2.name
}

resource "google_folder" "team-2-production" {
  display_name = "Production ${random_id.suffix.hex}"
  parent       = google_folder.team-2.name
}

resource "google_folder" "team-3" {
  display_name = "Team 3 ${random_id.suffix.hex}"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "team-3-development" {
  display_name = "Development ${random_id.suffix.hex}"
  parent       = google_folder.team-3.name
}

resource "google_folder" "team-3-non-production" {
  display_name = "Non-Production ${random_id.suffix.hex}"
  parent       = google_folder.team-3.name
}

resource "google_folder" "team-3-production" {
  display_name = "Production ${random_id.suffix.hex}"
  parent       = google_folder.team-3.name
}
