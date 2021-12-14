# var.env_name is given by the qa.tfvars in infrastructure/terraform/qa.tfvars
locals {
  base_tags_with_env=merge(
      { "Env" = var.env_name },
        var.base_tags
      )
}

module "vpc-service" {
  source     = "../../modules/vpc"

  env_name = var.env_name

  aws_azs = [
    "eu-central-1a"
  ]

  # VPC
  vpc_cidr = var.cidr

  vpc_private_subnets = var.private_subnets

  vpc_public_subnets = var.public_subnets

  tags = local.base_tags_with_env
}
