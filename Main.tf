#establish the EC2 instance.
resource "aws_instance" "augjenkins" {
  ami           = var.ami_id
  instance_type = var.instance_project
  user_data     = file("jenkins_load.sh")

  tags = {
    name = "Instance jenkins"
  }
  vpc_security_group_ids = [aws_security_group.project_aug20_sg.id]
}
#form a security group.
resource "aws_security_group" "project_aug20_sg" {
  name   = "allowing_ssh"
  vpc_id = var.vpc_id

  ingress {
    description = "from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH into instance"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allowing ssh"
  }
}

#create s3 bucket

resource "aws_s3_bucket" "ekrissinbucketmay" {
  bucket = var.bucketname

  tags = {
    Name        = "ekrissinbucketmay23"
    Environment = "project_20"
  }
}