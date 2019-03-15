resource "google_compute_instance" "other_instance" {
  name         = "someinternalhost"
  machine_type = "f1-micro"
  zone    = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }

    network_interface {
        network = "default"
    }
}