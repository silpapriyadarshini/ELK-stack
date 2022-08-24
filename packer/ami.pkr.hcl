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
  default = "vpc-06c9e2ba5ec6d6d2d"
}

variable "subnet_id" {
  type    = string
  default = "subnet-05b96b34b3bba542a"
}

variable "security_group_id" {
  type    = string
  default = "sg-09c9dd9bde8281939"
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
  force_deregister            = "true"
  force_delete_snapshot       = "true"

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
  force_deregister            = "true"
  force_delete_snapshot       = "true"

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
    playbook_file = "./playbooks/elasticsearch.yml"
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
  force_deregister            = "true"
  force_delete_snapshot       = "true"

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

source "amazon-ebs" "elk-demo1-filebeat" {
  ami_name                    = "ami-demo1-filebeat-${local.timestamp}"
  instance_type               = var.instance_type
  region                      = var.aws_region
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  security_group_id           = var.security_group_id
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true
  force_deregister            = "true"
  force_delete_snapshot       = "true"

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
    Name = "demo1-ami-filebeat"
  }
}

build {
  name = "packer-demo1"
  sources = [
    "source.amazon-ebs.elk-demo1-filebeat"
  ]
  provisioner "ansible" {
    playbook_file = "./playbooks/filebeat.yml"
  }
}

source "amazon-ebs" "elk-demo2-metricbeat" {
  ami_name                    = "ami-demo2-metricbeat-${local.timestamp}"
  instance_type               = var.instance_type
  region                      = var.aws_region
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  security_group_id           = var.security_group_id
  deprecate_at                = "2023-07-29T23:59:59Z"
  associate_public_ip_address = true
  force_deregister            = "true"
  force_delete_snapshot       = "true"

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
    Name = "demo2-ami-metricbeat"
  }
}

build {
  name = "packer-demo2"
  sources = [
    "source.amazon-ebs.elk-demo2-metricbeat"
  ]
  provisioner "ansible" {
    playbook_file = "./playbooks/metricbeat.yml"
  }
}