resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.elk_vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_eip" "nat_eip" {
  vpc      = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_kibana.id

  tags = {
    Name = "nat-gateway"
  }
  depends_on = [aws_internet_gateway.igw]
}