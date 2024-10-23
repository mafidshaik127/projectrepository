provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "two" {
count = 4
ami = "ami-0ddc798b3f1a5117e"
instance_type = "t2.medium"
key_name = "mafidshaik77"
vpc_security_group_ids = ["sg-0cee9adebe6014f67"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "nexus", "tomcat-1", "tomcat-2"]
}
