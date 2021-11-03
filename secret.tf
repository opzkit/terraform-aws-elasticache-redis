resource "aws_secretsmanager_secret" "cache_secret" {
  name = "cache/redis/${var.identifier}"
}

resource "aws_secretsmanager_secret_version" "cache_secret_value" {
  secret_id     = aws_secretsmanager_secret.cache_secret.id
  secret_string = jsonencode(local.secret_value)
}

locals {
  secret_value = {
    REDIS_HOST = aws_elasticache_cluster.cache.cluster_address
    REDIS_PORT = aws_elasticache_cluster.cache.port
  }
}
