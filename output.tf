#root/output.tf

output "s3_bucket_name" {
  value = "${module.storage.bucket-name}"
}

output "s3_region_name" {
  value = "${module.storage.s3-region-name}"
}

output "igw_name" {
  value = "${module.networking.igw-name}"
}

output "vpc_name" {
  value = "${module.networking.vpc-name}"
}

output "elb_dns_name" {
    value = "${module.elb.elb-dns-name}"
}

output "instance_public_ips" {
  value = "${join(", ", module.compute.instance-public-ip)}"
}

#output "instance_id" {
#  value = "${module.compute.instance-id}"
#}
