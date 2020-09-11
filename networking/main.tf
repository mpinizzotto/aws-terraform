#networking main.tf

data "aws_availability_zones" "available-az-zones" {}

resource "aws_vpc" "project-vpc" {
  cidr_block = "${var.vpc-cidr-block}"   
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = "${var.vpc-tags}"
}

resource "aws_internet_gateway" "project-igw" {
    vpc_id = "${aws_vpc.project-vpc.id}"
    tags = "${var.igw-tags}"
}

resource "aws_route_table" "project-public-rt" {
    vpc_id = "${aws_vpc.project-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.project-igw.id}"
    }

    tags = "${var.public-rt-tags}"
}
