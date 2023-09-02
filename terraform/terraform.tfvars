default_region = "japaneast"
prefix         = "xiao"
padding        = "001"
environment    = "dev"

networking_settings = {
  dns_server                 = "1.1.1.1"
  snet_private_address_space = "10.2.18.0/26"
  snet_bastion_address_space = "10.2.18.64/27"
  vnet_address_space         = "10.2.18.0/24"

  tags = {}
}