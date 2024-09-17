#ecsTaskExecutionRole
resource "aws_iam_role" "ecsTaskExecutionRole" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_ecsTaskExecutionRole.json
}

data "aws_iam_policy_document" "assume_role_policy_ecsTaskExecutionRole" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

#ECSTaskRole
resource "aws_iam_role" "ecsTaskRole" {
  name               = "ecsTaskRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_ecsTaskRole.json
}

data "aws_iam_policy_document" "assume_role_policy_ecsTaskRole" {
  statement {

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = ["${var.account_id}"]
    }

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = ["arn:aws:ecs:us-east-1:${var.account_id}:*"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecsTaskRole_policy_attachment" {
  role       = aws_iam_role.ecsTaskRole.name
  policy_arn = aws_iam_policy.ecsTaskRole_policy.arn
}

resource "aws_iam_policy" "ecsTaskRole_policy" {
  name   = "ECS-taskrole-policy"
  policy = data.aws_iam_policy_document.ecsTaskRole_data_policy.json
}

data "aws_iam_policy_document" "ecsTaskRole_data_policy" {
  statement {
    effect = "Allow"
    actions = ["ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
    "ssmmessages:OpenDataChannel"]
    resources = ["*"]
  }
}
