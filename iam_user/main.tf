
variable "user_names" {
  type    = list(string)
  default = ["user1", "user2", "user3"]
}

resource "aws_iam_user" "users" {
  for_each = { for idx, username in var.user_names : username => idx }

  name = each.key
  
}


