resource "aws_ecs_service" "backend_app_service" {
  name            = "backend-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.back_task.arn
  desired_count   = "2"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.internal_sg_task.id]
    subnets         = [var.private_subnets_ids[0], var.private_subnets_ids[1]]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.internal-alb.id
    container_name   = "backend-image"
    container_port   = 5002
  }

  depends_on = [aws_lb_listener.internal_alb_listener]

  tags = {
    Project = var.tag_project_name
  }
}

resource "aws_security_group" "internal_sg_task" {
  name   = "internal-task-security-group"
  vpc_id = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 5002
    to_port         = 5002
    security_groups = [aws_security_group.lb-internal.id]
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
