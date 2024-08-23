variable "region" {
  type    = string
  default = ""
}

variable "public_subnets_ids" {
  type    = list(string)
  default = []
}

variable "availability_zones" {
  type    = list(string)
  default = []
}
variable "ssh_public_key_location" {
  type    = string
  default = ""
}

