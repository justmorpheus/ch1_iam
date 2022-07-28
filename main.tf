# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}


resource "aws_iam_role" "mystack" {
  name               = "ch_1_iam_cloud_securitydojo"
  assume_role_policy = "${file("assumerolepolicy.json")}"
}

resource "aws_iam_policy" "policy" {
  name        = "DO-NOT-CHANGE-LAB-SSM-CONNECTION"
  description = "Policy for ch_1_iam_cloud_securitydojo"
  policy      = "${file("policys3bucket.json")}"
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "policy_to_role_securitydojo"
  roles      = ["${aws_iam_role.mystack.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "aws_iam_instance_profile" "test_profile" {                             
name  = "test_profile"                         
role = aws_iam_role.mystack.name
}


resource "aws_instance" "iam-security-ch1" {
  ami             = "ami-0d08ef957f0e4722b"
  instance_type   = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"

  tags = {
    Name = "securitydojo"
  }
}


resource "aws_s3_bucket" "s3bucket" {
  bucket_prefix = "securitydojo-"

  tags = {
    Name        = "securitydojo"
    Environment = "ch1_iam"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.s3bucket.id
  acl    = "private"
}


resource "aws_ssm_parameter" "foo" {
  name  = "/var/secret"
  type  = "String"
  value = "superuser_secret"
}