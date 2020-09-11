output "Bucket_Name" {
  value = "${module.storage.bucket-name}"
}

output "S3_Region_Name" {
  value = "${module.storage.s3-region-name}"
}

output "IGW_Name" {
  value = "${module.networking.igw-name}"
}

output "VPC_Name" {
  value = "${module.networking.vpc-name}"
}
