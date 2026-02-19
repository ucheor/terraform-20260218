terraform {
  backend "s3" {
    bucket = "terraform-20260218"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}