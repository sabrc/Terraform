terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.58.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
locals {
  mytag = "sabri-local-name"
}



resource "aws_instance" "tf-ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = "sabri.key"
  tags = {
    "Name" = "${local.mytag}-.instance"
  }
}


resource "aws_s3_bucket" "tf-s3" {
  for_each = toset(var.users)
  bucket   = "sabri-tf-s3-bucket-${each.value}"

}
output "tf_example_public_ip" {
  value = aws_instance.tf-ec2.public_ip
}
output "tf_example_s3_meta" {
  value = values(aws_s3_bucket.tf-s3)[*].bucket
}
output "tf_example_private_ip" {
  value = aws_instance.tf-ec2.private_ip
}

output "uppercase_users" {
  value = [for user in var.users : upper(user) if length(user) > 6]
}