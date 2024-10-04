variable "db_name" {
  description = "PostgreSQL database name for SonarQube"
  type        = string
  default     = "sonarqube_db"
}

variable "db_user" {
  description = "PostgreSQL user for SonarQube"
  type        = string
  default     = "sonarqube_user"
}

variable "db_password" {
  description = "PostgreSQL password for SonarQube"
  type        = string
  default     = "your_secure_password"  
}

variable "persistence_class" {
  description = "Storage class for persistent volume"
  type        = string
  default     = "standard"  
}

variable "postgres_host" {
  description = "PostgreSQL host"
  type        = string
  default     = "my-postgresql"  
}

variable "postgres_port" {
  description = "PostgreSQL port"
  type        = string
  default     = "5432" 
}

variable "postgres_db" {
  description = "PostgreSQL database name"
  type        = string
  default     = "sonarqube_db" 
}

variable "postgres_user" {
  description = "PostgreSQL user"
  type        = string
  default     = "sonarqube_user"  
}

variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  default     = "your_secure_password"  
}
