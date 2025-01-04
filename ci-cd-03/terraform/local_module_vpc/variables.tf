variable "zone" {
  type = string
  description = "Сетевая зона"
}

variable "cidr" {
  type = list(string)
  description = "cidr"
}

variable "vpc_name" {
  type = string
  description = "VPC network&subnet name"
}