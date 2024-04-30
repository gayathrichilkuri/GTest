
variable "user_names" {
  default = ["user1", "user2", "user3"]  
}

resource "aws_iam_user" "users" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}


resource "aws_iam_policy" "ec2_full_access_policy" {
  name        = "EC2FullAccessPolicy"
  description = "Provides full access to EC2"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = "ec2:*",
      Resource = "*",
    }]
  })
}


resource "aws_iam_user_policy_attachment" "attach_policy" {
  count       = length(var.user_names)
  user        = aws_iam_user.users[count.index].name
  policy_arn  = aws_iam_policy.ec2_full_access_policy.arn
}
