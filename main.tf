provider "kubernetes" {
  config_path = "~/.kube/config"  
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "postgresql" {
  source = "./modules/postgresql"

  db_name          = var.db_name
  db_user          = var.db_user
  db_password      = var.db_password
  persistence_class = var.persistence_class  
  postgres_host    = var.postgres_host      
  postgres_port    = var.postgres_port     
}

module "sonarqube" {
  source           = "./modules/sonarqube"
  db_name          = var.db_name
  db_user          = var.db_user
  db_password      = var.db_password
  persistence_class = var.persistence_class

  depends_on = [module.postgresql]
}


