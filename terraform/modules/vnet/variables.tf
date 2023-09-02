variable "address_space" {
  description = "The address space for the virtual network"
  type        = string
}

variable "address_space_default_private" {
  description = "The address space for the default private subnet"
  type        = string
}

variable "bastion_address_space" {
  description = "The address space for the bastion subnet"
  type        = string
}

variable "dns_server" {
  description = "List of IP addresses of DNS servers"
  type        = string
}

variable "location" {
  default     = "japaneast"
  description = "The Azure location to provision the resource in"
  type        = string
}

variable "nsg_default_private" {
  description = "The name for private nsg"
  type        = string
}

variable "resource_group_name" {
  description = "The name for the resource group"
  type        = string
}

variable "snet_vm_name" {
  description = "The name for the vm Public Subnet"
  type        = string
}

variable "snet_default_private" {
  description = "The name for the public subnet"
  type        = string
}

variable "tags" {
  default     = {}
  description = "The tags to include for each of the provisioned resources"
  type        = map(string)
}

variable "vnet_name" {
  description = "The name for the vnet"
  type        = string
}

