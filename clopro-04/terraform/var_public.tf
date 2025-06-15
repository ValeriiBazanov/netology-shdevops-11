variable "public_1_subnet_name" {
  type        = string
  default     = "public_1"
  description = "Public 1 subnet name"
}

variable "public_2_subnet_name" {
  type        = string
  default     = "public_2"
  description = "Public 2 subnet name"
}

variable "public_3_subnet_name" {
  type        = string
  default     = "public_3"
  description = "Public 3 subnet name"
}

variable "public_1_zone_name" {
  type        = string
  default     = "ru-central1-a"
  description = "Public 1 zone name"
}

variable "public_2_zone_name" {
  type        = string
  default     = "ru-central1-b"
  description = "Public 2 zone name"
}

variable "public_3_zone_name" {
  type        = string
  default     = "ru-central1-d"
  description = "Public 3 zone name"
}

variable "nat_image" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
  description = "Yandex.Compute image ID"
}

variable "public_1_cidr" {
  type        = list(string)
  default     = [ "192.168.10.0/24" ]
  description = "Public 1 subnet cidr"
}

variable "public_2_cidr" {
  type        = list(string)
  default     = [ "192.168.40.0/24" ]
  description = "Public 2 subnet cidr"
}

variable "public_3_cidr" {
  type        = list(string)
  default     = [ "192.168.50.0/24" ]
  description = "Public 3 subnet cidr"
}

variable "nat_instance_ip" {
  type        = string
  default     = "192.168.10.254"
  description = "NAT instanse IP"
}

variable "nat_user_name" {
  type        = string
  default     = "ubuntu"
  description = "NAT user"
}

variable "nat_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "NAT platform id"
}

variable "nat_instance_name" {
  type        = string
  default     = "nat-instance"
  description = "NAT instance name"
}

variable "nat_resources" {
    type = object({
        cores         = number
        memory        = number
        core_fraction = number
    })
    default =  {
        cores         = 2
        memory        = 2
        core_fraction = 20
    }
    description = "NAT resources params"
}

