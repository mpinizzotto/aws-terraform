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