#elb main.tf

resource "aws_elb" "project-elb" {
  name = "${var.elb-name}"
  #availability_zones = []
  subnets         = "${var.subnets}"
  security_groups = ["${var.elb-sg-id}"]

  #access_logs {
  #  bucket        = "foo"
  #  bucket_prefix = "bar"
  #  interval      = 60
  #}

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 8080
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = "${var.instance-id}"
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = "${var.elb-tags}"
}
