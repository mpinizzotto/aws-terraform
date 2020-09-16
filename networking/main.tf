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

resource "aws_default_route_table" "project-private-rt" {
    default_route_table_id = "${aws_vpc.project-vpc.default_route_table_id}"
    tags = "${var.private-rt-tags}"
}


resource "aws_subnet" "project-public-subnet" {
    count = 2
    vpc_id = "${aws_vpc.project-vpc.id}"
    cidr_block = "${var.public-cidr[count.index]}"
    map_public_ip_on_launch = true
    availability_zone = "${data.aws_availability_zones.available-az-zones.names[count.index]}"
    tags = {
        Name = "${var.project-name}-subnet-${count.index + 1}"
    }
}

resource "aws_route_table_association" "project-public-subnet-assoc" {
    #count = "${aws_subnet.project-public-subnet.count}"
    count = length(aws_subnet.project-public-subnet)
    subnet_id = "${aws_subnet.project-public-subnet.*.id[count.index]}"
    route_table_id = "${aws_route_table.project-public-rt.id}"
}

#instance public rules
resource "aws_security_group" "project-public-sg" {
    name = "${var.public-sg}"
    description = "Rules for access to public instances"
    vpc_id = "${aws_vpc.project-vpc.id}"
    tags = "${var.public-sg-tags}"
}
    
resource "aws_security_group_rule" "allow-ssh" {
    type = "ingress"
    to_port = 22
    from_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.external-access-ip}"]
    security_group_id = "${aws_security_group.project-public-sg.id}"
} 

resource "aws_security_group_rule" "allow-http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${var.external-access-ip}"]
    security_group_id = "${aws_security_group.project-public-sg.id}"
} 
   
resource "aws_security_group_rule" "any-out" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.project-public-sg.id}"
}

#elb security rules

resource "aws_security_group" "project-elb-sg" {
    name = "${var.elb-sg}"
    description = "Rules for access to elb"
    vpc_id = "${aws_vpc.project-vpc.id}"
    tags = "${var.elb-sg-tags}"
}
    
resource "aws_security_group_rule" "elb-allow-in" {
    type = "ingress"
    to_port = 0
    from_port = 0
    protocol = "tcp"
    cidr_blocks = ["${var.external-access-ip}"]
    security_group_id = "${aws_security_group.project-elb-sg.id}"
} 

resource "aws_security_group_rule" "elb-allow-out" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.project-elb-sg.id}"
}


