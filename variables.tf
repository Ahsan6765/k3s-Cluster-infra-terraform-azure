# root/variables.tf

variable "rg_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region for all resources"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all resources"
}

# Network
variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network"
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "Address prefixes for the subnets"
}

# NSG
variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group"
}

# Public IP
variable "public_ip_name" {
  type        = string
  description = "Name of the Public IP"
}

# NIC
variable "nic_name" {
  type        = string
  description = "Name of the Network Interface"
}

# Linux VM
variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

# Names for multiple VMs (master + workers)
variable "vm_names" {
  type        = list(string)
  description = "List of VM names to create (e.g. [\"kmaster\", \"kworker1\", \"kworker2\"])"
  default     = ["kmaster", "kworker1", "kworker2"]
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Size of the Virtual Machine"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Admin password for the VM"
}

# SSH Public Key Path for Linux VM
variable "ssh_public_key_path" {
  type        = string
  description = "Path to the SSH public key file for the Linux VM."
}
