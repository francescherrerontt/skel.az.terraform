# Terraform Backend state variables required for attachments
variable "resource_group_name" {
  description = "Backend storage resource group"
  type        = string
}
variable "storage_account_name" {
  description = "Backend storage account"
  type        = string
}

variable "container_name" {
  description = "Backend container"
  type        = string
}

variable "subscription_id" {
  description = "Backend subscription_id"
  type        = string
}

# Generic vars

variable "ntt_monitoring" {
  description = "Defines wether the resources should be monitored or not. Possible values: 0, 1"
  type        = string
  default     = "1"
  validation {
    condition     = can(regex("^[01]$", var.ntt_monitoring))
    error_message = "The value of ntt_monitoring must be 0 or 1."
  }
}
variable "ntt_environment" {
  description = "Productive environment type. Possible values: pro, pre, dev, int, qa, dr"
  type        = string
  default     = "dev"
  validation {
    condition     = can(regex("^(pro|pre|int|dev|qa|dr)$", var.ntt_environment))
    error_message = "The vaue of ntt_environment must be one of: pro, pre, dev, int, qa, dr."
  }
}
variable "ntt_platform" {
  description = "The platform represents a group of systems that underpins one or more critical business functions. This grouping is done per environments (Production, Pre-production, DR, Development, etc.) and per specific functions (DMZ, Backup solution, Marketing site, Email service etc.)"
  type        = string
  default     = null
}
variable "ntt_service_group" {
  description = "The service group is a category to group CIs that have a similar function in a platform"
  type        = string
  default     = null
}
variable "ntt_service_level" {
  description = "As defined in Service Now u_service_level_label table: 24x7, EU_10x5, US_10x5"
  default     = "24x7"
  validation {
    condition     = can(regex("^(24x7|EU_10x5|US_10x5)$", var.ntt_service_level))
    error_message = "The vaue of ntt_service_level must be one of: 24x7, EU_10x5, US_10x5."
  }
}
variable "ntt_auto_cloud_iac" {
  description = "NTT IaC environment identified. Create Automation Managed System per deployment."
  type        = string
  default     = null
}
variable "ntt_naming_convention" {
  description = "Set to 'true' to autogenerate resource names using NTT naming convention. Name variables will be used as tags inside the names. Set to 'false' to use name variables as resource names"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Key/Value of global tags to apply to created resources"
  type        = map(any)
  default     = {}
}

variable "resource_tags" {
  description = "Key/Value of tags to apply to created resources"
  type        = map(any)
  default     = {}
}

variable "location" {
  description = "This is the location to deploy resources"
  type        = string
  default     = "westeurope"
}

# Virtual wan

variable "custom_virtual_wan_name" {
  description = "Custom virtual wan name"
  type        = string
  default     = ""
}

variable "virtual_hubs" {
  description = "Virtual hubs to create"
  type        = map(any)
  default     = {}
}

variable "route_tables" {
  description = "Map of virtual hub route tables to create"
  type        = map(any)
  default     = {}
}

variable "vpn_gateways" {
  description = "Map of vpn gateways to create."
  type        = map(any)
  default     = {}
}

variable "vpn_sites" {
  description = "Map of vpn sites to create."
  type        = map(any)
  default     = {}
}

variable "virtual_hub_vpn_connections" {
  description = "Map of virtual hub vpn connections to create."
  type        = map(any)
  default     = {}
}

variable "vpn_server_configurations" {
  description = "Map of virtual hub user vpn server configurations to create."
  type        = map(any)
  default     = {}
}

variable "vpn_client_gateways" {
  description = "Map of virtual hub Point-To-Site User VPN gateways to create."
  type        = map(any)
  default     = {}
}

# Azure FW
variable "azurefws" {
  description = "List of azure fws to deploy"
  type        = map(any)
  default     = {}
}

variable "azurefw_rule_collection_group" {
  description = "List of rule collection groups to add to the firewall policy. Requires `use_firewall_manager` set to `true`"
  default     = {}
}