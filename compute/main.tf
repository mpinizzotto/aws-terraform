#compute/main.tf

data "aws_ami" "project-compute-ami" {
  most_recent = true 
  owners = ["amazon"]
    
  filter {
    name = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "project-auth" {
  key_name = "${var.public-key-name}"
  public_key = "${file(var.public-key-path)}"
}

