#networking output.tf

output "vpc-name" {
  value = "${aws_vpc.project-vpc.id}"
}

output "igw-name" {
  value = "${aws_internet_gateway.project-igw.id}"
}
