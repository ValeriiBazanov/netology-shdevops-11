resource "yandex_vpc_route_table" "private-route-table" {
  name       = var.private_rt_name
  network_id = yandex_vpc_network.network.id

  static_route {
    destination_prefix = var.private_rt_destination_prefix
    next_hop_address   = yandex_compute_instance.nat_instance.network_interface.0.ip_address
  }
}

resource "yandex_vpc_subnet" "private_1" {
  name           = var.private_1_subnet_name
  zone           = var.private_1_zone_name
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.private_1_cidr
  route_table_id = yandex_vpc_route_table.private-route-table.id
}

resource "yandex_vpc_subnet" "private_2" {
  name           = var.private_2_subnet_name
  zone           = var.private_2_zone_name
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.private_2_cidr
  route_table_id = yandex_vpc_route_table.private-route-table.id
}