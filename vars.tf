variable "vpc" {
  type        = object({ id : string, cidr_block : string })
  description = "The VPC to create the cache in"
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
