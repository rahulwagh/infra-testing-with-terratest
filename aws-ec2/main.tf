resource "aws_instance" "ec2_example" {
  #count = 4
  ami = "ami-0767046d1677be5a0"
  instance_type = var.instance_type
  tags = {
    Name = "test-t2-micro"
  }
  key_name= "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
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
  ingress                = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
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
}

output "ssh_connection_string" {
  value = format("%s%s","ssh -i /Users/rahulwagh/.ssh/aws_ec2_terraform ubuntu@",aws_instance.ec2_example.public_ip)
}