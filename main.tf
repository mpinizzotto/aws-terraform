#root main.tf

#terraform {
#  backend "s3" {
#    bucket = "terraform"
#    key = "terraform/terraform.tfstate"
#    region = "us-east-1"
#  }
#}

provider "aws" {
  region = "${var.aws-region}"
}

module "storage" {
  source       = "./storage"
  project-name = "${var.project-name}"
  bucket-acl   = "${var.bucket-acl}"
  bucket-tags  = "${var.bucket-tags}"
}

module "networking" {
  source       = "./networking"
  project-name = "${var.project-name}"
  #networking
  vpc-cidr-block     = "${var.vpc-cidr-block}"
  vpc-tags           = "${var.vpc-tags}"
  igw-tags           = "${var.igw-tags}"
  public-rt-tags     = "${var.public-rt-tags}"
  private-rt-tags    = "${var.private-rt-tags}"
  public-cidr        = "${var.public-cidr}"
  public-subnet-tags = "${var.public-subnet-tags}"
  #security
  public-sg          = "${var.public-sg}"
  public-sg-tags     = "${var.public-sg-tags}"
  external-access-ip = "${var.external-access-ip}"
  elb-sg             = "${var.elb-sg}"
  elb-sg-tags        = "${var.elb-sg-tags}"

}


module "compute" {
  source          = "./compute"
  project-name    = "${var.project-name}"
  ami-owners      = "${var.ami-owners}"
  ami-names       = "${var.ami-names}"
  public-key-name = "${var.public-key-name}"
  public-key-path = "${var.public-key-path}"
  instance-count  = "${var.instance-count}"
  instance-type   = "${var.instance-type}"
  #subnet ids
  subnets         = "${module.networking.public-subnet}"
  #cidrs
  subnet-ips      = "${module.networking.public-subnet-ips}"
  security-group  = "${module.networking.public-sg}"
}

module "elb" {
  source      = "./elb"
  elb-name    = "${var.elb-name}"
  elb-sg-id   = "${module.networking.elb-sg}"
  instance-id = "${module.compute.instance-id}"
  elb-tags    = "${var.elb-tags}"
  subnets     = "${module.networking.public-subnet}"
}


