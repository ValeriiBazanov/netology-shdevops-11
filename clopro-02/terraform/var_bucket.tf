variable "bucket_name" {
  type        = string
  default     = "vbazanov-14062025"
  description = "Bucket name"
}

variable "bucket_sa_name" {
  type        = string
  default     = "bucket-sa"
  description = "Bucket service account name"
}

variable "bucket_object_path" {
  type        = string
  default     = "content/cat.jpeg"
  description = "Bucket object path"
}

variable "bucket_object_key" {
  type        = string
  default     = "homework_image"
  description = "Bucket object key"
}