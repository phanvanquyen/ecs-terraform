#Application Load Balancer
resource "aws_lb" "load_balancer" {
  name               = "ecs-web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.load_balance_security_group_ids
  subnets            = var.load_balance_subnet_ids
  enable_deletion_protection = false
  enable_http2               = true
  idle_timeout               = 60
  enable_cross_zone_load_balancing = true
  tags = {
    Name = "ecs-web-alb"
  }
}

#Load Balancer Listener
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_target_group.arn
  }
}
#Target Group
resource "aws_lb_target_group" "web_target_group" {
  name        = "web-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "80"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }
}