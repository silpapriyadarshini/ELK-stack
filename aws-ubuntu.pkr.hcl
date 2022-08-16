packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "lab_ami-${local.timestamp}"
  instance_type = "t2.micro"

  region                      = "ap-southeast-2"
  vpc_id                      = "vpc-04d8d8b5667a7d902"
  subnet_id                   = "subnet-04740f0eb2901c8c1"
  security_group_id           = "sg-0a823f8af6465dbd7"
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
  tags = {
    Name = "elk-ami"
  }
}

build {
  name = "elk_packer"

  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}