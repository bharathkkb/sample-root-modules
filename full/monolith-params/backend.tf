terraform {
  backend "gcs" {
    bucket = "test-monolith-param-example-back1"
    prefix = "terraform"
  }
}