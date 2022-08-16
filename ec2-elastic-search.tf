resource "aws_instance" "elastic_search_ec2" {
  ami           = var.kibana_ami_name
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.elastic_search_sg.id]
  key_name = "elk-key"
  subnet_id = aws_subnet.private_monitoring.id

  tags = {
    Name = "elastic-search-ec2"
  }
}