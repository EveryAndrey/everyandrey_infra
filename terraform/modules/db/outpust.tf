output "db_external_ip" {
  value = var.enable_provisioner == true ? google_compute_instance.db[*].network_interface.0.access_config.0.nat_ip : google_compute_instance.db_empty[*].network_interface.0.access_config.0.nat_ip
}

output "db_internal_ip" {
  value = var.enable_provisioner == true ? google_compute_instance.db[*].network_interface.0.network_ip : google_compute_instance.db_empty[*].network_interface.0.network_ip
}
