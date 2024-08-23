// fetch latest ubuntu image, note: this filter will not be applicable on all regions, tested on us-east-1 region
data "aws_ami" "latest-ubuntu-image" {
  most_recent = true
  owners = [ "099720109477" ]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-*-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

// create ssh key pair
resource "aws_key_pair" "app-ssh-key" {
   key_name = "myapp-ssh-key"
   public_key = file(var.ssh_public_key_location)
}

resource "aws_instance" "app-server-1" {
  ami = data.aws_ami.latest-ubuntu-image.id
  instance_type = "t2.micro"
  subnet_id = var.vpc.public_subnet.id
  vpc_security_group_ids = [ var.security_groups.app-server-sg.id  ]
  availability_zone = var.availability_zones[0]
  associate_public_ip_address = true
  key_name = aws_key_pair.app-ssh-key.key_name 
  user_data = "${file("entry-script.sh")}"  

  tags = {
    Name :  "app-server-1"
  }
}

resource "aws_instance" "app-server-2" {
  ami = data.aws_ami.latest-ubuntu-image.id
  instance_type = "t2.micro"
  subnet_id = var.vpc.public_subnet.id
  vpc_security_group_ids = [ var.security_groups.app-server-sg.id  ]
  availability_zone = var.availability_zones[0]
  associate_public_ip_address = true
  key_name = aws_key_pair.app-ssh-key.key_name 
  user_data = "${file("entry-script.sh")}"  

  tags = {
    Name :  "app-server-2"
  }
}