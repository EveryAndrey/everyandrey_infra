output "app_external_ip" {
  value = var.enable_provisioner == true ? google_compute_instance.app-prov[*].network_interface.0.access_config.0.nat_ip : google_compute_instance.app-empty[*].network_interface.0.access_config.0.nat_ip
}
