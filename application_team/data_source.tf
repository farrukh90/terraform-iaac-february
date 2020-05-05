data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
  bucket = "state-class-farrukh"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output "public1" {
  value       =  "${substr("${data.terraform_remote_state.infra.public_subnets[0]}", 0, 20)}"
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
    subnet_id   =   "${substr("${data.terraform_remote_state.infra.public_subnets[0]}", 0, 20)}"
}
