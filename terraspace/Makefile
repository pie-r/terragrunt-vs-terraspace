SHELL := /bin/bash
NOOP := /bin/sh -c true # Avoid error like: make[1]: Nothing to be done for `xxxx' AND xxx is up to date.
NOECHO := @
THIS_FILE := $(lastword $(MAKEFILE_LIST))




.PHONY: separator 
# Avoid make[1]: `separator' is up to date.
separator: ;
	$(NOECHO) $(NOOP)
	$(info ===============================================================================)


############################
####### DEV ACCOUNT ########
############################

# not override the files. See with the diff proposed by terraspace which are the difference between the default new project, and mine
dev-init:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && export TS_ENV="qa" terraspace new project infrastructure --plugin aws


# vpc
dev-vpc-plan:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && export TS_ENV="qa" && cd infrastructure && bundle exec "terraspace plan vpc-service"

dev-vpc-run:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && export TS_ENV="qa" && cd infrastructure && bundle exec terraspace up vpc-service

dev-vpc-destroy:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && export TS_ENV="qa" && cd infrastructure && bundle exec terraspace down vpc-service

# ec2
dev-ec2-plan:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && export TS_ENV="qa" && cd infrastructure && bundle exec "terraspace plan ec2-service"

dev-ec2-run:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && export TS_ENV="qa" && cd infrastructure && bundle exec terraspace up ec2-service

dev-ec2-destroy:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && export TS_ENV="qa" && cd infrastructure && bundle exec terraspace down ec2-service



# create all the resources with a single command
dev-run:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && export TS_ENV="qa" && cd infrastructure && bundle exec terraspace all up

# destroy all
dev-destroy:
	@echo $@  # print target name
	source ./../accounts/dev-account.sh && export TS_ENV="qa" && cd infrastructure && bundle exec terraspace all down