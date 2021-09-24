SHELL := /bin/bash
NOOP := /bin/sh -c true # Avoid error like: make[1]: Nothing to be done for `xxxx' AND xxx is up to date.
NOECHO := @
THIS_FILE := $(lastword $(MAKEFILE_LIST))


.PHONY: separator 
# Avoid error: "make[1]: `separator' is up to date."
separator: ;
	$(NOECHO) $(NOOP)
	$(info ===============================================================================)


######################################################################################################
############################################ DEV ACCOUNT #############################################
######################################################################################################

#### VPC ####
dev-vpc-init:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && cd ./dev-account/eu-central-1/test/vpc-service && terragrunt init

dev-vpc-plan:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && cd ./dev-account/eu-central-1/test/vpc-service && terragrunt validate-inputs && terragrunt hclfmt && terragrunt plan

dev-vpc-run:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && cd ./dev-account/eu-central-1/test/vpc-service && terragrunt apply

dev-vpc-destroy:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && cd ./dev-account/eu-central-1/test/vpc-service && terragrunt destroy


#### EC2 ####
dev-ec2-init:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && cd ./dev-account/eu-central-1/test/ec2-service && terragrunt init

dev-ec2-plan:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && cd ./dev-account/eu-central-1/test/ec2-service && terragrunt validate-inputs && terragrunt hclfmt && terragrunt plan

dev-ec2-run:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && cd ./dev-account/eu-central-1/test/ec2-service && terragrunt apply

dev-ec2-destroy:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && cd ./dev-account/eu-central-1/test/ec2-service && terragrunt destroy


#### SHARED PLAN DEV ####
dev-plan-all:
	@echo $@  # print target name
	source ../accounts/dev-account.sh && cd ./dev-account/eu-central-1/test/ && terragrunt plan-all

#### APPLY ALL DEV ####
# I prefer to manually manage the apply all
dev-run-all:
	@$(MAKE) -f $(THIS_FILE) separator
	@$(MAKE) -f $(THIS_FILE) vpc-run
	@$(MAKE) -f $(THIS_FILE) separator
	@$(MAKE) -f $(THIS_FILE) ec2-run
	@$(MAKE) -f $(THIS_FILE) separator 

######################################################################################################
############################################ TEST ACCOUNT ############################################
######################################################################################################
#### SHARED PLAN TEST ####
test-plan-all-test:
	@echo $@  # print target name
	source ../accounts/test-account.sh && cd ./test-account/eu-central-1/test/ && terragrunt plan-all

#### VPC ####
test-vpc-plan:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/test/vpc-service && terragrunt validate-inputs && terragrunt hclfmt && terragrunt plan

test-vpc-run:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/test/vpc-service && terragrunt apply

test-vpc-destroy:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/test/vpc-service && terragrunt destroy

#### EC2 ####
test-ec2-plan:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/test/ec2-service && terragrunt validate-inputs && terragrunt hclfmt && terragrunt plan

test-ec2-run:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/test/ec2-service && terragrunt apply
	
test-ec2-destroy:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/test/ec2-service && terragrunt destroy



#### SHARED PLAN QA ####
qa-plan-all-qa:
	@echo $@  # print target name
	source ../accounts/test-account.sh && cd ./test-account/eu-central-1/qa/ && terragrunt plan-all


#### VPC ####
qa-vpc-plan:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/qa/vpc-service && terragrunt validate-inputs && terragrunt hclfmt && terragrunt plan

qa-vpc-run:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/qa/vpc-service && terragrunt apply

qa-vpc-destroy:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/qa/vpc-service && terragrunt destroy

#### EC2 ####
qa-ec2-plan:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/qa/ec2-service && terragrunt validate-inputs && terragrunt hclfmt && terragrunt plan

qa-ec2-run:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/qa/ec2-service && terragrunt apply

qa-ec2-destroy:
	@echo $@  # print target name
	source ./../accounts/test-account.sh && cd ./test-account/eu-central-1/qa/ec2-service && terragrunt destroy