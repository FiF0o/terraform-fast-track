provider "aws" { 
  region = "eu-west-2"
}

variable "rds-db-username" {
  type = string
  description = "(required) db username"
}

variable "rds-db-password" {
  type = string
  description = "(required) db pw"
}

# e.g terraform plan -var="rds-db-username=foo" -var="rds-db-password=bar"
resource "aws_db_instance" "myRDS" {
  db_name = "myDB"
  identifier = "my-first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.3.34"
  username = var.rds-db-username
  password = var.rds-db-password
  port = 3306
  allocated_storage = 20
  # skip snapshot when deleting when deleting so tf doesn't fail when deleting
  skip_final_snapshot = true
}
