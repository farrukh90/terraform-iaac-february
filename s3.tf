resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-farrukh-february"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "b2" {
  bucket = "my-tf-test-bucket-farrukh-february2"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}