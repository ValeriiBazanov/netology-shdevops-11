resource "yandex_iam_service_account" "bucket-sa" {
  name        = var.bucket_sa_name
  description = "service account for bucket"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.bucket-sa.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-kms-encrypter" {
  folder_id = var.folder_id
  role      = "kms.keys.encrypter"
  member    = "serviceAccount:${yandex_iam_service_account.bucket-sa.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-kms-decrypter" {
  folder_id = var.folder_id
  role      = "kms.keys.decrypter"
  member    = "serviceAccount:${yandex_iam_service_account.bucket-sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.bucket-sa.id
  description        = "static access key for object storage"
}

resource "yandex_kms_symmetric_key" "bucket-key" {
  name = var.bucket_enc_key_name
  description = "Key for encrypting bucket objects"
  default_algorithm = var.bucket_enc_key_algorithm
  rotation_period = var.bucket_enc_key_period
}

resource "yandex_storage_bucket" "homework-bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = var.bucket_name
  anonymous_access_flags {
    read = true
    list = true
    config_read = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.bucket-key.id
        sse_algorithm = var.bucket_sse_algoritmh
      }
    }
  }
}

resource "yandex_storage_object" "object-picture" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = yandex_storage_bucket.homework-bucket.id
  key = var.bucket_object_key
  source = var.bucket_object_path
  depends_on = [ yandex_storage_bucket.homework-bucket ]
}