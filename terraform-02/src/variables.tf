###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1gvdjf0m931r8sh4aca"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gd0mqo6634epth4heq"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-d"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "subnet_b_name" {
  type        = string
  default     = "develop_b"
  description = "Subnet name in zone b"
}

variable "metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys           = string
  }))
  default = {
    "metadata" = {
      serial-port-enable = 1
      ssh-keys           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyZG91mVjwyl6Cml68Fm4NYadwAgj2brGfMfStB1wbtAoi6wMMvp8k1Ggz1NJzrz0J4Xc24ultl/UyaVFtbbT1MtiW0HbbCbvNqo9zWsQa38W9NY05A51ws22tFMG4+VEfsMB2ul04mnUJyUSyth3r3ut+JLnRxxDfxxiX43X0zcznv0mDhI/DcowFW161F8DnK7022E9hSStGfqfIX5AYOPl8JJPU3KfbtMbKENtGq857a9zy1P5+tlEB/g+Ap1lE1VgMpdyoQhCW2Qqhd1c8EH9MfV+y35dbI1acUjugmYztW07fYL9SwXgw1qij0ZKbAB4bp2XstF7K01Y1q8h1oGA6mzZj2ipxTsLWKEdhjnWVCzy2jtiouF0luOoGP3T7aguzPHy0d2UaYYVfFvZHeaX6uYi6WtnFB9v0jS6ADdD7fDBZIiKckfpYgx/KkC3lXDdjslbn3cUjeLka7jI4nhSz+bhLOMIhTJ6Qkr0YVE/ryOTZwx/RpC60ezJu7VM= t1@t1-MEGABOOK-T1"
    }
  }
  description = "VM resources params"
}

###ssh vars

/*
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyZG91mVjwyl6Cml68Fm4NYadwAgj2brGfMfStB1wbtAoi6wMMvp8k1Ggz1NJzrz0J4Xc24ultl/UyaVFtbbT1MtiW0HbbCbvNqo9zWsQa38W9NY05A51ws22tFMG4+VEfsMB2ul04mnUJyUSyth3r3ut+JLnRxxDfxxiX43X0zcznv0mDhI/DcowFW161F8DnK7022E9hSStGfqfIX5AYOPl8JJPU3KfbtMbKENtGq857a9zy1P5+tlEB/g+Ap1lE1VgMpdyoQhCW2Qqhd1c8EH9MfV+y35dbI1acUjugmYztW07fYL9SwXgw1qij0ZKbAB4bp2XstF7K01Y1q8h1oGA6mzZj2ipxTsLWKEdhjnWVCzy2jtiouF0luOoGP3T7aguzPHy0d2UaYYVfFvZHeaX6uYi6WtnFB9v0jS6ADdD7fDBZIiKckfpYgx/KkC3lXDdjslbn3cUjeLka7jI4nhSz+bhLOMIhTJ6Qkr0YVE/ryOTZwx/RpC60ezJu7VM= t1@t1-MEGABOOK-T1"
  description = "ssh-keygen -t ed25519"
}
*/