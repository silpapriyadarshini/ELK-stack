resource "aws_instance" "kibana_ec2" {
  ami           = var.kibana_ami_id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.kibana_sg.id]
  key_name = "elk-key"
  subnet_id = aws_subnet.public_kibana.id

  tags = {
    Name = "kibana-ec2"
  }
}

resource "aws_instance" "elastic_search_ec2" {
  ami           = var.elasticsearch_ami_id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.elasticsearch_sg.id]
  key_name = "elk-key"
  subnet_id = aws_subnet.private_monitoring.id
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = "elastic-search-ec2"
  }
}

resource "aws_instance" "logstash_ec2" {
  ami           = var.logstash_ami_id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.logstash_sg.id]
  key_name = "elk-key"
  subnet_id = aws_subnet.private_monitoring.id
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = "logstash-ec2"
  }
}

resource "aws_instance" "demo1_ec2" {
  ami           = var.demo_ami_id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  key_name = "elk-key"
  subnet_id = aws_subnet.private_app1.id
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = "demo1-ec2"
  }
}

# resource "aws_instance" "demo2_ec2" {
#   ami           = var.demo_ami_id
#   instance_type = "t2.micro"

#   vpc_security_group_ids = [aws_security_group.demo_sg.id]
#   key_name = "elk-key"
#   subnet_id = aws_subnet.private_app2.id
#   iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

#   tags = {
#     Name = "demo2-ec2"
#   }
# }

# resource "aws_instance" "demo3_ec2" {
#   ami           = var.demo_ami_id
#   instance_type = "t2.micro"

#   vpc_security_group_ids = [aws_security_group.demo_sg.id]
#   key_name = "elk-key"
#   subnet_id = aws_subnet.private_app3.id
#   iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

#   tags = {
#     Name = "demo3-ec2"
#   }
# }

resource "aws_eip" "kibana_ip" {
  instance = aws_instance.kibana_ec2.id
  vpc = true
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm-profile"
  role = aws_iam_role.ssm_role.id
}