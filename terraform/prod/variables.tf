variable "project" {
  description = "Project ID"
}
variable "region" {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west3"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable "disk_image_db" {
  description = "Disk image mongo"
}

variable "disk_image_app" {
  description = "Disk image app"
}

variable "ssh_private_key" {
  type        = string
  description = "private key"
}

variable "zone" {
  type        = string
  default     = "europe-west3-a"
  description = "zone"
}

variable "i_count" {
  type    = number
  default = 1
}
