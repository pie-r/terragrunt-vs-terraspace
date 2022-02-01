# Terragrunt vs Terraspace

This repository is part of a series of articles published in medium:

- [Terragrunt](bit.ly/2YfWRED)
- [Terraspace](bit.ly/3o2DrMV)

I strongly recommend to took a look there, before proceed with this repository.

---

This repo tries to create two resources (VPC + EC2) using Terragrunt and Terraspace.

It's not a fork, but is very similar to this repository: https://github.com/gruntwork-io/terragrunt-infrastructure-live-example

Note: This code is solely for demonstration purposes. This is not production-ready code, so use at your own risk.

## How do you deploy the infrastructure in this repo?

The current repository structure is as follow:

```
/-
  |
  └ accounts: here you have to set AWS_KEY or AWS_PROFILE to deploy stuff in a multi-account setup
  |
  └ terragrunt: all the files and documentation omn the terragrunt project
  |
  └ terraspace: As above, but for terraspace
```

# TERRAGRUNT

Refer to this file: [TERRAGRUNT README](./terragrunt/README.md)

# TERRASPACE

Refer to this file: [TERRASPACE README](./terraspace/README.md)
