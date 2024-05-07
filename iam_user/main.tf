variable "user_name" {}

resource "aws_iam_user" "user" {
  name = var.user_name
}

output "iam_user_arn" {
  value = aws_iam_user.user.arn
}
