resource "aws_ecs_service" "frontend_service" {
  name            = "frontend-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.front_task.arn
  desired_count   = "2"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.sg_task.id]
    subnets         = [var.private_subnets_ids[0], var.private_subnets_ids[1]]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.alb.id
    container_name   = "frontend-image"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.alb_listener]

  tags = {
    Project = var.tag_project_name
  }
}

resource "aws_security_group" "sg_task" {
  name   = "task-security-group"
  vpc_id = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = var.tag_project_name
  }
}


