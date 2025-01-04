module "vpc_dev" {
  source       = "./local_module_vpc"
  vpc_name     = var.vpc_name
  zone         = var.default_zone
  cidr         = var.default_cidr
}

module "sonar" {
  source         = "./local_module_vm"
  env_name       = "sonar-01"
  zone_name      = var.default_zone
  subnet_id      = module.vpc_dev.subnet_id
  instance_count = 1
  instance_cores = 2
  instance_memory = 4
  image_family   = var.image_family

  labels = { 
    owner= "v.bazanov",
    project = "sonar"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

module "nexus" {
  source         = "./local_module_vm"
  env_name       = "nexus-01"
  zone_name      = var.default_zone
  subnet_id      = module.vpc_dev.subnet_id
  instance_count = 1
  instance_cores = 2
  instance_memory = 4
  image_family   = var.image_family

  labels = { 
    owner= "v.bazanov",
    project = "nexus"
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