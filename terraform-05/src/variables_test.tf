variable "ip_address" {
  type = string
   description = "IP адрес"
  validation {
    condition     = can(cidrnetmask("${var.ip_address}/32"))
    error_message = "Некорректный IP"
  }
}

variable "ip_address_list" {
  type        = list(string)
  description = "Список IP адресов"
  validation {
    condition = alltrue([
      for a in var.ip_address_list : can(cidrnetmask("${a}/32"))
    ])
    error_message = "В списке передан некорректный IP"
  }
}