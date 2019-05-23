provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "psptfs3bucket" {
  bucket = "psptfs3bucket"
}