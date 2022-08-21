# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create ham role

resource "aws_iam_role" "mystack" {
  name               = "ch_1_iam_cloud_securitydojo"
  assume_role_policy = "${file("assumerolepolicy.json")}"
}

resource "aws_iam_policy" "policy" {
  name        = "ch1_lab_ss_connection_securitydojo"
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

# Create Ec2 in the region us-east-2

resource "aws_instance" "iam-security-ch1" {
  ami             = "ami-0d08ef957f0e4722b"
  instance_type   = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.test_profile.name}"

  tags = {
    Name = "securitydojo"
  }
}

# Create S3 bucket

resource "aws_s3_bucket" "s3bucket" {
  bucket_prefix = "securitydojo-"
  force_destroy = true
  tags = {
    Name        = "securitydojo"
    Environment = "ch1_iam"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.s3bucket.id
  acl    = "private"

  
}

# SSM parameter store-1
resource "aws_ssm_parameter" "foo" {
  name  = "/var/secret/1"
  type  = "String"
  value = "secret"
}

# SSM parameter store-2
resource "aws_ssm_parameter" "foo2" {
  name  = "/var/secret/2"
  type  = "String"
  value = "secret"
}
# SSM parameter store-2
resource "aws_ssm_parameter" "too" {
  name  = "/var/supersecret"
  type  = "String"
  value = "superuser_secret"
}

# Output

output "s3bucket" {
  value = aws_s3_bucket.s3bucket.id
  description = "S3 Bucket"

}


output "iamrole" {
  value = aws_iam_role.mystack.name
  description = "Iam Role"

}


output "ec2" {
  value = aws_instance.iam-security-ch1.tags.Name
  description = "Ec2"

}

output "ssm-parameter-1" {
  value = aws_ssm_parameter.foo.name
  description = "SSM parameter name"
}

output "ssm-parameter-2" {
  value = aws_ssm_parameter.foo2.name
  description = "SSM parameter name"
}

output "ssm-parameter-3" {
  value = aws_ssm_parameter.too.name
  description = "SSM parameter name"
}
