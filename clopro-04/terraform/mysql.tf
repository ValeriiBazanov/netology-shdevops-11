resource "yandex_mdb_mysql_cluster" "mysql_cluster" {
  name        = var.mysql_cluster_name
  environment = var.mysql_environment
  network_id  = yandex_vpc_network.network.id
  version     = var.mysql_version

  resources {
    resource_preset_id = "s2.medium"
    disk_type_id       = "network-ssd"
    disk_size          = var.mysql_disk_size
  }

  backup_window_start {
    hours = 23
    minutes = 59
  }

  host {
    zone      = var.private_1_zone_name
    subnet_id = yandex_vpc_subnet.private_1.id
    assign_public_ip = false
  }

  host {
    zone      = var.private_2_zone_name
    subnet_id = yandex_vpc_subnet.private_2.id
    assign_public_ip = false
  }
  
  deletion_protection = true
}

resource "yandex_mdb_mysql_database" "netology_db" {
  cluster_id = yandex_mdb_mysql_cluster.mysql_cluster.id
  name       = var.mysql_db_name
}

resource "yandex_mdb_mysql_user" "dbuser" {
  cluster_id = yandex_mdb_mysql_cluster.mysql_cluster.id
  name       = var.mysql_db_user
  password   = var.mysql_db_password
  permission {
    database_name = yandex_mdb_mysql_database.netology_db.name
    roles         = ["ALL"]
  }
  global_permissions = ["PROCESS"]
}