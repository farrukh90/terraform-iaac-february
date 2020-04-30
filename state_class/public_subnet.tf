resource "aws_subnet" "public1" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "${var.public_cidr1}"
     tags = "${var.tags}"
}
resource "aws_subnet" "public2" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "${var.public_cidr2}"
     tags = "${var.tags}"
}
resource "aws_subnet" "public3" {
    vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "${var.public_cidr3}"
     tags = "${var.tags}"
}
