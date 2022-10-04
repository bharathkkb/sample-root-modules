terraform {
  backend "gcs" {
    bucket = "test-backend-monolith-UPDATE-ME"
    prefix = "terraform"
  }
}