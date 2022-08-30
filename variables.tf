variable "vpc_name" {
    description = "This is a vpc name"
    type = string
}

variable "vpc_cidr" {
    description = "This is a cidr name"
}

variable "aws_region" {
  description = "The region to deploy resources"
  type        = string
}

variable "aws_az1" {
  description = "This is the 1st availability-zone to deploy resources"
  type        = string
}

variable "aws_az2" {
  description = "This is the 2nd availability-zone to deploy resources"
  type        = string
}

variable "aws_az3" {
  description = "This is the 3rd availability-zone to deploy resources"
  type        = string
}

variable "public_kibana_cidr" {
    description = "This is my public cidr name for kibana"
}

variable "private_monitoring_cidr" {
    description = "This is my private cidr name for monitoring"
}

variable "private_app1_cidr" {
    description = "This is my 1st private cidr name for application server"
}

variable "private_app2_cidr" {
    description = "This is my 2nd private cidr name for application server"
}

variable "private_app3_cidr" {
    description = "This is my 3rd private cidr name for application server"
}

variable "kibana_ami_id" {
    description = "This is my ami id for Kibana"
    type        = string
}

variable "elasticsearch_ami_id" {
    description = "This is my ami id for ElasticSearch"
    type        = string
}

variable "logstash_ami_id" {
    description = "This is my ami id for Logstash"
    type        = string
}

variable "ami_beats" {
    description = "This is my ami id for Demo1 server for filebeat"
    type        = string
}

variable "my_pub_ip" {
    description = "This is the my public ip"
    type        = string
}

variable "pub_ip_kibana" {
    description = "This is the public ip for kibana"
    type        = string
}

variable "pub_ip_bastionhost" {
    description = "This is the public ip for bastion host"
    type        = string
}

variable "pri_ip_kibana" {
    description = "This is the private ip for kibana"
    type        = string
}

variable "pri_ip_elasticsearch" {
    description = "This is the private ip for elasticsearch"
    type        = string
}

variable "pri_ip_logstash" {
    description = "This is the private ip for logstash"
    type        = string
}

variable "pri_ip_bastionhost" {
    description = "This is the private ip for bastionhost"
    type        = string
}

variable "pri_ip_demo1" {
    description = "This is the private ip for demo1 server"
    type        = string
}

variable "pri_ip_demo2" {
    description = "This is the private ip for demo2 server"
    type        = string
}

variable "pri_ip_demo3" {
    description = "This is the private ip for demo3 server"
    type        = string
}