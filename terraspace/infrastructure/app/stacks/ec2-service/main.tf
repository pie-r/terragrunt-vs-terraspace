# var.env_name is given by the qa.tfvars in infrastructure/terraform/qa.tfvars
locals {
  base_tags_with_env=merge(
      { 
        "Name" = var.name,
        "Custom" = var.custom_svc_env_tag
      },
        var.base_tags
      )
}

module "ec2-service" {
  source     = "../../modules/ec2"

  machine_type = "t3.micro"

  disable_termination = false

  shared_vpc_public_subnets = <%= output('vpc-service.vpc_service_vpc_public_subnets') %>

  tags = local.base_tags_with_env
}
