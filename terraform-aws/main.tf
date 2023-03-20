terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_instance" "tf-ec2" {
  ami = "ami-02f3f602d23f1659d"
  instance_type = "t2.micro"
  key_name = "sabri.key"
  tags = {
    "Name" = "tf-ec2"
  }
}

resource "aws_s3_bucket" "tf_s3" {
  bucket = "sabri-tf-test-bucket-sck"
}