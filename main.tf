#Creating VPC-01
resource "aws_vpc" "vpc-01" {
    cidr_block = 10.10.1.0/16
    enable_dns_hostnames = true
    tags = {
        Name = "Pearing-vpc-01"
	    Owner = "Mohan" 
	    environment = "Dev"
    }
}

#Creating VPC-02
resource "aws_vpc" "vpc-02" {
    cidr_block = 172.16.0.0/16
    enable_dns_hostnames = true
    tags = {
        Name = "Pearing-vpc-02"
	    Owner = "Mohan" 
	    environment = "Dev"
    }
}

#Creating Pearing between vpc-01 and vpc-02



module "multi_account_single_region" {
  source = "../../"

  providers = {
    aws.this = aws.this
    aws.peer = aws.peer
  }

  this_vpc_id = var.this_vpc_id
  peer_vpc_id = var.peer_vpc_id

  auto_accept_peering = true

  tags = {
    Name        = "tf-multi-account-single-region"
    Environment = "Test"
  }
}
