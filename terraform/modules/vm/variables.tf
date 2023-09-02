variable "location" {
  default     = "japaneast"
  description = "The Azure location to provision the resource in"
  type        = string
}

variable "resource_group_name" {
  description = "The name for the resource group"
  type        = string
}

variable "tags" {
  default     = {}
  description = "The tags to include for each of the provisioned resources"
  type        = map(string)
}

variable "public_ip_allocation_method" {
  description = "The public ip allocation method"
  type        = string
}

variable "ip_sku" {
  description = "The sku for the vm"
  type        = string
}

variable "vm_storage_account_name" {
  description = "The name of the storage account for the vm"
  type        = string
}
variable "vm_account_tier" {
  description = "The tier for the vm storage account"
  type        = string
}
variable "vm_account_replication_type" {
  description = "The replication type for the vm storage account"
  type        = string
}
variable "vm_min_tls_version" {
  description = "The minimum tls version for the vm storage account"
  type        = string
}
variable "nic_name" {
  description = "The name for the nic"
  type        = string
}

variable "nic_configuration_name" {
  description = "The name for the nic configuration"
  type        = string
}

variable "nic_bastion_name" {
  description = "The name for the nic"
  type        = string
}

variable "nic_bastion_configuration_name" {
  description = "The name for the nic configuration"
  type        = string
}

variable "vm_name" {
  description = "The name for the vm"
  type        = string
}

variable "vm_size" {
  description = "The size of the vm"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "The private ip address allocation"
  type        = string
}

variable "bastion_public_ip_name" {
  description = "The name for the bastion public ip"
  type        = string
}

variable "bastion_public_ip_allocation_method" {
  description = "The public ip allocation method"
  type        = string
}

variable "bastion_public_ip_sku" {
  description = "The sku for the bastion public ip"
  type        = string
}

variable "os_disk_name" {
  description = "The name for the os disk"
  type        = string
}

variable "os_disk_caching" {
  description = "The caching for the os disk"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "The storage account type for the os disk"
  type        = string
}

variable "source_image_reference_publisher" {
  description = "The publisher for the image"
  type        = string
}

variable "source_image_reference_offer" {
  description = "The offer for the image"
  type        = string
}

variable "source_image_reference_sku" {
  description = "The sku for the image"
  type        = string
}

variable "source_image_reference_version" {
  description = "The version for the image"
  type        = string
}

variable "vm_computer_name" {
  description = "The computer name for the chuncker vm"
  type        = string
}

variable "vm_admin_username" {
  description = "The admin username for the chuncker vm"
  type        = string
}

variable "vm_disable_password_authentication" {
  description = "The disable password authentication for the chuncker vm"
  type        = bool
}

variable "vm_admin_password" {
  description = "The admin password for the chuncker vm"
  type        = string
}

variable "bastion_name" {
  description = "The name for the bastion"
  type        = string
}

variable "bastion_ip_configuration_name" {
  description = "The name for the bastion ip configuration"
  type        = string
}

variable "default_private_subnet_id" {
  description = "The id for the default private subnet"
  type        = string
}

variable "bastion_subnet_id" {
  description = "The id for the bastion subnet"
  type        = string
}