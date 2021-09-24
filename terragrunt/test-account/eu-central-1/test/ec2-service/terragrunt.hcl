locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env = local.environment_vars.locals.environment
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../..//modules/ec2"
}

# Include all settings from the root terragrunt.hcl file (backend herited here)
include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../vpc-service"]
}

dependency "vpc-service" {
  config_path = "../vpc-service"

}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {


  name     = "terragrunt-instance"
  env_name = "test"

  machine_type = "t3.micro"

  disable_termination = false

  shared_vpc_public_subnets = dependency.vpc-service.outputs.vpc_public_subnets

}
