resource "aws_instance" "PublicInstance1" {
  ami                         = "ami-043429597820fbc71"
  instance_type               = "t2.micro"
  key_name                    = "Project"
  vpc_security_group_ids      = ["${aws_security_group.websg.id}"]
  subnet_id                   = "${aws_subnet.Websubnet-1.id}"
  associate_public_ip_address = true
#   user_data                   = "${file("data.sh")}"

  tags = {
    Name = "My Public Instance"
  }
}

# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "PublicInstance2" {
  ami                         = "ami-043429597820fbc71"
  instance_type               = "t2.micro"
  key_name                    = "Project"
  vpc_security_group_ids      = ["${aws_security_group.websg.id}"]
  subnet_id                   = "${aws_subnet.Websubnet-2.id}"
  associate_public_ip_address = true
#   user_data                   = "${file("data.sh")}"

  tags = {
    Name = "My Public Instance 2"
  }
}