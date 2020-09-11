#root main.tf

provider "aws" {
    region = "${var.aws-region}"
}

module "storage" {
    source = "./storage"
    project-name = "${var.project-name}"
    bucket-acl = "${var.bucket-acl}"
    bucket-tags = "${var.bucket-tags}"
}

module "networking" {
    source = "./networking"
    vpc-cidr-block =  "${var.vpc-cidr-block}" 
    vpc-tags = "${var.vpc-tags}"
    igw-tags = "${var.igw-tags}"
    public-rt-tags = "${var.public-rt-tags}"
    private-rt-tags = "${var.private-rt-tags}"
}
