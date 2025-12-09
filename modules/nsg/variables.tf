variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the NSG"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the NSG"
}

variable "subnet_ids" {
  type        = map(string)
  description = "Map of subnet IDs to associate with this NSG"
}
