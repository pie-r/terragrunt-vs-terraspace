terraform {
  backend "s3" {
    bucket         = "<%= expansion('terraform-state-terraspace-:ACCOUNT-:REGION-:ENV') %>"
    key            = "<%= expansion(':REGION/:ENV/:BUILD_DIR/terraform.tfstate') %>"
    region         = "<%= expansion(':REGION') %>"
    encrypt        = true
    dynamodb_table = "terraform_locks_terraspace"
  }
}
