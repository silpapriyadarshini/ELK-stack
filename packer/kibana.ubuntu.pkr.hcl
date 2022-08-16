packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "ami_prefix" {
  type    = string
  default = "ami_elk"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "elk-kibana" {
  ami_name      = "${var.ami_prefix}-kibana-${local.timestamp}"
  instance_type = "t2.micro"

  region                      = "ap-southeast-2"
  vpc_id                      = "vpc-0971a31ec8b8f684c"
  subnet_id                   = "subnet-026345e6ffad821c4"
  security_group_id           = "sg-0512d1b40bddf544f"
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
    Name = "kibana-ami"
  }
}

build {
  name = "packer-kibana"

  sources = [
    "source.amazon-ebs.elk-kibana"
  ]
  // provisioner "ansible" {
  //   playbook_file = "./playbooks/main.yml"
  // }
}