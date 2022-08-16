resource "aws_instance" "kibana_ec2" {
  ami           = var.ami_name
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.kibana_sg.id]
  key_name = "elk-key"
  subnet_id = aws_subnet.public_kibana.id

  tags = {
    Name = "kibana-ec2"
  }
}

resource "aws_eip" "kibana_ip" {
  instance = aws_instance.kibana_ec2.id
  vpc = true
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm-profile"
  role = aws_iam_role.ssm_role.id
}