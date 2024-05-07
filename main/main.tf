provider "aws" {
  region = "us-east-2" 
}


module "example" {
  source     = "../MODULE"
  user_names = ["user1", "user2", "user3"]
}


