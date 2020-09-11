provider "aws" {
    region = "${var.aws-region}"
}

module "storage" {
    source = "./storage"
    project-name = "${var.project-name}"
    bucket-acl = "${var.bucket-acl}"
    bucket-tags = "${var.bucket-tags}"
}