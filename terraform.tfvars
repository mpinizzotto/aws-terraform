#root .tfvars

aws-region = "us-east-1"
project-name = "acme-website"

#s3 vars
bucket-acl = "private"

bucket-tags = {
  Name = "acme-bucket"
  Environment = "Dev"
}

#Networking vars

vpc-cidr-block = "10.142.0.0/16"

vpc-tags = {
  Name = "acme-vpc"
  Environment = "Dev"
}

igw-tags = {
  Name = "acme-igw"
  Environment = "Dev"
}

public-rt-tags = {
  Name = "acme-public-rt"
  Environment = "Dev"
}

private-rt-tags = {
  Name = "acme-private-rt"
  Environment = "Dev"
}
