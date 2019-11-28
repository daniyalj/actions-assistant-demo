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

resource "random_id" "instance_id" {
   byte_length = 8
}

resource "google_compute_instance" "default" {
  name         = "assistant-instance-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone         = "northamerica-northeast1"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
 }
