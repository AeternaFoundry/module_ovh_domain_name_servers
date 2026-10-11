variable "domain_name_servers" {
  description = <<EOT
Map of domain_name_servers, attributes below
Required:
    - domain
    - servers (block):
        - host (required)
        - ip (optional)
Optional:
    - timeouts (block):
        - create (optional)
        - default (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    domain = string
    servers = list(object({
      host = string
      ip   = optional(string)
    }))
    timeouts = optional(object({
      create  = optional(string)
      default = optional(string)
      delete  = optional(string)
      read    = optional(string)
      update  = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.domain_name_servers : (
        length(v.servers) >= 2 && length(v.servers) <= 8
      )
    ])
    error_message = "Each servers list must contain between 2 and 8 items"
  }
}

