resource "aws_instance" "public" {
  ami                         = "ami-015cbce10f839bd0c"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = "liliankeys"
  vpc_security_group_ids      = [aws_security_group.public.id]
  subnet_id                   = aws_subnet.public[0].id

  tags = {
    name = "${var.env_code}-public"
  }
}

resource "aws_security_group" "public" {
  name        = "${var.env_code}-public"
  description = "Allow inbound traffic"
  vpc_id        = aws_vpc.main.id

  ingress {
    description = "SSH from public"
    from_port   = 22
    to_port      = 22
    protocol    = "tcp"
    cidr_blocks = ["102.91.102.35/32"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "${var.env_code}-public"
  }
}

resource "aws_instance" "private" {
  ami                         = "ami-015cbce10f839bd0c"
  instance_type               = "t2.micro"
  key_name                    = "liliankeys"
  vpc_security_group_ids      = [aws_security_group.private.id]
  subnet_id                   = aws_subnet.private[0].id

  tags = {
    name = "${var.env_code}-private"
  }
}

resource "aws_security_group" "private" {
  name        = "${var.env_code}-private"
  description = "Allow inbound traffic"
  vpc_id        = aws_vpc.main.id

  ingress {
    description = "SSH from public"
    from_port   = 22
    to_port      = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "${var.env_code}-private"
  }
}
