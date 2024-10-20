output "task" {

  value = [
    { web = "${yandex_compute_instance.platform.name} - ${yandex_compute_instance.platform.network_interface.0.nat_ip_address} - ${yandex_compute_instance.platform.fqdn}" },
    { db = "${yandex_compute_instance.database.name} - ${yandex_compute_instance.database.network_interface.0.nat_ip_address} - ${yandex_compute_instance.database.fqdn}" }
  ]

  description = "Task 4"
}