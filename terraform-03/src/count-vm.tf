data "yandex_compute_image" "web-image" {
    family = var.web_image_family
}

resource "yandex_compute_instance" "web" {
    depends_on = [yandex_compute_instance.database]

    count = var.web_count

    zone = var.web_zone

    name        = "${var.web_prefix}-${count.index+1}"
    hostname    = "${var.web_prefix}-${count.index+1}"
    platform_id = var.web_platform_id

    resources {
        cores         = var.web_resources.cores
        memory        = var.web_resources.memory
        core_fraction = var.web_resources.core_fraction
    }

    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.web-image.image_id
        }
    }

    metadata = {
        ssh-keys = "${var.web_user_name}:${local.ssh-keys}"
    }

    scheduling_policy { preemptible = var.web_preemptible }

    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat       = var.web_nat
        security_group_ids = [ 
            yandex_vpc_security_group.example.id
        ]
    }

}