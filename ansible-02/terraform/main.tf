module "vpc_dev" {
  source       = "./local_module_vpc"
  vpc_name     = var.vpc_name
  zone         = var.default_zone
  cidr         = var.default_cidr
}

module "clickhouse" {
  source         = "./local_module_vm"
  env_name       = "clickhouse"
  zone_name      = var.default_zone
  subnet_id      = module.vpc_dev.subnet_id
  instance_count = 1
  image_family   = var.image_family

  labels = { 
    owner= "v.bazanov",
    project = "clickhouse"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

module "vector" {
  source         = "./local_module_vm"
  env_name       = "vector"
  zone_name      = var.default_zone
  subnet_id      = module.vpc_dev.subnet_id
  instance_count = 1
  image_family   = var.image_family

  labels = { 
    owner= "v.bazanov",
    project = "vector"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {public_key = var.public_key}
}