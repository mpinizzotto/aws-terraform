#root vars.tf

variable "aws-region" {
  description = "aws provider region"
}

variable "project-name" {
  description = "aws project name"
}

variable "bucket-acl" {
  description = "s3 bucket acl"
}

variable "bucket-tags" {
  description = "s3 bucket tags"
}

variable "vpc-cidr-block" {
  description = "vpc network cidr block"
}

variable "vpc-tags" {
  description = "vpc tags"
}

variable "igw-tags" {
  description = "igw tags"
}

variable "public-rt-tags" {
  description = "Public route tags"
}

variable "private-rt-tags" {
  description = "Private route tags"
}

variable "public-cidr" {
  description = "Public vpc subnets"
}

variable "public-subnet-tags" {
  description = "Public subnet tags"
}

variable "external-access-ip" {}

variable "public-sg" {}

variable "public-sg-tags" {}

variable "elb-sg" {}

variable "elb-sg-tags" {}

#####Compute#####

#ami owner
variable "ami-owners" {}
#ami name filter
variable "ami-names" {}

variable "public-key-name" {}
variable "public-key-path" {}

variable "instance-count" {
  default = 1
}
variable "instance-type" {}
