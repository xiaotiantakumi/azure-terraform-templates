variable "default_region" {
  type = string
}

variable "prefix" {
  type = string
}

variable "padding" {
  type = string
}

variable "environment" {
  type = string
}

variable "vm_admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "vm_admin_password" {
  description = "The admin password for the VM"
  type        = string
}

variable "networking_settings" {
  type = object({
    dns_server                 = string
    snet_bastion_address_space = string
    snet_private_address_space = string
    vnet_address_space         = string
    tags                       = map(string)
  })
}
