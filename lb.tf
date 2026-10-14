resource "aws_lb" "my-alb" {
  name               = "my-alb"
  internal           = "false"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_ssh.id]
  subnets = [
    aws_subnet.public.id,
    aws_subnet.private.id
  ]
}

resource "aws_lb_target_group" "my-target" {
  name     = "my-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.default.id
  health_check {
    path     = "/health"
    port     = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "my-target-attachment" {
  target_group_arn = aws_lb_target_group.my-target.arn
  target_id        = aws_instance.servers.id
  port             = 80
  depends_on = [
    aws_lb_target_group.my-target,
    aws_instance.servers,
  ]
}


resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.my-alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-target.arn
  }

  tags = {
    Name = "my-alb"
  }

}