resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "g1-small"
  zone         = var.zone
  count        = var.enable_provisioner ? 1 : 0
  tags         = ["reddit-db"]
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "andrey:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface[0].access_config[0].nat_ip
    user  = "andrey"
    agent = false
    # путь до приватного ключа
    private_key = file(var.ssh_private_key)
  }

  provisioner "file" {
    source = "../files/deploy-db.sh"
    destination = "/tmp/deploy-db.sh"
  }

  provisioner "remote-exec" {
    inline = ["chmod +x /tmp/deploy-db.sh",
     "/tmp/deploy-db.sh ${self.network_interface[0].network_ip}"]
  }

}

resource "google_compute_instance" "db_empty" {
  name         = "reddit-db"
  machine_type = "g1-small"
  count        = var.enable_provisioner ? 0 : 1
  zone         = var.zone
  tags         = ["reddit-db"]
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "andrey:${file(var.public_key_path)}"
  }

}


resource "google_compute_firewall" "firewall_mongo" {
  name = "allow-mongo-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["27017"]
  }
  target_tags = ["reddit-db"]
  source_tags = ["reddit-app"]
}
