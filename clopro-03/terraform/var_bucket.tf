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

variable "bucket_enc_key_name" {
  type        = string
  default     = "vbazanov-entcryption-key"
  description = "Bucket encryption key name"
}

variable "bucket_enc_key_algorithm" {
  type        = string
  default     = "AES_256"
  description = "Bucket encryption key algorithm"
}

variable "bucket_enc_key_period" {
  type        = string
  default     = "8760h"
  description = "Bucket encryption key period"
}

variable "bucket_sse_algoritmh" {
  type        = string
  default     = "aws:kms"
  description = "Bucket see algorithm"
}