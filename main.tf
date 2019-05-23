provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "psptfs3bucket" {
  bucket = "psptfs3bucket"
}

data "aws_s3_bucket" "psptfs3bucketdata" {
  bucket = "psptfs3bucket"
}

output "psptfs3bucketdataout" {
  value = "${aws_s3_bucket.psptfs3bucket.region}"
}