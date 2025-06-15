###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "clopro"
  description = "VPC network name"
}

variable "zone_name" {
  type        = string
  default     = "ru-central1-a"
  description = "Zone name"
}

variable "vm_user_name" {
  type        = string
  default     = "ubuntu"
  description = "VM user"
}

variable "public_key" {
  type        = string
  description = "Public key"
}

variable "image_family" {
    type        = string
    default     = "ubuntu-2004-lts-oslogin"
    description = "Image family name"
}