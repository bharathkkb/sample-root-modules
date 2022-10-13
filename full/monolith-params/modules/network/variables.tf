variable "project_id" {
  description = "VPC project ID"
  type        = string

}

variable "network_name" {
  description = "VPC name"
  type        = string
}

variable "subnets" {
  description = "List of subnets"
  type        = list(map(string))
}

variable "allow_iap_rdp" {
  description = "Create IAP RDP FW rule"
  default     = true
}

variable "allow_iap_rdp_fw_name" {
  description = "Name for IAP RDP FW rule "
  default     = "iap-rdp-fw"
}

variable "allow_iap_ssh" {
  description = "Create IAP RDP FW rule"
  default     = true
}

variable "allow_iap_ssh_fw_name" {
  description = "Name for IAP SSH FW rule "
  default     = "iap-ssh-fw"
}

variable "allow_icmp" {
  description = "Create ICMP FW rule"
  default     = true
}

variable "allow_icmp_fw_name" {
  description = "Name for ICMP FW rule "
  default     = "icmp-fw"
}

variable "nat_configs" {
  type = map(object({
    router_name      = string
    router_nat_name  = string
    nat_address_name = string
  }))
  default = {}
}