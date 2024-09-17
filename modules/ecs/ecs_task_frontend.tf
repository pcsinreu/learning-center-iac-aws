resource "aws_ecs_task_definition" "front_task" {
  family                   = "frontend-image"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 1024

  container_definitions = <<DEFINITION
[
  {
    "image": "${var.account_id}.dkr.ecr.us-east-1.amazonaws.com/frontend-image:latest",
    "cpu": 256,
    "memory": 1024,
    "name": "frontend-image",
    "networkMode": "awsvpc",
    "linuxParameters": {
	    "initProcessEnabled": true
    },
    "enableExecuteCommand": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
DEFINITION
  execution_role_arn    = aws_iam_role.ecsTaskExecutionRole.arn
  task_role_arn         = aws_iam_role.ecsTaskRole.arn
  tags = {
    Project = var.tag_project_name
  }
}