provider "aws" {
  region = "us-west-1"
}

variable "maxmemory" {
  default = 100
}

variable "maxtimeout" {
  default = 10
}

variable "functioname" {
  default = "test fucntion"
}

variable "rolename" {
  default = "test-role"
  type    = "string"
}

locals {
  owner = "PSP"
  role  = "DevOps"
}

resource "aws_s3_bucket" "psptfs3bucket" {
  bucket = "psptfs3bucket"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "root"
  password             = "root12345"
  parameter_group_name = "default.mysql5.7"
}

data "aws_s3_bucket" "psptfs3bucketdata" {
  bucket = "psptfs3bucket"
}

data "aws_lambda_function" "psptflambdadata" {
  function_name = "pspJavafunction"
}

output "psptfs3bucketdataout" {
  value = "${aws_s3_bucket.psptfs3bucket.region}"
}

output "psptflambdadataout" {
  value = "${data.aws_lambda_function.psptflambdadata.handler}"
}

output "printvars" {
  value = "${var.maxtimeout}, ${var.rolename}, ${var.functioname}"
}

output "printlocalvars" {
  value = "${local.owner}, ${local.role}"
}

module "tflambdamodule" {
  source = "./lambda"
}
