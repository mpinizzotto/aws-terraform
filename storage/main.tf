#storage main.tf

#create random id for s3 bucket
resource "random_id" "s3_bucket_id" {
  byte_length = 2
}

#create s3 bucket
resource "aws_s3_bucket" "code_bucket" {
  bucket = "${var.project-name}-${random_id.s3_bucket_id.dec}"
  acl = "${var.bucket-acl}"
  force_destroy = true
  tags = "${var.bucket-tags}"
}
