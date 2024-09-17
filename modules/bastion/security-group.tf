resource "aws_security_group" "bastion-sg" {
  name        = "bastion-sg"        
  description = "Allow incoming traffic to the Bastion EC2 Instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 27017      
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow DoumentDB connections"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming SSH connections"
  }
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
