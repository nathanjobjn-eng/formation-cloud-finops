resource "aws_vpc" "main_vpc" {

    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "vpc-formation-finops"
    }
}

resource "aws_subnet" "public_subnet" {

    vpc_id             = aws_vpc.main_vpc.id
    cidr_block         = "10.0.1.0/24"
    availability_zone  = "eu-west-3a"
    
    map_public_ip_on_launch = true

    tags = {
     Name = "subnet-formation-public"
    }
}

resource "aws_subnet" "private_subnet" {

    vpc_id             = aws_vpc.main_vpc.id
    cidr_block         = "10.0.2.0/24"
    availability_zone  = "eu-west-3b"

    tags = {
        Name = "subnet-formation-private"
    }
}

resource "aws_internet_gateway" "main_igw" {
    vpc_id = aws_vpc.main_vpc.id

    tags = {
        Name = "igw-formation-finops"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id        = aws_vpc.main_vpc.id

    route {
       cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.main_igw.id
    }
       tags = {
        Name = "rt-formation-public"
       }
}

resource "aws_route_table_association" "public_assoc" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}