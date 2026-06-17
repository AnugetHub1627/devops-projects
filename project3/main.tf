resource "aws_security_group" "devops-proj3_sg" {
    name = "devops-proj3_sg"
    ingress {
        description = "allow inbound traffic from ssh" 
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]     # any traffic can in from port 22 
    }

    ingress {
        description = "allow traffic from http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "to set outbound rules"
        from_port = 0
        to_port = 0 
        protocol = "-1"      # allow for all protocols
        cidr_blocks = ["0.0.0.0/0"]      # any traffic allow for outbound traffic
    }

}

resource "aws_instance" "proj3_ec2" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.devops-proj3_sg.id]
    key_name = "key_mukesh"
    
    # Install Docker and run a python "hello devops" application container mapped to Port 80
    user_data = <<-EOF
                #!/bin/bash
                # Update packages
                sudo apt-get update -y 

                # Install docker
                sudo apt-get install docker.io -y

                # Start and enable docker services
                sudo systemctl start docker 
                sudo systemctl enable docker

                # Pull and run your app container
                sudo docker run -d --name proj3-app --publish 80:8080 anummdocker/namurepo09:latest
                # port 8080 is container internal port means app inside container listen through this port only 
                # 80 is host port we can access app in brouser by using this port only but here we use http so there is no need to put port no 
                # after url to access application  
                EOF

    tags = {
        Name = "proj3_ec2"
    }            

}
output "app_public_url" {
  description = "The public URL to access the running app container"
  value       = "http://${aws_instance.proj3_ec2.public_ip}"
}

 
