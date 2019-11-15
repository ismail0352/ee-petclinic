module "petclinic_vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc.git"
  name = "petclinic_vpc"
  cidr = var.vpc_cidr_block # 172.16.0.0/16
  azs             = ["eu-west-2a"]
  private_subnets = var.private_subnet
  public_subnets  = var.public_subnet

  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Owner       = "Ismail"
    Environment = "test"
  }
}

