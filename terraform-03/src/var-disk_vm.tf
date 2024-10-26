### variables for disk-vm.tf

variable "disk_count" {
    type        = number
    default     = 3
    description = "Disk count"
}

variable "disk_prefix" {
    type        = string
    default     = "disk"
    description = "Disk prefix"
}

variable "disk_size" {
    type        = number
    default     = 1
    description = "Disk size"
}

variable "disk_type" {
    type        = string
    default     = "network-hdd"
    description = "Disk type"
}

variable "disk_zone" {
    type        = string
    default     = "ru-central1-a"
    description = "Disk zone"
}

variable "disk_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Disk image family name"
}

variable "disk_name" {
    type        = string
    default     = "storage"
    description = "Disk name"
}

variable "disk_platform_id" {
    type        = string
    default     = "standard-v1"
    description = "Disk platform Id"
}

variable "disk_resources" {
    type = object({
        cores         = number
        memory        = number
        core_fraction = number
    })
    default =  {
        cores         = 2
        memory        = 1
        core_fraction = 20
    }
    description = "Disk resources params"
}

variable "disk_user_name" {
    type        = string
    default     = "ubuntu"
    description = "Disk user name"
}

variable "disk_preemptible" {
    type        = bool
    default     = true
    description = "Disk preemptible"
}

variable "disk_nat" {
    type        = bool
    default     = true
    description = "Disk nat"
}