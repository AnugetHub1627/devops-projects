provider "aws" {
    profile = "default"
    region = "ap-south-1"
}
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}
resource "aws_instance" "git_ec2" {
    ami = "ami-01b40e1bcccae197a"
    instance_type = "t3.micro"
    associate_public_ip_address = true
    key_name = "key_anu"
}    

    
