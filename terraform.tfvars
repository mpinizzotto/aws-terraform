#root .tfvars

aws-region = "us-east-1"
project-name = "foo-website"

#s3 vars
bucket-acl = "private"

bucket-tags = {
  Name = "foo-bucket"
  Environment = "dev"
}

#Networking vars

vpc-cidr-block = "10.0.0.0/17"

vpc-tags = {
  Name = "foo-vpc"
  Environment = "dev"
}

igw-tags = {
  Name = "foo-igw"
  Environment = "dev"
}

public-rt-tags = {
  Name = "foo-public-rt"
  Environment = "dev"
}

private-rt-tags = {
  Name = "foo-private-rt"
  Environment = "dev"
}

public-cidr = ["10.0.1.0/24", "10.0.2.0/24"]

public-subnet-tags = {
  Name = "foo-public-subnet"
}

#Security
public-sg = "foo-public-sg"

public-sg-tags = {
  Name = "foo-public-sg"
  Environment = "dev"
}

external-access-ip = "0.0.0.0/0"

#Compute

ami-owners = "amazon"

ami-names = "amzn-ami-hvm*-x86_64-gp2"

public-key-name = "project-keys"

public-key-path = "/home/ubuntu/.ssh/id_rsa.pub"

instance-count = 2

instance-type = "t2.micro"
