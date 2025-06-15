resource "yandex_vpc_subnet" "public" {
  name                  = var.public_subnet_name
  zone                  = var.zone_name
  network_id            = yandex_vpc_network.network.id
  v4_cidr_blocks        = var.public_cidr
}

data "yandex_compute_image" "nat_image" {
  image_id = var.nat_image
}

resource "yandex_compute_instance" "nat_instance" {
  name        = var.nat_instance_name
  hostname    = var.nat_instance_name
  platform_id = var.nat_platform_id
  resources {
    cores         = var.nat_resources.cores
    memory        = var.nat_resources.memory
    core_fraction = var.nat_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.nat_image.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    ip_address = var.nat_instance_ip
    nat        = true
  }

  metadata = {
    ssh-keys = "${var.nat_user_name}:${local.ssh-keys}"
  }
}

