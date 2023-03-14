provider "aws" {
  region="us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-005f9685cb30f234b"
  instance_type = "t2.micro"
  security_groups = ["allow_tls"]
  user_data = file("${path.module}/userdata.sh")
  key_name =  "sabri.key"
}