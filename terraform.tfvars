vpc_name                   = "elk-vpc"      
vpc_cidr                   = "192.168.0.0/16"

aws_region                 = "ap-southeast-2" 
aws_az1                    = "ap-southeast-2a"
aws_az2                    = "ap-southeast-2b"
aws_az3                    = "ap-southeast-2c"

public_kibana_cidr         = "192.168.1.0/24"
private_monitoring_cidr    = "192.168.2.0/24"
private_app1_cidr          = "192.168.3.0/24"
private_app2_cidr          = "192.168.4.0/24"
private_app3_cidr          = "192.168.5.0/24"

kibana_ami_name         = "ami-04e03543b88267ad3"