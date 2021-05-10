variable "project" {
  description = "Project ID"
}
variable "region" {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "disk_image" {
  description = "Disk image"
}

variable "ssh_private_key" {
  type        = string
  description = "private key"
}

variable "zone" {
  type        = string
  default     = "europe-central2-a"
  description = "zone"
}
