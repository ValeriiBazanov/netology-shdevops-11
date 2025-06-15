variable "private_1_subnet_name" {
  type        = string
  default     = "private_1"
  description = "Private subnet name"
}

variable "private_rt_destination_prefix" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Private route table destination prefix"
}

variable "private_rt_name" {
  type        = string
  default     = "private_route_table"
  description = "Private route table name"
}

variable "private_1_zone_name" {
  type        = string
  default     = "ru-central1-a"
  description = "Private 1 zone name"
}

variable "private_1_cidr" {
  type        = list(string)
  default     = [ "192.168.20.0/24" ]
  description = "Private subnet cidr"
}

variable "private_2_subnet_name" {
  type        = string
  default     = "private_2"
  description = "Private 2 subnet name"
}

variable "private_2_zone_name" {
  type        = string
  default     = "ru-central1-b"
  description = "Private 2 zone name"
}

variable "private_2_cidr" {
  type        = list(string)
  default     = [ "192.168.30.0/24" ]
  description = "Private 2 subnet cidr"
}
