provider "aws" {
  region = "us-west-1"
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