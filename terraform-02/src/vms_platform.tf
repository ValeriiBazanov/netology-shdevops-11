variable "vm_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Image family name"
}

variable "vm_name" {
  type        = string
  default     = "netology-develop-platform-"
  description = "VM web name"
}

variable "vm_web_name" {
  type        = string
  default     = "web"
  description = "VM web name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "VM web platform id"
}

variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-d"
  description = "VM web zone"
}

/*
variable "vm_web_resources_cores" {
  type        = number
  default     = 2
  description = "VM web cores count"
}

variable "vm_web_resources_memory" {
  type        = number
  default     = 2
  description = "VM web memory"
}

variable "vm_web_resources_core_fraction" {
  type        = number
  default     = 20
  description = "VM web core fraction"
}
*/
variable "vm_db_name" {
  type        = string
  default     = "db"
  description = "VM db name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "VM db platform id"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "VM db zone"
}

/*
variable "vm_db_resources_cores" {
  type        = number
  default     = 2
  description = "VM db cores count"
}

variable "vm_db_resources_memory" {
  type        = number
  default     = 2
  description = "VM db memory"
}

variable "vm_db_resources_core_fraction" {
  type        = number
  default     = 20
  description = "VM db core fraction"
}
*/
variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    "web" = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    },
    "db" = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
  description = "VM resources params"
}