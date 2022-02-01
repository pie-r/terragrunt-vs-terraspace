output "vpc_service_vpc_cidr" {
  value = module.vpc-service.vpc_cidr
}

output "vpc_service_vpc_id" {
  value = module.vpc-service.vpc_id
}

output "vpc_service_vpc_public_subnets" {
  value = module.vpc-service.vpc_public_subnets
}

output "vpc_service_vpc_private_subnets" {
  value = module.vpc-service.vpc_private_subnets
}