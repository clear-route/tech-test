terraform {
  backend "s3" {
    bucket = "my-backend-bucket"
    key    = "/home/.aws/key"
    region = "us-east-1"
    profile = "defalut"
  }
}
