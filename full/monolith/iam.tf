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

  folders = [module.envs["Team 1"].ids["Development"]]
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

  folders = [module.envs["Team 1"].ids["Non-Production"]]
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

  folders = [module.envs["Team 2"].ids["Development"]]
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

  folders = [module.envs["Team 2"].ids["Non-Production"]]
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

  folders = [module.envs["Team 3"].ids["Development"]]
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

  folders = [module.envs["Team 3"].ids["Non-Production"]]
  bindings = {
    "roles/compute.instanceAdmin.v1" = [
      "user:bbaiju@google.com",
    ]
    "roles/container.admin" = [
      "user:bbaiju@google.com",
    ]
  }
}
