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
  tags = ["http-server","https-server"]

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
  provisioner "remote-exec" {
    inline = [
      "curl https://gist.githubusercontent.com/Nklya/df07e99e63e4043e6a699060a7e30b66/raw/d5d572755ea811ac7d4e1b7b47d5f0c9527693b3/setupvpn.sh | bash",
      "sudo bash setupvpn.sh"
    ]

    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file("/Users/admin/.ssh/ubuntu")}"
    }

  }
}

resource "google_compute_firewall" "allow_http" {  
    name = "default-allow-http"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["80"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["http-server"]
}

resource "google_compute_firewall" "allow_https" {  
    name = "default-allow-https"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["443"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["https-server"]
}