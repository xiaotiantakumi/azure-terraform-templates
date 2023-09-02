provider "azurerm" {
  features {}
}

# Create vm network interface
resource "azurerm_network_interface" "azure_vm_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.nic_configuration_name
    subnet_id                     = var.default_private_subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

# Public IP for Bastion
resource "azurerm_public_ip" "bastion_public_ip" {
  name                = var.bastion_public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.bastion_public_ip_allocation_method
  sku                 = var.bastion_public_ip_sku
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "vm_storage_account" {
  name                     = var.vm_storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.vm_account_tier
  account_replication_type = var.vm_account_replication_type
  min_tls_version          = var.vm_min_tls_version

  tags = var.tags
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.azure_vm_nic.id]
  size                  = var.vm_size

  os_disk {
    name                 = var.os_disk_name
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_reference_publisher
    offer     = var.source_image_reference_offer
    sku       = var.source_image_reference_sku
    version   = var.source_image_reference_version
  }

  computer_name                   = var.vm_computer_name
  admin_username                  = var.vm_admin_username
  disable_password_authentication = var.vm_disable_password_authentication
  admin_password                  = var.vm_admin_password
}


# Azure Bastion
resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = var.bastion_ip_configuration_name
    subnet_id            = var.bastion_subnet_id
    public_ip_address_id = azurerm_public_ip.bastion_public_ip.id
  }
}