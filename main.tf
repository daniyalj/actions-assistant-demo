provider "google" {
  region  = "northamerica-northeast1"
  project = "iceberg-234522"
}

terraform {
  backend "gcs" {
    bucket = "iceberg-actions-bucket"
    prefix = "terraform/state"
  }
}
