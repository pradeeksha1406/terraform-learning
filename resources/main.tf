resource "aws_instance" "ubuntu" {
  ami           = ""
  instance_type = "t3.micro"
  tags = {
    Name="frontend"
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "techadda.co"
  type    = "A"
  ttl     = 300
  records = [aws_instance.ubuntu.private_ip]
}