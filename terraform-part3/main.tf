terraform {
  backend "s3" {
    bucket = "assignment8-terraform-state-835223785879"
    key    = "part3/terraform.tfstate"
    region = "ap-south-1"
  }
}