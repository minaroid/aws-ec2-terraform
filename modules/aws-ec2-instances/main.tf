resource "aws_key_pair" "app-ssh-key" {
   key_name = "tod-ssh-key-development"
   public_key = file(var.ssh_public_key_location)
}

resource "aws_instance" "app-server-1" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  subnet_id = var.vpc.public_subnet.id
  vpc_security_group_ids = [ var.security_groups.app-server-sg.id  ]
  availability_zone = var.availability_zones[0]
  associate_public_ip_address = true
  key_name = aws_key_pair.app-ssh-key.key_name 
  user_data = "${file("entry-script.sh")}"  

  tags = {
    Name :  "tos-server-development"
  }
}
