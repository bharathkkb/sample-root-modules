variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
}

variable "org_id" {
  description = "The organization id for the associated resources"
  type        = string
}

variable "org_iam" {
  description = "Organization IAM bindings"
  type        = map(list(string))
}

variable "enable_logbucket_destination" {
  description = "Enable log sink to logbucket destination"
  type        = bool
}

variable "logging_logbucket_name" {
  description = "Log bucket name for the logsink destination. Only valid if enable_logbucket_destination is set."
  type        = string
}

variable "logging_logbucket_location" {
  description = "Log bucket location. Only valid if enable_logbucket_destination is set."
  type        = string
}

variable "logging_logbucket_retention_days" {
  description = "Retention period in days for log bucket. Only valid if enable_logbucket_destination is set."
  type        = number
}

variable "enable_gcs_destination" {
  type = bool
}

variable "logging_gcsbucket_name" {
  description = "Name for GCS log bucket. Only valid if enable_gcs_destination is set."
  type        = string
  default     = "example-gcsdest"
}

variable "common_folder_name" {
  description = "Display name for common folder"
  type        = string
}

variable "teams" {
  description = "Team resource hierarchy with env and IAM."
  type = set(object({
    name = string
    env = list(object({
      name = string
      iam  = map(list(string))
    }))
  }))
}

variable "dev_network_name" {
  description = "Development VPC name"
  type        = string
}

variable "dev_subnets" {
  description = "Development subnets config"
  type        = list(map(string))

}

variable "dev_fw_config" {
  description = "Development fw config"
  type = object({
    allow_iap_ssh = bool
    allow_icmp    = bool
    allow_iap_rdp = bool
  })
}

variable "dev_nat_configs" {
  description = "Development nat config"
  type = map(object({
    router_name      = string
    router_nat_name  = string
    nat_address_name = string
  }))
  default = {}
}

variable "prod_network_name" {
  description = "Production VPC name"
  type        = string
}

variable "prod_subnets" {
  description = "Production subnets config"
  type        = list(map(string))
}

variable "prod_fw_config" {
  description = "Production fw config"
  type = object({
    allow_iap_ssh = bool
    allow_icmp    = bool
    allow_iap_rdp = bool
  })
}

variable "prod_nat_configs" {
  description = "Production nat config"
  type = map(object({
    router_name      = string
    router_nat_name  = string
    nat_address_name = string
  }))
  default = {}
}


variable "nonprod_network_name" {
  description = "Nonproduction VPC name"
  type        = string
}

variable "nonprod_subnets" {
  description = "Nonproduction subnets config"
  type        = list(map(string))
}

variable "nonprod_fw_config" {
  description = "Nonproduction fw config"
  type = object({
    allow_iap_ssh = bool
    allow_icmp    = bool
    allow_iap_rdp = bool
  })
}

variable "nonprod_nat_configs" {
  description = "Nonproduction nat config"
  type = map(object({
    router_name      = string
    router_nat_name  = string
    nat_address_name = string
  }))
}
