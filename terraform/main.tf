terraform {
   required_providers {
     yandex = {
       source = "yandex-cloud/yandex"
     }
   }
 }
 provider "yandex" {
  token     = var.yandex_token   # Токен доступа
  cloud_id  = var.cloud_id       # ID твоего облака
  folder_id = var.folder_id      # ID каталога, в котором будут ресурсы
  zone      = "ru-central1-a"
}
