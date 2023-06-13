variable "cluster_name" {
  type = string
}

variable "app_name" {
  type = string
  default = "cluster" 
}

variable "tier_name_database" {
  type = string
  default = "database" 
}

variable "tier_name_gobuffapp" {
  type = string
  default = "gobuffapp" 
}

variable "gobuffapp_image" {
  type = string
  default = "ghcr.io/remast/gobuff_realworld_example_app/app:latest" 
}

variable "database_image" {
  type = string
  default = "postgres:latest"
}

variable "database_port" {
    type = string
    default = "5432"
}

variable "gobuffapp_port" {
    type = string
    default = "3000"
}

variable "gobuffapp_exposed_port" {
    type = string
    default = "3000"
}

variable "postgres_db" {
    type = string
    default = "gobuff_realworld_example_app_development"
}

variable "postgres_user" {
    type = string
    default = "postgres"
}

variable "postgres_password" {
    type = string
    default = "postgres"
}





