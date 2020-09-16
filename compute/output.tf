#compute output.tf

output "instance-public-ip" {
  value = "${aws_instance.project-instance.*.public_ip}"
}

output  "instance-id" {
  value = "${aws_instance.project-instance.*.id}"
}


