resource "aws_instance" "public" {
ami                           = "ami-02ff57195b457bd9a"
associate_public_ip_address   =true
instance_type                 ="t2.micro"
key_name                      = "LILIAN"
vpc_security_group_ids        = [aws_security_group.public.id]
subnet_id                     = aws_subnet.public[0].id
user_data                     = file("user_data.sh")

tags ={
Name ="${var.env_code}-public"
}
}
resource"aws_security_group" "public" {
name                               = "${var.env_code}-public"
description                        = "Allow inbound traffic"
vpc_id                             = aws_vpc.main.id


ingress {
description  = "SSH from public"
from_port    =22
to_port      =22
protocol     ="tcp"
cidr_blocks  = ["135.129.124.209/32"]
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