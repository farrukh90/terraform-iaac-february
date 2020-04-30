
resource "aws_instance" "review_class_web" {
    count = 3
    ami             = "ami-0f7919c33c90f5b58"
    instance_type   = "t2.micro"
    key_name        = "${aws_key_pair.sophie.key_name}"
    security_groups = ["${aws_security_group.review_class.name}"]
    user_data       = "${file("wordpress.sh")}"
}


output "Public IP" {
  value       = "${aws_instance.review_class_web.*.public_ip}"
}


output "Public DNS" {
  value       = "${aws_instance.review_class_web.*.public_dns}"
}
