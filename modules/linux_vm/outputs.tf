output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "vm_private_ip" {
  value = azurerm_linux_virtual_machine.vm.private_ip_address
}

output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}
