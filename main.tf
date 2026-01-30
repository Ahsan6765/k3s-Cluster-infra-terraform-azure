# root/main.tf

# Resource Group
module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

# Virtual Network + Subnets
module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_address_space
  subnet_prefixes     = var.subnet_prefixes
  tags                = var.tags
}

# Public IPs (one per VM)
module "public_ip" {
  for_each            = toset(var.vm_names)
  source              = "./modules/public_ip"
  name                = "${each.value}-pip"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  allocation_method   = "Static"
  tags                = merge(var.tags, { Name = "${each.value}-pip", Role = each.value == "kmaster" ? "master" : "worker" })
}

# Network Security Group (associated with subnets from network module)
module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = var.nsg_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  tags                = var.tags

  subnet_ids = module.network.subnet_ids
}

# Network Interfaces (one per VM)
module "nic" {
  for_each            = toset(var.vm_names)
  source              = "./modules/nic"
  name                = "${each.value}-nic"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.network.subnet_ids[0]
  public_ip_id        = module.public_ip[each.value].id
  tags                = merge(var.tags, { Name = "${each.value}-nic", Role = each.value == "kmaster" ? "master" : "worker" })
}
# Linux Virtual Machines (master + workers)
module "linux_vm" {
  for_each             = toset(var.vm_names)
  source               = "./modules/linux_vm"
  name                 = each.value
  location             = module.resource_group.location
  resource_group_name  = module.resource_group.name
  network_interface_id = module.nic[each.value].id
  admin_username       = var.admin_username
  ssh_public_key_path  = var.ssh_public_key_path
  vm_size              = var.vm_size
  tags                 = merge(var.tags, { Name = each.value, Role = each.value == "kmaster" ? "master" : "worker" })
}
