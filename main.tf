 resource "aws_instance" "app_server" {
  ami           = "ami-0a72753edf3e631b7"
  instance_type = "t2.micro"
  subnet_id = "subnet-0a05aa2c3fc3709e6"

  tags = {
    Name = "ExampleAppServerInstance"
    owner = "chinyere"
  }
}


