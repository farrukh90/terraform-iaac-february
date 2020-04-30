resource "aws_subnet" "private1" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "${var.private_cidr1}"
     tags = "${var.tags}"
}
resource "aws_subnet" "private2" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "${var.private_cidr2}"
     tags = "${var.tags}"
}
resource "aws_subnet" "private3" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "${var.private_cidr3}"
     tags = "${var.tags}"
}
