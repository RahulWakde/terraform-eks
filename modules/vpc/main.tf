resource "aws_vpc" "this" {
cidr_block
= var.vpc_cidr
enable_dns_support
= true
enable_dns_hostnames = true
tags = {
Name = var.vpc_name
}
}
resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.this.id
}
resource "aws_subnet" "public" {
count
vpc_id
cidr_block
availability_zone
= length(var.public_subnets)
= aws_vpc.this.id
= var.azs[count.index]
map_public_ip_on_launch = true
tags = {
Name = "public-subnet-${count.index}"
}
}
resource "aws_route_table" "public" {
vpc_id = aws_vpc.this.id
}
= var.public_subnets[count.index]
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
}
resource "aws_route_table_association" "public" {
2
count
subnet_id
= length(var.public_subnets)
= aws_subnet.public[count.index].id
route_table_id = aws_route_table.public.id
}
