resource "aws_instance" "kibana_ec2" {
  ami           = var.kibana_ami_id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.elk_sg.id]
  key_name = "elk-key"
  subnet_id = aws_subnet.public_kibana.id

  tags = {
    Name = "kibana-ec2"
  }
}

resource "aws_instance" "elastic_search_ec2" {
  ami           = var.elasticsearch_ami_id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.elk_sg.id]
  key_name = "elk-key"
  subnet_id = aws_subnet.private_monitoring.id

  tags = {
    Name = "elastic-search-ec2"
  }
}

resource "aws_instance" "logstash_ec2" {
  ami           = var.logstash_ami_id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.elk_sg.id]
  key_name = "elk-key"
  subnet_id = aws_subnet.private_monitoring.id

  tags = {
    Name = "logstash-ec2"
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