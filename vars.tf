variable "vpc" {
  type        = object({ id : string, cidr_block : string })
  description = "VPC id to use for the cache"
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "Subnet ids to use for the cache"
}

variable "identifier" {
  type        = string
  description = "Cluster identifier"
}

variable "node_type" {
  type        = string
  description = "Node type to use"
  default     = "cache.t3.micro"
}

variable "engine_version" {
  type        = string
  description = "Engine version to use"
  default     = "7.0"
}

variable "parameter_group_name" {
  type        = string
  description = "Parameter group name to use"
  default     = "default.redis7"
}

variable "apply_immediately" {
  type        = bool
  default     = false
  description = "Apply changes immediately"
}
