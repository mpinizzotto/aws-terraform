#networking vars.tf

variable "project-name" {}

variable "vpc-cidr-block" {} 

variable "vpc-tags" {}

variable "igw-tags" {}

variable "public-rt-tags" {}

variable "private-rt-tags" {}

variable "public-cidr" {}

variable "public-subnet-tags" {}

variable "external-access-ip" {}

variable "public-sg" {} 

variable "public-sg-tags" {}

variable "elb-sg" {}

variable "elb-sg-tags" {}