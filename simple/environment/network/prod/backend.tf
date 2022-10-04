terraform {
  backend "gcs" {
    bucket = "backend-bucket"
    prefix = "terraform/networks/prod"
  }
}