output "bucket-name" {
  value = "${aws_s3_bucket.code_bucket.id}"
}
