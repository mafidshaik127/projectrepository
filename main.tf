provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 5
ami = "ami-0ddc798b3f1a5117e"
instance_type = "t2.medium"
key_name = "mafidshaikpem77"
vpc_security_group_ids = ["sg-0cee9adebe6014f67"]
tags = {
Name = var.instance_names[count.index]
}
}

resource "aws_s3_bucket" "two" {
  bucket = "netflix-127"
  depends_on = [aws_instance.one]
}


variable "instance_names" {
default = ["ansible-server", "dev-1", "dev-2", "test-1", "test-2"]
}
