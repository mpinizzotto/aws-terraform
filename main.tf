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
    project-name = "${var.project-name}"
    vpc-cidr-block =  "${var.vpc-cidr-block}" 
    vpc-tags = "${var.vpc-tags}"
    igw-tags = "${var.igw-tags}"
    public-rt-tags = "${var.public-rt-tags}"
    private-rt-tags = "${var.private-rt-tags}"
    public-cidr = "${var.public-cidr}"
    public-subnet-tags = "${var.public-subnet-tags}"
    #security
    public-sg = "${var.public-sg}"
    public-sg-tags = "${var.public-sg-tags}"
    external-access-ip = "${var.external-access-ip}"
}
