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

kibana_ami_id              = "ami-0e60ac92967883c2b"
elasticsearch_ami_id       = "ami-0a404160c0e864ed8"
logstash_ami_id            = "ami-0ab54db37af7c3967"
demo1_ami_filebeat         = "ami-0320d93bca07af1c5"
demo2_ami_metricbeat       = "ami-0320d93bca07af1c5"