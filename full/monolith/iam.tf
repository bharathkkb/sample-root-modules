module "organization-iam" {
  source  = "terraform-google-modules/iam/google//modules/organizations_iam"
  version = "~> 7.4"

  organizations = [var.org_id]

  bindings = {

    "roles/billing.admin" = [
      "user:bbaiju@google.com",
    ]

    "roles/resourcemanager.organizationAdmin" = [
      "user:bbaiju@google.com",
    ]

  }
}


module "team-1-development-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.team-1-development.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "user:bbaiju@google.com",
    ]

    "roles/container.admin" = [
      "user:bbaiju@google.com",
    ]

  }
}


module "team-1-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.team-1-non-production.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "user:bbaiju@google.com",
    ]

    "roles/container.admin" = [
      "user:bbaiju@google.com",
    ]

  }
}


module "team-2-development-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.team-2-development.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "user:bbaiju@google.com",
    ]

    "roles/container.admin" = [
      "user:bbaiju@google.com",
    ]

  }
}


module "team-2-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.team-2-non-production.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "user:bbaiju@google.com",
    ]

    "roles/container.admin" = [
      "user:bbaiju@google.com",
    ]

  }
}


module "team-3-development-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.team-3-development.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "user:bbaiju@google.com",
    ]

    "roles/container.admin" = [
      "user:bbaiju@google.com",
    ]

  }
}


module "team-3-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.team-3-non-production.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "user:bbaiju@google.com",
    ]

    "roles/container.admin" = [
      "user:bbaiju@google.com",
    ]

  }
}
