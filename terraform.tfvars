#root .tfvars

aws-region = "us-east-1"
project-name = "wordpress-website"

#s3 vars
bucket-acl = "private"

bucket-tags = {
  Name = "wordpress-bucket"
  Environment = "dev"
}

#Networking vars

vpc-cidr-block = "10.142.0.0/16"

vpc-tags = {
  Name = "wordpress-vpc"
  Environment = "dev"
}

igw-tags = {
  Name = "wordpress-igw"
  Environment = "dev"
}

public-rt-tags = {
  Name = "wordpress-public-rt"
  Environment = "dev"
}

private-rt-tags = {
  Name = "wordpress-private-rt"
  Environment = "dev"
}

public-cidr = ["10.142.32.0/24", "10.142.33.0/24"]

public-subnet-tags = {
  Name = "wordpress-public-subnet"
}

#Security
public-sg = "wordpress-public-sg"

public-sg-tags = {
  Name = "wordpress-public-sg"
  Environment = "dev"
}

external-access-ip = "0.0.0.0/0"

#Compute

public-key-name = "project-keys"
public-key-path = "/home/ubuntu/.ssh/id_rsa.pub"

