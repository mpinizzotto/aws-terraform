#compute vars.tf
variable "project-name" {}

variable "public-key-name" {}

variable "public-key-path" {}

#list of subnets
variable "subnet-ips" {
    type = list
}

#subnet ids
variable "subnets" {}

variable "instance-count" {}

variable "instance-type" {}

variable "security-group" {}