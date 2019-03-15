provider "google" {
  project = "infra-234615"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}
resource "google_compute_address" "static" {
  name = "bastion"
}
resource "google_compute_instance" "vm_instance" {
  name         = "bastion"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }

    network_interface {
        network = "default"
        access_config {
            nat_ip = "${google_compute_address.static.address}"
        }
    }
}

resource "google_compute_firewall" "allow_http" {  
    name = "allow-http"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["80"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["http"]
}

resource "google_compute_firewall" "allow_https" {  
    name = "allow-https"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["443"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["https"]
}