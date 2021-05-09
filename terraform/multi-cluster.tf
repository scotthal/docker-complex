terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.66.1"
    }
  }
}

provider "google" {
  credentials = file("credential.json")
  project     = "grider-k8s"
  region      = "us-west"
  zone        = "us-west1-c"
}

resource "google_container_cluster" "multi-cluster" {
  name               = "multi-cluster"
  initial_node_count = 3
  node_config {
    disk_size_gb = 10
    image_type   = "COS_CONTAINERD"
    machine_type = "e2-small"
    preemptible  = true
  }
}