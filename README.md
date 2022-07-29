# Chapter-1 | IAM - Security & Auditing Cloud 

Cloud Security Labs to learn IAM policies following the least privilege principle. 

Looking for an instructor led workshop on cloud? Connect on [training@securitydojo.co.in](mailto:training@securitydojo.co.in).

## Introduction

These labs can be setup using terraform and setup AWS resources.

## Training Prerequsites 

* Familiarity with AWS console.
* Comfortable using command-line tools to log in to servers, install packages, execute scripts and applications
* Basics of Networking concepts enough to understand Cloud Architecture.
* Configured AWS CLI with ```AdministratorAccess```.

## Preparing the lab environment via terraform 


Basic Terraform
Step 1: Change directory
cd /root/aws-security-training/terraform_intro/basic
CopyErrorCopied
Step 2: Initialize the terraform plugins
terraform init
CopyErrorCopied
Step 3: Describe the plan of action
terraform plan
CopyErrorCopied
Step 4: Now create the infrastructure
terraform apply
CopyErrorCopied
NOTE: To skip typing yes try terraform apply -auto-approve.

Step 5: Once you entered. It will create a S3 bucket. In the output you will see a S3 bucket name and S3 bucket URL.

Step 6: To see the created S3 bucket click on the BucketURL link.

Teardown
Step 1: Change directory
cd /root/aws-security-training/terraform_intro/basic
CopyErrorCopied
Step 2: Now you can destroy the box
terraform destroy
CopyErrorCopied
NOTE: To skip typing yes try terraform destroy -force.

It will take few minutes.

Advanced Terraform
Step 1: Change directory
cd /root/aws-security-training/terraform_intro/advanced
CopyErrorCopied
Step 2: Initialize the terraform plugins
terraform init
CopyErrorCopied
Step 3: Describe the plan of action
terraform plan
CopyErrorCopied
Step 4: Now create the infrastructure
terraform apply -auto-approve
CopyErrorCopied
Step 5: In ProvisionedServerInfo just copy the URL and paste into the browser. You will see a Welcome Page.
Teardown
Step 1: Now you can destroy the box
terraform destroy -auto-approve
CopyErrorCopied
It will take few minutes.

References
https://www.terraform.io/intro/index.html
https://learn.hashicorp.com/terraform/


The CloudFormation template `lab-environment.yml` creates a lab environment consisting of:

* EC2 Instance with an IAM role attached (*access to SSM is granted for Session Manager access*)
* S3 bucket
* SSM parameters

1. Create a CloudFormation stack based on the template `lab-environment.yml`.
    1. Set stack name to your name but only use characters `a-z` (lowercase!).
1. Make a note with the outputs of the stack: `IamRole`, `S3Bucket`.
1. Connect to the EC2 instance using SSM Session Manager
    1. Visit https://console.aws.amazon.com/systems-manager/session-manager/start-session
    1. Select your instance
    1. Push the **Start Session** button
    1. Jump to your home directory: `cd ~`
1. Done. You can now start with the labs.

## Labs

* [Lab 01: S3 read access](https://github.com/justmorpheus/ch1_iam/tree/main/01-s3-read)
* [Lab 02: S3 read and write with prefix](https://github.com/justmorpheus/ch1_iam/tree/main/02-s3-prefix)
* [Lab 03: Parameter Store read access](https://github.com/justmorpheus/ch1_iam/tree/main/03-parameterstore-path)
* [Lab 04: Grant access to KMS customer managed CMK](https://github.com/justmorpheus/ch1_iam/tree/main/04-kms-cmk)
* [Lab 05: Terminate EC2 instance with tag](https://github.com/justmorpheus/ch1_iam/tree/main/05-ec2-terminate-tag)
* [Lab 06: Launch EC2 instance with tag](https://github.com/justmorpheus/ch1_iam/tree/main/06-ec2-launch-tag)

## Clean up

1. Empty your S3 bucket created via terraform.
1. Destroy your infrastructure via `terraform destroy --auto-approve`.

## Thanks to Widdix

This AWS workshops has been tailored to your needs, for the original lab see [widdix/learn-*](https://github.com/widdix?q=learn-).
