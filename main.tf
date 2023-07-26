provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "new_server" {
  count         = 2
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  key_name      = "devops"

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo usermod -aG docker ubuntu
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo docker run -d -p 80:80 --restart=always your-docker-image:latest
    EOF

  tags = {
    Name = "new_server-${count.index + 1}"
  }
}

resource "aws_route53_zone" "docker_zone" {
  name = "test-docker.com"
}

resource "aws_route53_record" "dns_record" {
  zone_id = aws_route53_zone.example_zone.zone_id
  name    = "test-docker.com"
  type    = "A"
  ttl     = "300"

  records = aws_instance.new_server.*.private_ip
}
