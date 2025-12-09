variable "name" {
  type        = string
  description = "Name of the Public IP"
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "allocation_method" {
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}
