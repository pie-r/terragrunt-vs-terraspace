resource "aws_instance" "ec2" {
  instance_type = var.machine_type
  ami           = "ami-095e1a4d3d632d215"

  subnet_id = element(var.shared_vpc_public_subnets, 1)

  disable_api_termination = var.disable_termination

  tags = var.tags

  root_block_device {
    encrypted = true
  }
}
