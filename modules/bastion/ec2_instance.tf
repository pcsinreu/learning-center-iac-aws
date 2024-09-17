resource "aws_instance" "bastion_host" {
  ami                         = var.ec2_ami
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnets_ids[0]
  vpc_security_group_ids      = [aws_security_group.bastion-sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key_pair.key_name

  tags = {
    Project = var.tag_project_name
    Name    = "bastion_host"
  }
}


# Create Elastic IP for the EC2 instance  
resource "aws_eip" "redhat-eip" {
  domain = "vpc"
  tags = {
    Name    = "eip_bastion"
    Project = var.tag_project_name
  }
}
# Associate Elastic IP to the EC2 instance  
resource "aws_eip_association" "redhat-eip-association" {
  instance_id   = aws_instance.bastion_host.id
  allocation_id = aws_eip.redhat-eip.id
}
