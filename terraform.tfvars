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

kibana_ami_id              = "ami-0729123415772f579"
elasticsearch_ami_id       = "ami-00f3d34c794e00fff"
logstash_ami_id            = "ami-0a16f80f91cde0871"
demo1_ami_filebeat         = "ami-090b273353a7d39c7"
demo2_ami_metricbeat       = "ami-058f600d29d99abef"