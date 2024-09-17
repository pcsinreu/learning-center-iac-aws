resource "aws_security_group" "lb-internal" {
  name   = "internal-alb-security-group"
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 5002
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = var.tag_project_name
  }
}

resource "aws_lb" "internal-default" {
  name            = "demo-app-internal"
  internal        = false
  subnets         = [var.public_subnets_ids[0], var.public_subnets_ids[1]]
  security_groups = [aws_security_group.lb-internal.id]

  tags = {
    Project = var.tag_project_name
  }

  access_logs {
    bucket  = aws_s3_bucket.alb_logs.id
    prefix  = "logs-alb-internal"
    enabled = true
  }
}
# [PORTS UNDER REVISION]
resource "aws_lb_target_group" "internal-alb" {
  name        = "target-group-backend"
  port        = 5002
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  tags = {
    Project = var.tag_project_name
  }

  health_check {
    healthy_threshold   = "3"
    interval            = "300"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/v1/healthcheck"
    unhealthy_threshold = "2"
  }
}

resource "aws_lb_listener" "internal_alb_listener" {
  load_balancer_arn = aws_lb.internal-default.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.internal-alb.id
    type             = "forward"
  }
  tags = {
    Project = var.tag_project_name
  }
}

