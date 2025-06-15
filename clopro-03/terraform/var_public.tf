variable "public_subnet_name" {
  type        = string
  default     = "public"
  description = "Public subnet name"
}

variable "nat_image" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
  description = "Yandex.Compute image ID"
}

variable "public_cidr" {
  type        = list(string)
  default     = [ "192.168.10.0/24" ]
  description = "Public subnet cidr"
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

