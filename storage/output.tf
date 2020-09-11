output "bucket-name" {
  value = "${aws_s3_bucket.code_bucket.id}"
}

output "s3-region-name" {
  value = "${aws_s3_bucket.code_bucket.region}"
}
