variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable "disk_image" {
  description = "Disk image app"
}

variable "zone" {
  type        = string
  default     = "europe-west3-a"
  description = "zone"
}

variable "ssh_private_key" {
  type        = string
  description = "private key"
}

variable enable_provisioner {
  type        = bool
  description = "enable provisioners"
  default     = true
}
