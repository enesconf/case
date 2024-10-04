variable "db_name" {
  description = "PostgreSQL database name for SonarQube"
  type        = string

}

variable "db_user" {
  description = "PostgreSQL user for SonarQube"
  type        = string
}

variable "db_password" {
  description = "PostgreSQL password for SonarQube"
  type        = string
}

variable "persistence_class" {
  description = "Storage class for persistent volume"
  type        = string
}

variable "postgres_host" {
  description = "PostgreSQL host"
  type        = string

}

variable "postgres_port" {
  description = "PostgreSQL port"
  type        = string
  default     = "5432" 
}
