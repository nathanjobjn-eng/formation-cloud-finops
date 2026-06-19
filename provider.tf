terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }

    backend "s3" {
      bucket       = "boite-journal-terraform-joseph-nathan"
      key          = "projet-cv/terraform.tfstate"
      region       = "eu-west-3"
      use_lockfile = true 
      encrypt      = true
     }
}
provider "aws" {
    region = "eu-west-3"
    
}