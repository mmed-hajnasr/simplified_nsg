variable "location" {
  description = "The location/region where the network security group is created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the network security group."
  type        = string
}

variable "custom_rules" {
    description = "The list of custom security rules to apply to the network security group."
    type        = list(object({
        name                       = string
        priority                   = number
        direction                  = string
        access                     = string
        protocol                   = string
        source_port_range          = string
        destination_port_range     = string
        source_address_prefix      = string
        destination_address_prefix = string
    }))
    default = []
}

variable "rules" {
    description = "The list of security rules to apply to the network security group."
    type        = list(string)
    default = []
    validation {
      condition = length([for rule in var.rules : rule if contains(local.predefined_rules, rule)]) == length(var.rules)
      error_message = "this predefined rule does not exist, please add it to local.predefined_rules./n available: ${local.predefined_rules}"
    }
}

variable "subnets" {
  description = "The list of subnets to associate with the network security group."
  type       = list(string)
}

variable "name" {
  description = "The name of the network security group."
  type        = string
  default = module.naming.network_security_group.name_unique
}