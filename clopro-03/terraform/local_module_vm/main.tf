data "yandex_compute_image" "vm_image" {
    family = var.image_family
}

resource "yandex_compute_instance" "vm" {
    name        = var.env_name
    hostname    = var.env_name
    platform_id = var.platform_id

    resources {
        cores         = var.instance_cores
        memory        = var.instance_memory
        core_fraction = var.instance_core_fraction
    }

    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.vm_image.image_id
            type     = var.disk_type
            size     = var.disk_size
        }
    }

    scheduling_policy { preemptible = var.preemptible }

    network_interface {
        subnet_id = var.subnet_id
        nat       = var.need_nat
    }

    metadata = {
        for k, v in var.metadata : k => v
    }
    
    labels = {
        for k, v in local.labels : k => v
    }

    allow_stopping_for_update = true

    lifecycle {
        ignore_changes = [
        boot_disk,
        ]
    }

}