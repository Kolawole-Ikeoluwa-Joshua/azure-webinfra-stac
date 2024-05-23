# --- root/outputs.tf ---

output "vnet_id" {
  value = module.vnet.vnet_id
}

output "web_tier_nsg_id" {
  value = module.nsg.web_tier_nsg_id
}

output "db_tier_nsg_id" {
  value = module.nsg.db_tier_nsg_id
}

output "web_tier_vm_ids" {
  value = module.vms.web_tier_vm_ids
}

output "db_tier_vm_id" {
  value = module.vms.db_tier_vm_id
}

output "lb_public_ip" {
  value = module.load_balancer.lb_public_ip
}

output "appgw_public_ip" {
  value = module.app_gateway.appgw_public_ip
}

output "sql_server_name" {
  value = module.sql_database.sql_server_name
}

output "sql_database_name" {
  value = module.sql_database.sql_database_name
}

output "key_vault_id" {
  value = module.key_vault.key_vault_id
}

output "recovery_vault_id" {
  value = module.backup.recovery_vault_id
}

output "security_center_admin_emails" {
  value = module.security_center.security_center_admin_emails
}