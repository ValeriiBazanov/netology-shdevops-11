variable "private_subnet_name" {
  type        = string
  default     = "private"
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

variable "private_cidr" {
  type        = list(string)
  default     = [ "192.168.20.0/24" ]
  description = "Private subnet cidr"
}