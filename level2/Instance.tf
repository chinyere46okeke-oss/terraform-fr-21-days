
resource "aws_instance" "public" {
ami                           = "ami-02ff57195b457bd9a"
associate_public_ip_address   =true
instance_type                 ="t2.micro"
key_name                      = "LILIAN"
vpc_security_group_ids        = [aws_security_group.public.id]
subnet_id                     = data.terraform_remote_state.level1.outputs.public_subnet_id [0]
user_data                     = file("user_data.sh")

tags ={
Name ="${var.env_code}-public"
}
}
resource"aws_security_group" "public" {
name                               = "${var.env_code}-public"
description                        = "Allow inbound traffic"
vpc_id                             = data.terraform_remote_state.level1.outputs.vpc_id 


ingress {
description  = "SSH from vpc"
from_port    =22
to_port      =22
protocol     ="tcp"
cidr_blocks  = [data.terraform_remote_state.level1.outputs.vpc_cidr]
}

ingress {
description = "http from public"
from_port   =80
to_port     = 80
protocol    ="tcp"
cidr_blocks =["0.0.0.0/0"]
}

egress {
    from_port   =0
    to_port     =0
    protocol    ="-1"
    cidr_blocks =["0.0.0.0/0"]
}

tags = {
Name = " ${var.env_code}-public"
}
}
