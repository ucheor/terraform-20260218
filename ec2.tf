#Bastion EC2
resource "aws_instance" "bastion_host" {
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = aws_key_pair.utc_key.key_name
  associate_public_ip_address = true
  depends_on = [ local_file.github_key ]

  # This replaces the provisioners and works reliably in GitHub Actions
  user_data = templatefile("copy_key.sh", {
    key_content = tls_private_key.utc_key.private_key_pem
    key_name    = aws_key_pair.utc_key.key_name
  })

  tags = {
    Name = "dev-bastion-host"
    env  = "dev"
    team = "config management"
  }
}

resource "aws_instance" "app-server-1" {
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private1.id
  vpc_security_group_ids = [ aws_security_group.app_server_sg.id ]
  key_name               = aws_key_pair.utc_key.key_name
  

  user_data = file("user_data.sh")

  tags = {
    Name = "dev-app-server-host-1"
    env  = "dev"
    team = "config management"
  }
}

resource "aws_instance" "app-server-2" {
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private1.id
  vpc_security_group_ids = [ aws_security_group.app_server_sg.id ]
  key_name               = aws_key_pair.utc_key.key_name
  
  user_data = file("user_data.sh")

  tags = {
    Name = "dev-app-server-host-2"
    env  = "dev"
    team = "config management"
  }
}
