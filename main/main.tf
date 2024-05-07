provider "aws" {
  region = "us-east-2" 
}

module "user1" {
  source     = "../MODULE"
  user_name  = "user1"
}

module "user2" {
  source     = "../MODULE"
  user_name  = "user2"
}
