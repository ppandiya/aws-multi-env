resource "aws_key_pair" "sysadmin" {

key_name = "sysadmin-ec2"
public_key = "${file(var.public_key_path)}"

}

resource "aws_security_group" "web_sg" {

name = "web-sg"
vpc_id = "${aws_vpc.alti-demo-vpc.id}"

}

resource "aws_security_group_rule" "ssh" {

type = "ingress"
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
security_group_id = "${aws_security_group.web_sg.id}"

}
resource "aws_instance" "Web_instance" {

ami = "ami-a9d276c9"
instance_type = "t2.micro"
subnet_id = "${aws_subnet.public_subnet.id}"
key_name = "terraform-ec2"
vpc_security_group_ids = ["${aws_security_group.web_sg.id}"]
tags {
Name = "web-dev-001"
Environment = "dev"

}
connection {
user = "ubuntu"
type = "ssh"
private_key = "${file("C:/SPINNAKER/terraform-ec2.pem")}"
agent = "false"

}
provisioner "chef" {

environment = "_default"
       run_list = ["web-instance"]
       node_name = "webserver1"
       server_url = "https://api.chef.io/organizations/path-ngo"
       recreate_client = true
       user_name = "sriprasanna-p"
       user_key = "${file("C:/Users/sysadmin/chef-repo/.chef/sriprasanna-p.pem")}"
       version = "12.4.1"

}

}
