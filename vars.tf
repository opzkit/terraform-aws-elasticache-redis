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

variable "security_group_names" {
  type        = list(string)
  description = "List of security group names that should have access to the cache cluster"
}
