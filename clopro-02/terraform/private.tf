resource "yandex_vpc_route_table" "private-route-table" {
  name       = var.private_rt_name
  network_id = yandex_vpc_network.network.id

  static_route {
    destination_prefix = var.private_rt_destination_prefix
    next_hop_address   = yandex_compute_instance.nat_instance.network_interface.0.ip_address
  }
}

resource "yandex_vpc_subnet" "private" {
  name           = var.private_subnet_name
  zone           = var.zone_name
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.private_cidr
  route_table_id = yandex_vpc_route_table.private-route-table.id
}