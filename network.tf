resource "aws_vpc" "alt-demo-vpc" {

cidr_block = "10.0.0.0/16"

tags {
      Name        = "${var.environment_name}-vpc"
      Environment = "${var.environment_name}"
  }
}
