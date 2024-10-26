### variables for count-vm.tf

variable "web_count" {
  type        = number
  default     = 2
  description = "Web count"
}

variable "web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Web image family name"
}

variable "web_platform_id" {
    type        = string
    default     = "standard-v1"
    description = "Web platform Id"
}

variable "web_prefix" {
    type        = string
    default     = "web"
    description = "Web name prefix"
}

variable "web_zone" {
    type        = string
    default     = "ru-central1-a"
    description = "Web zone"
}

variable "web_user_name" {
    type        = string
    default     = "ubuntu"
    description = "Web user name"
}

variable "web_resources" {
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
    description = "Web resources params"
}

variable "web_preemptible" {
    type        = bool
    default     = true
    description = "Web preemptible"
}

variable "web_nat" {
    type        = bool
    default     = true
    description = "Web nat"
}
