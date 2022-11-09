resource "aws_lb" "App-alb" {
  name               = "App-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.websg.id]
  subnets            = [aws_subnet.Websubnet-1.id, aws_subnet.Websubnet-2.id]
}

resource "aws_lb_target_group" "target-elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ProjectVpc.id
}

resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.target-elb.arn
  target_id        = aws_instance.PublicInstance1.id
  port             = 80

  depends_on = [
    aws_instance.PublicInstance1,
  ]
}

resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.target-elb.arn
  target_id        = aws_instance.PublicInstance2.id
  port             = 80

  depends_on = [
    aws_instance.PublicInstance2,
  ]
}

resource "aws_lb_listener" "App-alb" {
  load_balancer_arn = aws_lb.App-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-elb.arn
  }
}