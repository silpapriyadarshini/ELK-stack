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

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_region" {
  type    = string
  default = "ap-southeast-2"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0a78e027399584346"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0006587ad07b882a3"
}

variable "security_group_id" {
  type    = string
  default = "sg-0ddf9716dbcfff575"
}

source "amazon-ebs" "elk-kibana" {
  ami_name                    = "ami-kibana-${local.timestamp}"
  instance_type               = var.instance_type
  region                      = var.aws_region
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  security_group_id           = var.security_group_id
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true
  force_deregister            = true
  force_delete_snapshot       = true

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
  provisioner "ansible" {
    playbook_file = "./playbooks/kibana.yml"
  }
}

source "amazon-ebs" "elk-elasticsearch" {
  ami_name                    = "ami-elasticsearch-${local.timestamp}"
  instance_type               = var.instance_type
  region                      = var.aws_region
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  security_group_id           = var.security_group_id
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true
  force_deregister            = true
  force_delete_snapshot       = true

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
    Name = "elasticsearch-ami"
  }
}

build {
  name = "packer-elasticsearch"
  sources = [
    "source.amazon-ebs.elk-elasticsearch"
  ]
  provisioner "ansible" {
    playbook_file = "./playbooks/elastic.yml"
  }
}

source "amazon-ebs" "elk-logstash" {
  ami_name                    = "ami-logstash-${local.timestamp}"
  instance_type               = var.instance_type
  region                      = var.aws_region
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  security_group_id           = var.security_group_id
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true
  force_deregister            = true
  force_delete_snapshot       = true

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
    Name = "logstash-ami"
  }
}

build {
  name = "packer-logstash"
  sources = [
    "source.amazon-ebs.elk-logstash"
  ]
  provisioner "ansible" {
    playbook_file = "./playbooks/logstash.yml"
  }
}

source "amazon-ebs" "elk-beats" {
  ami_name                    = "ami-beats-${local.timestamp}"
  instance_type               = var.instance_type
  region                      = var.aws_region
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  security_group_id           = var.security_group_id
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true
  force_deregister            = true
  force_delete_snapshot       = true

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
    Name = "ami-beats"
  }
}

build {
  name = "packer-demo"
  sources = [
    "source.amazon-ebs.elk-beats"
  ]
  provisioner "ansible" {
    playbook_file = "./playbooks/beats.yml"
  }
}