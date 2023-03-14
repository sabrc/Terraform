resource "aws_route53_record" "www" {
  zone_id = "Z09527843O6KCJIR3NFB8"
  name    = "www.sabridevops.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.web.public_ip]
}