resource "helm_release" "postgresql" {
  name       = "my-postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "16.0.0"

  set {
    name  = "auth.postgresPassword"
    value = var.db_password  
  }
  set {
    name  = "global.postgresql.auth.postgresPassword"
    value = var.db_password 
  }
  set {
    name  = "auth.username"
    value = var.db_user  
  }

  set {
    name  = "auth.password"
    value = var.db_password  
  }

  set {
    name  = "auth.database"
    value = var.db_name  
  }

  set {
    name  = "persistence.enabled"
    value = "true"  
  }

  set {
    name  = "persistence.storageClass"
    value = var.persistence_class  
  }

  set {
    name  = "persistence.size"
    value = "8Gi"  
  }
}
