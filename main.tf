resource "ovh_domain_name_servers" "domain_name_servers" {
  for_each = var.domain_name_servers

  domain = each.value.domain

  dynamic "servers" {
    for_each = each.value.servers
    content {
      host = servers.value.host
      ip   = servers.value.ip
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create  = timeouts.value.create
      default = timeouts.value.default
      delete  = timeouts.value.delete
      read    = timeouts.value.read
      update  = timeouts.value.update
    }
  }
}

