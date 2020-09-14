#compute/main.tf

data "aws_ami" "project-compute-ami" {
  most_recent = true 
  owners = ["${var.ami-owners}"]
    
  filter {
    name = "name"
    #values = ["amzn-ami-hvm*-x86_64-gp2"]
    values = ["${var.ami-names}"]
    
  }
}

data "template_file" "user-init" {
  count = 2
  template = "${file("${path.module}/userdata.tpl")}"
  vars = {
    compute-server-subnets = "${element(var.subnet-ips, count.index)}"
  }
}

resource "aws_key_pair" "project-auth" {
  key_name = "${var.public-key-name}"

  public_key = "${file(var.public-key-path)}"
}
resource "aws_instance" "project-instance" {
  count = "${var.instance-count}"
  instance_type = "${var.instance-type}"
  ami = "${data.aws_ami.project-compute-ami.id}"
  tags = {
    Name = "${var.project-name}-${count.index +1}"
    Environment = "dev"
  }
  key_name = "${aws_key_pair.project-auth.id}"
  vpc_security_group_ids = ["${var.security-group}"]
  subnet_id = "${element(var.subnets, count.index)}"
  user_data = "${data.template_file.user-init.*.rendered[count.index]}"
}
