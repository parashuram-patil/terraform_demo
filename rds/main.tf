provider "aws" {
  region = "${var.region}"
}

variable "region" {}

variable "identifier" {}

resource "aws_db_instance" "tfpspdbinstance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "root"
  password             = "root12345"
  parameter_group_name = "default.mysql5.7"
  identifier           = "${var.identifier}"
}

output "endpoint" {
  value = "${aws_db_instance.tfpspdbinstance.endpoint}"
}
