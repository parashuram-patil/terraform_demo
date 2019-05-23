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
