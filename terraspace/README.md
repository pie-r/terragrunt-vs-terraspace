# Terraspace Infrastructure

This is a Terraspace project. It contains code to provision Cloud infrastructure built with [Terraform](https://www.terraform.io/) and the [Terraspace Framework](https://terraspace.cloud/).

## Pre-requisites

1. Install [Terraform](https://www.terraform.io/) version `1.0.5` or newer and
   [Terraspace](https://terraspace.cloud/docs/learn/aws/install/) version `v0.6.18` or newer. I recommend to use docker, and mount the repository on it!
   Suggestion: try [TFSWITCH](https://tfswitch.warrensbox.com/)
2. In this file `terraspace/infrastructure/config/terraform/backend.tf`. We use S3 [as a Terraform
   backend](https://www.terraform.io/docs/backends/types/s3.html) to store your
   Terraform state, and S3 bucket names must be globally unique. The name currently in
   the file is already taken, so you'll have to specify your own.
3. Configure your AWS credentials in `accounts/dev-account.hcl` and `accounts/test-account.hcl` if you want both
4. Take a look to the makefile!

## Deploy

In the _terraspace_ folder there is a `Makefile` used to avoid errors given by copy-paste or wrong shell configuration. With this `Makefile` you can initialize and then deploy everything or a single stack in the following way.

### 1. Initialization

From the root folder:

1. `cd terraspace`
2. `make dev-init` - this command is used to initialize the s3 bucket and dynamo db table used by terraform. It also configure properly the project. _WARNING:_ Not override the files that already exists

#### 2. Deploy full or single stack?

Deploy full:

3. `make dev-run`: create everything with a single command
4. `make dev-destroy`: destroy everything in the correct order

Deploy single:

3. `make dev-vpc-plan`: let's see what we are going to create
4. `make dev-vpc-run`: apply it
5. `make dev-vpc-destroy`: destroy the stack

Remember: before deploy the EC2, you need to apply before the VPC!

In the make file there are multiple command. The makefile can be improved without too much effort!

## How is the code in this repo organized?

The code in this repo uses the following folder hierarchy:

```
terraspace
   └ infrastructure
      └ app
      |   └ modules
      |   └ stacks
      └ config
         └ args
         └ terraform
```

Where:

- **Infrastructure**: Is the project name. The folder has been created by the `make dev-init` command.

- **app**: Refer to `terraspace cheat sheet` article in Medium

- **config**:
  - args: custom flag that we can pass to `terraform` binary
  - terraform: here we configure the backend used by TF. Here you can configure variables shared across all the modules!

## How enable multi-env setup

In the `Makefile` in each command there is an export like `TS_ENV="qa"`.

With this syntax, we are going to configure `terraspace` to merge two files that exist in this folder `terraspace/infrastructure/app/stacks/ec2-service/tfvars`:

1. `base.tfvars`
2. `qa.tfvars`

Do you want to configure in a different way the `test` environment?
Simply configure `TS_ENV="test"` that will merge:

1. `base.tfvars`
2. `test.tfvars`

This mechanism is applied everywhere, also for the `tfvars` shared across all the modules and defined here `terraspace/infrastructure/config/terraform/tfvars`

## How enable multi-account setup

In the `Makefile` the only thing to do is to configure the correct credentials to use.

`source ./../accounts/dev-account.sh` is the command to load the environment variables stored in that script.

## Multi region

The multi region is given with the method described here: https://terraspace.cloud/docs/tfvars/multi-region-layering/

The env variable is configured in the `accounts/env-account.sh`. I suggest to move the env variable away from this file, and configure it in the makefile.
