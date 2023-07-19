terraform {
  backend "s3" {
    bucket = "devops-stage2"
    key    = "terraform.tfstate"
    region = "us-west-1"
    profile = "defalut"
    encrypt = true
  }
}

