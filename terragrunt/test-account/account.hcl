# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  account_name   = "test-account"
  aws_account_id = "<SET ACCOUNT ID>"
}
