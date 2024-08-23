variable "region" {
  type    = string
  default = ""
}

variable "availability_zones" {
  type    = list(string)
  default = []
}
variable "ssh_public_key_location" {
  type    = string
  default = ""
}

variable "vpc_cidr_blocks" {
  type    = list(string)
  default = []
}
