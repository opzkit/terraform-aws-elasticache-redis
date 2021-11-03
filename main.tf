resource "aws_elasticache_subnet_group" "private" {
  name       = "cache-subnet"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "allow_redis" {
  vpc_id = var.vpc.id

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [var.vpc.cidr_block]
  }
}

resource "aws_elasticache_cluster" "cache" {
  cluster_id           = var.identifier
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  engine_version       = "6.x"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.private.name
  security_group_ids = [
    aws_security_group.allow_redis.id
  ]
}
