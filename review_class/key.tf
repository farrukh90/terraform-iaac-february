resource "aws_key_pair" "sophie" {
  key_name   = "farrukhs_bastion"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}