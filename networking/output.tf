#networking output.tf

output "vpc-name" {
  value = "${aws_vpc.project-vpc.id}"
}

output "igw-name" {
  value = "${aws_internet_gateway.project-igw.id}"
}

output "public-subnet" {
  value =  "${aws_subnet.project-public-subnet.*.id}"
}

output "public-subnet-ips" {
  value =  "${aws_subnet.project-public-subnet.*.cidr_block}"
}

output "public-sg" {
  value = "${aws_security_group.project-public-sg.id}"
}

output "elb-sg" {
  value = "${aws_security_group.project-elb-sg.id}"
}

