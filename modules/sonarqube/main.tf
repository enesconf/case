resource "helm_release" "sonarqube" {
  name       = "my-sonarqube"
  repository = "https://charts.bitnami.com/bitnami"  
  chart      = "sonarqube"
  version    = "6.0.0"  
  timeout = 600

  # Disable the internal PostgreSQL
  set {
    name  = "postgresql.enabled"
    value = "false"  
  }

  # Configure external PostgreSQL database settings
  set {
    name  = "externalDatabase.host"
    value = "my-postgresql"  
  }

  set {
    name  = "externalDatabase.port"
    value = "5432"  
  }

  set {
    name  = "externalDatabase.database"
    value = var.db_name  
  }

  set {
    name  = "externalDatabase.user"
    value = var.db_user 
  }

  set {
    name  = "externalDatabase.password"
    value = var.db_password 
  }

  set {
    name  = "persistence.storageClass"
    value = var.persistence_class
  }

  set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "persistence.size"
    value = "8Gi" 
  }
}

