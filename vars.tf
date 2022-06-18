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

variable "apply_immediately" {
  type        = bool
  default     = false
  description = "Apply changes immediately"
}
