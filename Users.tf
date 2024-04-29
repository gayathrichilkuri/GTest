provider "aws" {
    region = "us-east-2"
  
}
resource "aws_iam_policy" "read_only_s3" {
  name = "ReadOnlyS3Policy"
  path = "/"
  description = "Grants read-only access to S3 buckets"

  policy = jsonencode({
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
        ]
        Resource = [
          "*",  
        ]
      }
    ]
    Version = "2012-10-17"
  })
}

resource "aws_iam_user" "read_only_user" {
  name = "readonlyuser"
}

resource "aws_iam_user_policy_attachment" "attach_readonly_policy" {
  user       = aws_iam_user.read_only_user.name
  policy_arn = aws_iam_policy.read_only_s3.arn
}