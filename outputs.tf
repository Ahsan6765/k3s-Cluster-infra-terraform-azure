output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.name
}

output "vnet_name" {
  description = "The name of the Virtual Network"
  value = module.network.vnet_id
}

output "subnet_id" {
  description = "The ID of the Subnet"

  value = module.network.subnet_ids[0]
}

output "public_ip_address" {
  description = "The public IP address of the VM"
  value       = [for p in values(module.public_ip) : p.ip_address]
}

output "vm_names" {
  description = "List of VM names"
  value       = [for m in values(module.linux_vm) : m.vm_name]
}

output "vm_private_ips" {
  description = "List of private IPs for VMs"
  value       = [for m in values(module.linux_vm) : m.vm_private_ip]
}
