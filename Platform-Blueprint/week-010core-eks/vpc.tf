module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = "week-01-eks"
  cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b"]
  private_subnets = []
  public_subnets = []

  enable_dns_support = true
  enable_dns_hostnames = true
  enable_nat_gateway = true
}