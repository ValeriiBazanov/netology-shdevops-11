resource "yandex_iam_service_account" "bucket-sa" {
  name        = var.bucket_sa_name
  description = "service account for bucket"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.bucket-sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.bucket-sa.id
  description        = "static access key for object storage"
}

resource "yandex_storage_bucket" "homework-bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = var.bucket_name
}

resource "yandex_storage_object" "object-picture" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = yandex_storage_bucket.homework-bucket.id
  key = var.bucket_object_key
  source = var.bucket_object_path
  depends_on = [ yandex_storage_bucket.homework-bucket ]
}