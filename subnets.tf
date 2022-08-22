resource "aws_subnet" "public_kibana" {
  vpc_id            = aws_vpc.elk_vpc.id
  cidr_block        = var.public_kibana_cidr
  availability_zone = var.aws_az1
  map_public_ip_on_launch = true

  tags = {
    Name = "public-kibana"
  }
}

resource "aws_subnet" "private_monitoring" {
  vpc_id            = aws_vpc.elk_vpc.id
  cidr_block        = var.private_monitoring_cidr
  availability_zone = var.aws_az1
  # map_public_ip_on_launch = true

  tags = {
    Name = "private-monitoring"
  }
}

resource "aws_subnet" "private_app1" {
  vpc_id            = aws_vpc.elk_vpc.id
  cidr_block        = var.private_app1_cidr
  availability_zone = var.aws_az1
  # map_public_ip_on_launch = true

  tags = {
    Name = "private-app1"
  }
}

resource "aws_subnet" "private_app2" {
  vpc_id            = aws_vpc.elk_vpc.id
  cidr_block        = var.private_app2_cidr
  availability_zone = var.aws_az2
  # map_public_ip_on_launch = true

  tags = {
    Name = "private-app2"
  }
}

resource "aws_subnet" "private_app3" {
  vpc_id            = aws_vpc.elk_vpc.id
  cidr_block        = var.private_app3_cidr
  availability_zone = var.aws_az3
  # map_public_ip_on_launch = true

  tags = {
    Name = "private-app3"
  }
}