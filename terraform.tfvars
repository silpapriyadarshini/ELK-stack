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

kibana_ami_id              = "ami-06d170108dd64ec6e"
elasticsearch_ami_id       = "ami-022f4dd16c3f3f636"
logstash_ami_id            = "ami-0cd792c1b3160ecda"
demo1_ami_filebeat         = "ami-091804d7deec0fb11"
demo2_ami_metricbeat       = "ami-0a97332f0093b0e6e"