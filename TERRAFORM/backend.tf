terraform {
  backend "s3" {
    bucket = "terraform-state-file-storage-test-rajesh"
    key    = "terraform.tfstate"
    #use_lockfile = true #state lock to avoid conflict
    dynamodb_table = "rajesh"
    encrypt        = true
    region         = "us-east-1"
  }
}