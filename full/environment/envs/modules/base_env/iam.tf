
module "team-1-env-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.team-1-env.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "user:bbaiju@google.com",
    ]

    "roles/container.admin" = [
      "user:bbaiju@google.com",
    ]

  }
}

module "team-2-env-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.team-2-env.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "user:bbaiju@google.com",
    ]

    "roles/container.admin" = [
      "user:bbaiju@google.com",
    ]

  }
}

module "team-3-env-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.team-3-env.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "user:bbaiju@google.com",
    ]

    "roles/container.admin" = [
      "user:bbaiju@google.com",
    ]

  }
}
