#compute vars.tf
variable "project-name" {}

#ami owner
variable "ami-owners" {}
    
#ami name filter
variable "ami-names" {}

variable "public-key-name" {}

variable "public-key-path" {}

#list of subnets
variable "subnet-ips" {
    type = list
}

#aws subnet ids
variable "subnets" {}

variable "instance-count" {}

variable "instance-type" {}

variable "security-group" {}