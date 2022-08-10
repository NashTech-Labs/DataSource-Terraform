data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    values = ["vpc"]
  }
}

data "aws_subnet" "subnet" {
  filter {
    name = "tag:Name"
    values = ["subnet"]
  }
}

resource "aws_security_group" "sg" {
  name = "sg"
  vpc_id = data.aws_vpc.vpc.id
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0"]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0"]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
}

resource "aws_instance" "proj-instance" {
  ami ="ami-2757f631"
  instance_type = "t2.micro"
  key_name= "aws_key"
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id =  data.aws_subnet.subnet.id
  tags = {
    Name = "DataSource- Instance"
  }
}
