output "Bucket_Name" {
  value = "${module.storage.bucket-name}"
}

output "S3_Region_Name" {
  value = "${module.storage.s3-region-name}"
}
