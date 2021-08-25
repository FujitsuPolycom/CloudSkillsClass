terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version =  "3.7"
        }
    }
}

    provider "aws" {
        region = "us-east-2"
    }

    module "webserver" {
        source = "./Modules/ec2"

        servername = "terraformTest"
        size = "t3.micro"
    }