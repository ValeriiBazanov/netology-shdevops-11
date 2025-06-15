variable "mysql_cluster_name" {
  type        = string
  default     = "mysql_cluster"
  description = "MySQL cluster name"
}

variable "mysql_environment" {
  type        = string
  default     = "PRESTABLE"
  description = "MySQL cluster environment"
}

variable "mysql_version" {
  type        = string
  default     = "8.0"
  description = "MySQL version"
}

variable "mysql_disk_size" {
  type        = number
  default     = 20
  description = "MySQL disk size"
}

variable "mysql_db_name" {
  type        = string
  default     = "netology_db"
  description = "MySQL db name"
}

variable "mysql_db_user" {
  type        = string
  default     = "dbuser"
  description = "MySQL db user"
}

variable "mysql_db_password" {
  type        = string
  default     = "Password123"
  description = "MySQL db user password"
}