variable "group_sa_name" {
  type        = string
  default     = "group-sa"
  description = "Group VM service account name"
}

variable "group_name" {
  type        = string
  default     = "group-ig"
  description = "Group VM name"
}

variable "group_image_id" {
  type        = string
  default     = "fd827b91d99psvq5fjit"
  description = "Group VM image id"
}

variable "group_load_balancer_target_group_name" {
  type        = string
  default     = "target-group"
  description = "Group VM load balancer target group name"
}

variable "group_load_balancer_name" {
  type        = string
  default     = "network-load-balancer-1"
  description = "Group VM load balancer name"
}

variable "group_load_balancer_listener_name" {
  type        = string
  default     = "network-load-balancer-1-listener"
  description = "Group VM load balancer listener name"
}