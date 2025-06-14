resource "yandex_vpc_network" "network" {
  name = var.vpc_name
}

module "public-vm" {
  source = "./local_module_vm"
  env_name = "public-vm"
  subnet_id = yandex_vpc_subnet.public.id
  need_nat = true

  labels = { 
    owner = "v.bazanov",
    project = "clopro"
  }

  metadata = {
    ssh-keys = "${var.vm_user_name}:${local.ssh-keys}"
  }
}

module "private-vm" {
  source = "./local_module_vm"
  env_name = "private-vm"
  subnet_id = yandex_vpc_subnet.private.id
  need_nat = false

  labels = { 
    owner = "v.bazanov",
    project = "clopro"
  }

  metadata = {
    ssh-keys = "${var.vm_user_name}:${local.ssh-keys}"
  }
}
