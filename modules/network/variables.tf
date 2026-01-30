variable "vnet_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnet_prefixes" {
  type = list(string)
}

variable "nsg_name" {
  type    = string
  default = "nsg-default"
}

variable "tags" {
  type    = map(string)
  default = {}
}
