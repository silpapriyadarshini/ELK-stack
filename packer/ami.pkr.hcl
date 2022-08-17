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

source "amazon-ebs" "elk-kibana" {
  ami_name          = "ami-kibana-${local.timestamp}"
  instance_type     = "t2.micro"
  region            = "ap-southeast-2"
  vpc_id            = "vpc-002d4831d125b4d1d"
  subnet_id         = "subnet-01201381f7203d742"
  security_group_id = "sg-0bd603feb698fa32c"
  deprecate_at      = "2023-07-29T23:59:59Z"
  // associate_public_ip_address = true
  force_deregister      = "true"
  force_delete_snapshot = "true"

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
  //   playbook_file = "./playbooks/kibana.yml"
  // }
}

source "amazon-ebs" "elk-elasticsearch" {
  ami_name          = "ami-elasticsearch-${local.timestamp}"
  instance_type     = "t2.micro"
  region            = "ap-southeast-2"
  vpc_id            = "vpc-002d4831d125b4d1d"
  subnet_id         = "subnet-01201381f7203d742"
  security_group_id = "sg-0bd603feb698fa32c"
  deprecate_at      = "2023-07-29T23:59:59Z"
  // associate_public_ip_address = true
  force_deregister      = "true"
  force_delete_snapshot = "true"

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
  ami_name          = "ami-logstash-${local.timestamp}"
  instance_type     = "t2.micro"
  region            = "ap-southeast-2"
  vpc_id            = "vpc-002d4831d125b4d1d"
  subnet_id         = "subnet-01201381f7203d742"
  security_group_id = "sg-0bd603feb698fa32c"
  deprecate_at      = "2023-07-29T23:59:59Z"
  // associate_public_ip_address = true
  force_deregister      = "true"
  force_delete_snapshot = "true"

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
  // provisioner "ansible" {
  //   playbook_file = "./playbooks/logstash.yml"
  // }
}