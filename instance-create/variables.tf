variable "instance_type" {
  type = string
}

variable "region" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "ami" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_group" {
  type = list(string)
}