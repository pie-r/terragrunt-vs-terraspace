resource "aws_instance" "ec2" {
  instance_type = var.machine_type
  ami           = "ami-095e1a4d3d632d215"

  subnet_id = element(var.shared_vpc_public_subnets, 1)

  disable_api_termination = var.disable_termination

  tags = {
    Name = var.name
    Env = var.env_name
    Owner = "Terragrunt"
  }
}

resource "aws_eip" "ec2-grunt-ip" {

  instance = aws_instance.ec2.id
  vpc      = true

  tags = {
    Name = var.name
    Env = var.env_name
    Owner = "Terragrunt"
  }
}
