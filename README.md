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

1. Clone the github repository via
     ```git clone https://github.com/justmorpheus/ch1_iam```
2. Setup the aws cli via 
```* Go to browser
   * Signup/Signin to aws console
   * In the search bar type IAM
   * Click on Users on the sidebar
   * Click on add user, you will be redirected to a new page
   * Fill the user name you wish
   * In the Access type checkbox selection select Programmatic access and click Next
   * Now select Attach existing policies directly
   * In the search bar enter AdministratorAccess
   * Now select the one which has a Policy name as AdministratorAccess and click Next and again click Next
   * Now click Create User
   * Now you can download the csv file that will have your access-key and secret-key
   * Open terminal and run ```aws configure```.
 ```


4. Basic Terraform

    - Step 1: Change directory: ```cd /root/aws-security-training/terraform_intro/basic```
    - Step 2: Initialize the terraform plugins via ```terraform init```
    -  Step 3: Describe the plan of action via ```terraform plan```
    -  Step 4: Now create the infrastructure via ```terraform apply```
    NOTE: To skip typing yes try terraform apply -auto-approve.



Step 5: Once you entered. It will create a S3 bucket. In the output you will see a S3 bucket name and S3 bucket URL.

Step 6: To see the created S3 bucket click on the BucketURL link.



Teardown

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
