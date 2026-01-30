variable "name" {
  type        = string
  description = "Name of the NIC"
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "public_ip_id" {
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
}
