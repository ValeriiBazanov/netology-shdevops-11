resource "yandex_vpc_subnet" "public_1" {
  name                  = var.public_1_subnet_name
  zone                  = var.public_1_zone_name
  network_id            = yandex_vpc_network.network.id
  v4_cidr_blocks        = var.public_1_cidr
}

resource "yandex_vpc_subnet" "public_2" {
  name                  = var.public_2_subnet_name
  zone                  = var.public_2_zone_name
  network_id            = yandex_vpc_network.network.id
  v4_cidr_blocks        = var.public_2_cidr
}

resource "yandex_vpc_subnet" "public_3" {
  name                  = var.public_3_subnet_name
  zone                  = var.public_3_zone_name
  network_id            = yandex_vpc_network.network.id
  v4_cidr_blocks        = var.public_3_cidr
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
    subnet_id  = yandex_vpc_subnet.public_1.id
    ip_address = var.nat_instance_ip
    nat        = true
  }

  metadata = {
    ssh-keys = "${var.nat_user_name}:${local.ssh-keys}"
  }
}

