resource "aws_vpc" "HCL-02" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    tags = {
        Name = "My-test-HCL-02"
	    Owner = "Mohan" 
	    environment = "Dev"
    }
}

resource "aws_internet_gateway" "HCL-02-IGW" {
    vpc_id = "${aws_vpc.HCL-02.id}"
	tags = {
        Name = "My-test-HCL-02"
    }
}