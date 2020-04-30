resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
}

# Private subnets
########################################################################################################################
resource "aws_subnet" "private1" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"
}
resource "aws_subnet" "private2" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.2.0/24"
}
resource "aws_subnet" "private3" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.3.0/24"
}
########################################################################################################################


# Public Subnet
########################################################################################################################
resource "aws_subnet" "public1" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.101.0/24"
}
resource "aws_subnet" "public2" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.102.0/24"
}
resource "aws_subnet" "public3" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.103.0/24"
}
########################################################################################################################

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
}


# resource "aws_nat_gateway" "gw" {
#   allocation_id = "${aws_eip.nat.id}"
#   subnet_id     = "${aws_subnet.public[1].id}"
# }

resource "aws_eip" "nat" {
  vpc      = true
}


resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

# Route Table association
resource "aws_route_table_association" "b1" {
  subnet_id      = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "b2" {
  subnet_id      = "${aws_subnet.public2.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "b3" {
  subnet_id      = "${aws_subnet.public3.id}"
  route_table_id = "${aws_route_table.r.id}"
}