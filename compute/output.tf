#compute output.tf

output "instance-public-ip" {
  value = "${aws_instance.project-instance.*.public_ip}"
}
