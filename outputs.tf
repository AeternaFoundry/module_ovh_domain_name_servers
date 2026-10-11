output "domain_name_servers_id" {
  description = "Map of id values across all domain_name_servers, keyed the same as var.domain_name_servers except keys with no id are omitted"
  value       = { for k, v in ovh_domain_name_servers.domain_name_servers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "domain_name_servers_domain" {
  description = "Map of domain values across all domain_name_servers, keyed the same as var.domain_name_servers except keys with no domain are omitted"
  value       = { for k, v in ovh_domain_name_servers.domain_name_servers : k => v.domain if v.domain != null && length(v.domain) > 0 }
}
output "domain_name_servers_servers" {
  description = "Map of servers values across all domain_name_servers, keyed the same as var.domain_name_servers except keys with no servers are omitted"
  value       = { for k, v in ovh_domain_name_servers.domain_name_servers : k => v.servers if v.servers != null && length(v.servers) > 0 }
}

