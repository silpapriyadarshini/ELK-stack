# data "aws_ami" "ami-pkr" {
#   most_recent = true
#   owners = [var.owner_id]
  
#   filter {
#     name   = "name"
#     values = [var.ami_name]
#   }
# }

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