
output "elb-dns-name" {
  value = "${aws_elb.project-elb.dns_name}"
}