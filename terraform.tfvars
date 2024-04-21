virginia_cidr  = "10.10.0.0/16"
# public_subnet = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"

subnet = [ "10.10.0.0/24", "10.10.1.0/24" ]
tags = {
"owner"           = "lytch"
  "env"           = "dev"
  "iac"           = "terraform"
  "iacVersion"    = "1.8.1"
  "provider"      = "AWS"
  "project"       = "cerberus"
  "region"        = "virginia"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "instance_type" = "t2.micro"
  "ami"           = "ami-04e5276ebb8451442" #us_east_1
}

enable_monitoring = 0

ingress_port_list = [ 22,80,443 ]