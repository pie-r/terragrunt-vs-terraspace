module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"

  name = "terraspace-${var.env_name}-vpc"
  

  azs             = var.aws_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets
  cidr = var.vpc_cidr

  # Disable NAT Gateway
  # https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest#nat-gateway-scenarios
  enable_nat_gateway     = false
  single_nat_gateway     = false
  one_nat_gateway_per_az = false


  map_public_ip_on_launch = false

  tags = var.tags

}

