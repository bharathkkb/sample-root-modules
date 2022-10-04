terraform {
  backend "gcs" {
    bucket = "test-backend-multilith-UPDATE-ME"
    prefix = "terraform/envs"
  }
}