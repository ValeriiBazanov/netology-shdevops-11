module "vpc_dev" {
  source       = "./local_module_vpc"
  vpc_name     = var.vpc_name
  zone         = var.default_zone
  cidr         = var.default_cidr
}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=0049a0c47c805c2552e16f7bca2581a7feae0f14"
  env_name       = "marketing" 
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = "marketing"
  instance_count = 1
  image_family   = var.image
  public_ip      = var.is_public_ip

  labels = { 
    owner= "v.bazanov",
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

module "analystics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=0049a0c47c805c2552e16f7bca2581a7feae0f14"
  env_name       = "analystics"
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = "analystics"
  instance_count = 1
  image_family   = var.image
  public_ip      = var.is_public_ip

  labels = { 
    owner= "v.bazanov",
    project = "analystics"
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