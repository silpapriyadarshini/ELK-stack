resource "aws_route_table" "internet_route_tbl" {
  vpc_id = aws_vpc.elk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "internet-route-table"
  }
}

resource "aws_route_table" "nat_route_tbl" {
  vpc_id = aws_vpc.elk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "nat-route-table"
  }
}

resource "aws_route_table_association" "public_kibana" {
  subnet_id      = aws_subnet.public_kibana.id
  route_table_id = aws_route_table.internet_route_tbl.id
}

resource "aws_route_table_association" "private_monitr" {
  subnet_id      = aws_subnet.private_monitoring.id
  route_table_id = aws_route_table.nat_route_tbl.id
}

resource "aws_route_table_association" "private_app1" {
  subnet_id      = aws_subnet.private_app1.id
  route_table_id = aws_route_table.nat_route_tbl.id
}

resource "aws_route_table_association" "private_app2" {
  subnet_id      = aws_subnet.private_app2.id
  route_table_id = aws_route_table.nat_route_tbl.id
}

resource "aws_route_table_association" "private_app3" {
  subnet_id      = aws_subnet.private_app3.id
  route_table_id = aws_route_table.nat_route_tbl.id
}