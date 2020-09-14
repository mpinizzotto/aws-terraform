#root .tfvars

aws-region = "us-east-1"
project-name = "matty-website"

#s3 vars
bucket-acl = "private"

bucket-tags = {
  Name = "matty-bucket"
  Environment = "dev"
}

#Networking vars

vpc-cidr-block = "10.0.0.0/17"

vpc-tags = {
  Name = "matt-vpc"
  Environment = "dev"
}

igw-tags = {
  Name = "matty-igw"
  Environment = "dev"
}

public-rt-tags = {
  Name = "matty-public-rt"
  Environment = "dev"
}

private-rt-tags = {
  Name = "matty-private-rt"
  Environment = "dev"
}

public-cidr = ["10.0.1.0/24", "10.0.2.0/24"]

public-subnet-tags = {
  Name = "matty-public-subnet"
}

#Security
public-sg = "matty-public-sg"

public-sg-tags = {
  Name = "matty-public-sg"
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
