# TERRAGRUNT

## Pre-requisites

1. Install [Terraform](https://www.terraform.io/) version `1.0.5` or newer and
   [Terragrunt](https://github.com/gruntwork-io/terragrunt) version `v0.31.8` or newer. I recommend to use docker, and mount the repository on it!
   Suggestion: try [TFSWITCH](https://tfswitch.warrensbox.com/)
2. Update the `bucket` parameter in the root `terragrunt.hcl`. We use S3 [as a Terraform
   backend](https://www.terraform.io/docs/backends/types/s3.html) to store your
   Terraform state, and S3 bucket names must be globally unique. The name currently in
   the file is already taken, so you'll have to specify your own. Alternatives, you can
   set the environment variable `TG_BUCKET_PREFIX` to set a custom prefix.
3. Configure your AWS credentials in `accounts/dev-account.hcl` and `accounts/test-account.hcl` if you want both
4. Fill in your AWS Account ID's in `terragrunt/test-account/account.hcl` and `terragrunt/dev-account/account.hcl`.

## Deploying a single module

1. `cd` into the _terragrunt folder_
2. run `make dev-vpc-plan` to try the plan in the dev account for the vpc module
3. run `make dev-vpc-run` to apply in the dev account the vpc module
4. run `make dev-vpc-destroy` to destroy the vpc module

Remember: before deploy the EC2, you need to apply before the VPC!

In the make file there are multiple command. The makefile can be improved without too much effort!

## How is the code in this repo organized?

The code in this repo uses the following folder hierarchy:

```
account
 └ _global
 └ region
    └ _global
    └ environment
       └ resource
```

Where:

- **Account**: At the top level are each of your AWS accounts, such as `dev-account`, `test-account`,
  etc. If you have everything deployed in a single AWS account, there will just be a single folder at the root (e.g.
  `main-account`).

- **Region**: Within each account, there will be one or more [AWS
  regions](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html), such as
  `us-east-1`, `eu-west-1`, and `ap-southeast-2`, where you've deployed resources. There may also be a `_global`
  folder that defines resources that are available across all the AWS regions in this account, such as IAM users,
  Route 53 hosted zones, and CloudTrail.

- **Environment**: Within each region, there will be one or more "environments", such as `test`, `qa`, etc. Typically,
  an environment will correspond to a single [AWS Virtual Private Cloud (VPC)](https://aws.amazon.com/vpc/), which
  isolates that environment from everything else in that AWS account. There may also be a `_global` folder
  that defines resources that are available across all the environments in this AWS region, such as Route 53 A records,
  SNS topics, and ECR repos.

- **Resource**: Within each environment, you deploy all the resources for that environment, such as EC2 Instances, Auto
  Scaling Groups, ECS Clusters, Databases, Load Balancers, and so on.

## Creating and using root (account) level variables

In the situation where you have multiple AWS accounts or regions, you often have to pass common variables down to each
of your modules. Rather than copy/pasting the same variables into each `terragrunt.hcl` file, in every region, and in
every environment, you can inherit them from the `inputs` defined in the root `terragrunt.hcl` file.
