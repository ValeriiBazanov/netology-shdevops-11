resource "yandex_iam_service_account" "k8s" {
  name        = "k8s"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.k8s.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s-kms-encrypter" {
  folder_id = var.folder_id
  role      = "kms.keys.encrypter"
  member    = "serviceAccount:${yandex_iam_service_account.k8s.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s-kms-decrypter" {
  folder_id = var.folder_id
  role      = "kms.keys.decrypter"
  member    = "serviceAccount:${yandex_iam_service_account.k8s.id}"
}

resource "yandex_iam_service_account_static_access_key" "k8s-key" {
  service_account_id = yandex_iam_service_account.k8s.id
  description        = "static access key for object storage"
}

resource "yandex_kms_symmetric_key" "encryptkey" {
  name              = "encryptkey"
  default_algorithm = "AES_256"
}

resource "yandex_kubernetes_cluster" "regional-k8s" {
  name        = "regional-k8s"

  network_id = yandex_vpc_network.network.id

  master {
    regional {
      region = "ru-central1"

      location {
        zone      = yandex_vpc_subnet.public_1.zone
        subnet_id = yandex_vpc_subnet.public_1.id
      }

      location {
        zone      = yandex_vpc_subnet.public_2.zone
        subnet_id = yandex_vpc_subnet.public_2.id
      }

      location {
        zone      = yandex_vpc_subnet.public_3.zone
        subnet_id = yandex_vpc_subnet.public_3.id
      }
    }
   
    version   = "1.30"
    public_ip = true

  }

  service_account_id      = yandex_iam_service_account.k8s.id
  node_service_account_id = yandex_iam_service_account.k8s.id

  kms_provider {
    key_id = yandex_kms_symmetric_key.encryptkey.id
  }
  release_channel = "STABLE"
}


resource "yandex_kubernetes_node_group" "k8s-node-group-a" {
  cluster_id  = yandex_kubernetes_cluster.regional-k8s.id
  name        = "k8s-node-group-a"

  version     = "1.30"

  labels = {
    "key" = "k8s-node-group-a"
  }

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat        = true
      subnet_ids = ["${yandex_vpc_subnet.public_1.id}"]
       }

    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = true
    }

    container_runtime {
      type = "containerd"
    }
      metadata = {
        ssh-keys  = "ubuntu:${local.ssh-keys}"
    }
  }

  scale_policy {
    auto_scale {
      initial = 3
      min = 3
      max = 6
    }
  }

  allocation_policy {
    location {
      zone = var.zone_name
    } 
  } 
}