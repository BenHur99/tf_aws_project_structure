# networking.tfvars for networking
# ================================

# Global Vars
# ============
environment = "dev"
company     = "poc"
location    = "us-east-1"

# VPCs
# ========
vpc = {
  app-vpc = {
    cidr_block = "10.0.0.0/16"
  }
  db-vpc = {
    cidr_block = "10.1.0.0/16"
  }
}

# ======================
# Subnets
# ======================
subnet = {
  public-subnet-a = {
    cidr_block              = "10.0.1.0/24"
    vpc_name                = "app-vpc"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true
  }
  public-subnet-b = {
    cidr_block              = "10.0.2.0/24"
    vpc_name                = "app-vpc"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = true
  }
  private-app-a = {
    cidr_block              = "10.0.3.0/24"
    vpc_name                = "app-vpc"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false
  }
  private-app-b = {
    cidr_block              = "10.0.4.0/24"
    vpc_name                = "app-vpc"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false
  }
  private-db-a = {
    cidr_block              = "10.1.1.0/24"
    vpc_name                = "db-vpc"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false
  }
  private-db-b = {
    cidr_block              = "10.1.2.0/24"
    vpc_name                = "db-vpc"
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false
  }
}

# ======================
# IGWs
# ======================
IGW = {
  igw1 = {
    vpc_name = "app-vpc"
  }
}

# ======================
# NAT Gateways
# ======================
