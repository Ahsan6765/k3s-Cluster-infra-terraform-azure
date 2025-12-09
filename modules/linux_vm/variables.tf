variable "name" {
  type        = string
  description = "Name of the VM"
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Size of the virtual machine"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Admin username for the VM"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to the SSH public key file"
}

variable "network_interface_id" {
  type        = string
  description = "ID of the NIC to attach"
}

variable "tags" {
  type    = map(string)
  default = {}
}
