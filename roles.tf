provider "aws" {
  region = "us-east-2"  
}

resource "aws_iam_role" "s3_full_access_to_ec2_role" {
  name               = "s3fullaccesstoec2"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "s3_full_access_policy" {
  name        = "s3-full-access-policy"
  description = "Allows full access to S3"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "s3:*"
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "s3_full_access_policy_attachment" {
  role       = aws_iam_role.s3_full_access_to_ec2_role.name
  policy_arn = aws_iam_policy.s3_full_access_policy.arn
}
