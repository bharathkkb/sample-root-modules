terraform {
  backend "gcs" {
    bucket = "test-backend-envs-UPDATE-ME"
    prefix = "terraform/network/dev"
  }
}