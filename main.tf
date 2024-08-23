
provider "aws" {
  region = var.region
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_key_pair" "tod-ssh-key" {
   key_name = "tod-ssh-key-dev"
   public_key = file(var.ssh_public_key_location)
}

resource "aws_default_security_group" "tod-sg" {
  vpc_id = data.aws_vpc.default.id
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    prefix_list_ids = []
  }

  tags = {
      Name :  "tod-sg"
    }
}

/// Backend Server

resource "aws_instance" "tod-backend-server" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  subnet_id = var.public_subnets_ids[0]
  vpc_security_group_ids = [ aws_default_security_group.tod-sg.id  ]
  availability_zone = var.availability_zones[0]
  associate_public_ip_address = true
  key_name = aws_key_pair.tod-ssh-key.key_name 
  user_data = "${file("backend-entry-script.sh")}"  

  tags = {
    Name :  "tod-backend-server-development"
  }
}

resource "aws_eip" "backend-eip" {
}

resource "aws_eip_association" "backend-eip-association" {
  instance_id = aws_instance.tod-backend-server.id
  allocation_id = aws_eip.backend-eip.id
}

output "backend_address" {
  value       = aws_eip.backend-eip.public_ip
  description = "The public IP address of the backend"
}

/// Mongo Server

resource "aws_instance" "tod-mongo-server" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  subnet_id = var.public_subnets_ids[0]
  vpc_security_group_ids = [ aws_default_security_group.tod-sg.id   ]
  availability_zone = var.availability_zones[0]
  associate_public_ip_address = true
  key_name = aws_key_pair.tod-ssh-key.key_name 
  user_data = "${file("mongo-entry-script.sh")}"  

  tags = {
    Name :  "tod-mongo-server-development"
  }
}
resource "aws_eip" "mongo-eip" {
}

resource "aws_eip_association" "mongo-eip-association" {
  instance_id = aws_instance.tod-mongo-server.id
  allocation_id = aws_eip.mongo-eip.id
}

output "mongo_address" {
  value       = aws_eip.mongo-eip.public_ip
  description = "The public IP address of the Mongo database"
}