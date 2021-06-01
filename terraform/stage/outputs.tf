output "app_ip" {
  value = module.app.app_external_ip
}

output "app_db" {
  value = module.db.db_external_ip
}

output "app_db_internal_ip" {
  value = module.db.db_internal_ip
}
