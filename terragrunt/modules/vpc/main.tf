resource "aws_eip" "nat" {
  count = length(var.aws_azs)
  vpc   = true

  tags = {
    Owner = "Terragrunt"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"

  name = "terragrunt-${var.env_name}-vpc"
  

  azs             = var.aws_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets
  cidr = var.vpc_cidr

  # One NAT Gateway per subnet (default behavior)
  # https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest#nat-gateway-scenarios
  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = false

  # Pass IP to the module
  reuse_nat_ips          = true
  external_nat_ip_ids    = "${aws_eip.nat.*.id}"


  map_public_ip_on_launch = false

  tags = {
    Environment = var.env_name
    App         = "MY_VPC"
    Owner       = "Terragrunt"
  }

}

