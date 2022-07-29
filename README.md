1

# Chapter-1 | IAM - Security & Auditing Cloud 

2

​

3

Cloud Security Labs to learn IAM policies following the least privilege principle. 

4

​

5

Looking for an instructor led workshop on cloud? Connect on [training@securitydojo.co.in](mailto:training@securitydojo.co.in).

6

​

7

## Introduction

8

​

9

These labs can be setup using terraform and setup AWS resources.

10

​

11

## Training Prerequsites 

12

​

13

* Familiarity with AWS console.

14

* Comfortable using command-line tools to log in to servers, install packages, execute scripts and applications

15

* Basics of Networking concepts enough to understand Cloud Architecture.

16

* Configured AWS CLI with ```AdministratorAccess```.

17

​

18

## Preparing the lab environment via terraform 

19

​

20

1. Clone the github repository 

21

    ```git clone https://github.com/justmorpheus/ch1_iam

22

    ```

23

2. Setup the aws cli via 

24

    ```* Go to browser

25

    Signup/Signin to aws console

26

​

27

Step 3: In the search bar type IAM

28

​

29

Step 4: Click on Users on the sidebar

30

​

31

Step 5: Click on add user, you will be redirected to a new page

32

​

33

Step 6: Fill the user name you wish

34

​

35

Step 7: In the Access type checkbox selection select Programmatic access and click Next

36

​

37

Step 8: Now select Attach existing policies directly

38

​

39

Step 9: In the search bar enter AdministratorAccess

40

​

41

Step 10: Now select the one which has a Policy name as AdministratorAccess and click Next and again click Next

42

​

43

Step 11: Now click Create User

44

​

45

Step 12: Now you can download the csv file that will have your access-key and secret-key

46

​

47

Step 13: Open terminal

48

​

49

Step 14: Initiate configuration

50

       

51

    ```

52

4. Basic Terraform

53

    - Step 1: Change directory: ```cd /root/aws-security-training/terraform_intro/basic```

54

    - Step 2: Initialize the terraform plugins via ```terraform init```

55

    - Step 3: Describe the plan of action via ```terraform plan```

56

    - Step 4: Now create the infrastructure via ```terraform apply```

57

​

58

​

59

​

60

CopyErrorCopied

61

NOTE: To skip typing yes try terraform apply -auto-approve.

62

​

63

Step 5: Once you entered. It will create a S3 bucket. In the output you will see a S3 bucket name and S3 bucket URL.

64

​

65

Step 6: To see the created S3 bucket click on the BucketURL link.

66

​

67

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
