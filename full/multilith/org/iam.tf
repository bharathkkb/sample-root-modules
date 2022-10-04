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

