variable "security_groups" {
  description = "security groups"
}

variable "vpc" {
  description = "vpc"
}


variable "ssh_public_key_location" {
  type    = string
  default = ""
}

variable "availability_zones" {
  type    = list(string)
  default = []
}