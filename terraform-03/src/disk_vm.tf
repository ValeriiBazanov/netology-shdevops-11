data "yandex_compute_image" "disk-image" {
    family = var.disk_image
}

resource "yandex_compute_disk" "sec_disk" {
    count = var.disk_count
    name  = "${var.disk_prefix}-${count.index}"
    size  = var.disk_size
    type  = var.disk_type
    zone  = var.disk_zone
}

resource "yandex_compute_instance" "storage" {

    zone = var.disk_zone

    name        = var.disk_name
    hostname    = var.disk_name
    platform_id = var.disk_platform_id

    resources {
        cores         = var.disk_resources.cores
        memory        = var.disk_resources.memory
        core_fraction = var.disk_resources.core_fraction
    }

    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.disk-image.image_id
        }
    }

    metadata = {
        ssh-keys = "${var.disk_user_name}:${local.ssh-keys}"
    }

    scheduling_policy { preemptible = var.disk_preemptible }

    dynamic secondary_disk {
        for_each = "${yandex_compute_disk.sec_disk.*.id}"
        content {
                disk_id = yandex_compute_disk.sec_disk["${secondary_disk.key}"].id
        }
    }

    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat       = var.disk_nat
        security_group_ids = [ 
            yandex_vpc_security_group.example.id
        ]
    }

}