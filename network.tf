resource "aws_vpc" "alti-demo-vpc" {

cidr_block = "10.0.0.0/16"

tags {
      Name        = "${var.environment_name}-vpc"
      Environment = "${var.environment_name}"
  }
}

resource "aws_subnet" "public_subnet" {
cidr_block = "10.0.1.0/24"
vpc_id = "${aws_vpc.alti-demo-vpc.id}"
map_public_ip_on_launch = "true"

tags {
    Name = "${var.environment_name}_public_subnet"
    Environment = "${var.environment_name}"
}
}

resource "aws_subnet" "Private_subnet" {
cidr_block = "10.0.5.0/24"
vpc_id = "${aws_vpc.alti-demo-vpc.id}"
map_public_ip_on_launch = "false"

tags {
    Name = "${var.environment_name}_private_subnet"
    Environment = "${var.environment_name}"
}

}

resource "aws_internet_gateway" "alti-dev-igw"
{

vpc_id ="${aws_vpc.alti-demo-vpc.id}"

}

resource "aws_route" "internet"
{
route_table_id = "${aws_vpc.alti-demo-vpc.main_route_table_id}"
destination_cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.alti-dev-igw.id}"

}
