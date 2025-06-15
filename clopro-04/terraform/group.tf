resource "yandex_iam_service_account" "group-sa" {
  name        = var.group_sa_name
  description = "Service account for managing VM group"
}

resource "yandex_resourcemanager_folder_iam_member" "group-editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.group-sa.id}"
}

resource "yandex_compute_instance_group" "group-ig" {
  name               = var.group_name
  folder_id          = var.folder_id
  service_account_id = "${yandex_iam_service_account.group-sa.id}"
  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      initialize_params {
        image_id = var.group_image_id
     }
    }

    network_interface {
      network_id = "${yandex_vpc_network.network.id}"
      subnet_ids = ["${yandex_vpc_subnet.public.id}"]
    }

    metadata = {
      ssh-keys  = "ubuntu:${local.ssh-keys}"
      user-data = "#!/bin/bash\n cd /var/www/html\n echo \"<html><head><meta charset=\"utf-8\"><title>ДЗ Bucket</title></head><h2>Домашнее задание: &#171;Вычислительные мощности. Балансировщики нагрузки&#187;</h2><img src='https://${yandex_storage_bucket.homework-bucket.bucket_domain_name}/${yandex_storage_object.object-picture.key}'></html>\" > index.html"
    }
    labels = {
      group = "network-load-balanced"
     }

    scheduling_policy {
      preemptible = true
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = [var.zone_name]
  }

  deploy_policy {
    max_unavailable = 2
    max_expansion   = 1
  }

  health_check {
    interval = 2
    timeout = 1
    healthy_threshold = 5
    unhealthy_threshold = 2
    http_options {
      path = "/"
      port = 80
    }
  }

  load_balancer {
    target_group_name        = var.group_load_balancer_target_group_name
    target_group_description = "Target group for network balancer"
  }
}


resource "yandex_lb_network_load_balancer" "group_load_balancer" {
  name = "network-load-balancer-1"

  listener {
    name = var.group_load_balancer_listener_name
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.group-ig.load_balancer.0.target_group_id

    healthcheck {
      name = "http"
      interval = 2
      timeout = 1
      unhealthy_threshold = 2
      healthy_threshold = 5
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
