resource "aws_elasticache_subnet_group" "private" {
  name       = "${var.identifier}-cache-subnet-group"
  subnet_ids = var.subnet_ids
}

data "aws_security_group" "security_groups" {
  for_each = toset(var.security_group_names)
  name     = each.value
}

resource "aws_security_group" "allow_redis" {
  vpc_id = var.vpc_id
  name   = "allow-redis-${var.identifier}"
  ingress {
    from_port       = 6379
    protocol        = "tcp"
    to_port         = 6379
    security_groups = [for i, g in data.aws_security_group.security_groups : g.id]
  }

  egress {
    from_port       = 0
    protocol        = "-1"
    to_port         = 0
    security_groups = [for i, g in data.aws_security_group.security_groups : g.id]
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
