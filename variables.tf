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

variable "kibana_ami_name" {
    description = "This is my owner name"
    type        = string
}