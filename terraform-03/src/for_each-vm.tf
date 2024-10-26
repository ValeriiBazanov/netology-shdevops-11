data "yandex_compute_image" "db-image" {
    family = var.db_image_family
}

resource "yandex_compute_instance" "database" {

    for_each = {for env in var.db_params : env.vm_name => env}

    name        = each.value.vm_name
    platform_id = each.value.platform_id

    zone = each.value.zone
    resources {
        cores         = each.value.cores
        memory        = each.value.memory
        core_fraction = each.value.core_fraction
    }
    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.db-image.image_id
            type     = each.value.disk_type
            size     = each.value.disk_size
        }
    }
    scheduling_policy {
        preemptible = each.value.preemptible
    }
    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat       = each.value.nat
        security_group_ids = [ 
            yandex_vpc_security_group.example.id
        ]
    }

    metadata = {
        ssh-keys = "${var.db_user}:${local.ssh-keys}"
    }

}