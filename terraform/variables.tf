variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "yandex_cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "yandex_folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "ubuntu-2004-lts" {
  default = "fd80qjt4v3h9ukucg1di"
}

variable "subnet-zones" {
  type    = list(string)
  default = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
}

variable "cidr" {
  type    = map(list(string))
  default = {
    stage = ["10.10.1.0/24", "10.10.2.0/24", "10.10.4.0/24"]    
  }
}

variable "default_zone_a" {
  type    = string
  default = "ru-central1-a"
}

variable "teamcity_resources_server" {
  type = map(number)
  default = {
    cores          = 4
    memory         = 4
    core_fraction  = 100
    size           = 60
 }
}

variable "teamcity_resources_agent" {
  type = map(number)
  default = {
    cores          = 2
    memory         = 2
    core_fraction  = 20
    size           = 60
 }
}
