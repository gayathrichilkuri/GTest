provider "aws" {
  region = "us-east-2"
}


variable "user_names" {
  default = ["user1", "user2", "user3"]
}


resource "aws_iam_user" "iam_users" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}