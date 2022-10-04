variable "env" {
  type = string
}

variable "subnets" {
  type = list(map(string))
}

variable "allow_rdp" {
  type    = bool
  default = true
}

