region_name = "us-east-1"
iam_db_auth_flag = true


allocated_storage    = 10
storage_type         = "gp2"
engine               = "aurora"
mysql_engine_version = "5.7"
instance_class       = "db.t2.small"
name                 = "username"
username             = "password"
password             = "HpG}f2WFHhv"
mysql_parameter_group_name = "default.mysql5.7"
subnet_id           = "subnet-0c99f240e57b1bd93"
subnet_id_1         = "subnet-0dd03cffbdd555282"
vpc_id              = "vpc-0bd17977285d0e8f3"

environment = "prod"
project = "usbetapanel"
