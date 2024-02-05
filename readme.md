# Simplified_nsg

## Description

a terraform module that simplifies the creation of an azurerm_network_security_group using predefined rules.

## Requirements

- hashicorp/azurerm

## Usage

```hcl
module "example_nsg"{
    source = "github.com/mmed-hadjnasr/simplified_nsg"
    name="example_nsg"
    location            = "francecentral"
    resource_group_name = "test"
    rules               = ["Allow-SSH-IN","Allow-HTTP-IN"]
}
```

## inputs

| Name | Description | Type |
|------|-------------|------|
| location | The location/region where the network security group is created. | string |
| resource_group_name | The name of the resource group in which to create the network security group. | string |
| custom_rules | The list of custom security rules to apply to the network security group. | list of objects |
| rules | The list of security rules to apply to the network security group. | list of strings |
| name | The name of the network security group. | string |
| local_ip | The local IP address of a local machine. | string |

## list of predefined rules

- Allow-SSH-IN
- Allow-HTTP-IN
- Allow-HTTPS-IN
- Allow-HTTP-OUT
- Allow-HTTPS-OUT
- Deny-All-IN
- Deny-All-OUT
- Allow-All-IN
- Allow-All-OUT
- Allow-RDP-IN
- Allow-RDP-OUT
- Allow-SQL-IN
- Allow-SQL-OUT
- Allow-FTP-IN
- Allow-FTP-OUT
- Allow-SSH-OUT
