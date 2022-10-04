terraform {
  backend "gcs" {
    bucket = "backend-bucket"
    prefix = "terraform/envs"
  }
}