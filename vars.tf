variable "vpc_id" {
  type        = string
  description = "Id of the VPC to create the cache in"
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "Subnet ids to use for the cache"
}

variable "security_group" {
  type        = string
  description = "Security group name to allow traffic from"
}
