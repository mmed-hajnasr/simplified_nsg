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
  type = list(object({
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
  default     = []
}

variable "name" {
  description = "The name of the network security group."
  type        = string
}

variable "local_ip" {
  description = "The local IP address of a local machine."
  type        = string
  default     = "0.0.0.0"
}
