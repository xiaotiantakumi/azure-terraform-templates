default_region = "japaneast"
prefix         = "xiao"
padding        = "001"
environment    = "dev"

networking_settings = {
  dns_server                 = "1.1.1.1"
  snet_private_address_space = "10.1.1.0/26"
  snet_bastion_address_space = "10.1.1.64/27"
  vnet_address_space         = "10.1.1.0/24"

  tags = {}
}