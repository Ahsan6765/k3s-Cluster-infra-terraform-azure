output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}


output "subnet_ids" {
  value = { for idx, s in azurerm_subnet.subnet : idx => s.id }
}

