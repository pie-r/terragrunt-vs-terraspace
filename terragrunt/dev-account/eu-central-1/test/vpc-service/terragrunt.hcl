locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../..//modules/vpc"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  env_name = local.env

  aws_azs = [
    "eu-central-1a"
  ]

  # VPC
  vpc_cidr = "10.11.120.0/21"

  vpc_private_subnets = [
    "10.11.121.0/24",
  ]

  vpc_public_subnets = [
    "10.11.124.0/24",
  ]

}
