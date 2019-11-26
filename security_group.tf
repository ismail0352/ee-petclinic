module "petclinic_sg_group" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group.git"
  name                      = "petclinic_sg_group"
  description               = "Secuirty Group for petclinic server"
  vpc_id                    = module.petclinic_vpc.vpc_id
  ingress_cidr_blocks       = ["0.0.0.0/0"]
  ingress_rules             = ["ssh-tcp", "http-80-tcp", "https-443-tcp", "http-8080-tcp"]
  egress_rules              = ["all-all"]

  tags = {
    Owner              = "Ismail"
    Environment        = "test"
  }
}

module "petclinic_sg_private" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group.git"
  name                      = "petclinic_sg_group_private"
  description               = "Secuirty Group for petclinic server private instance"
  vpc_id                    = module.petclinic_vpc.vpc_id
  ingress_cidr_blocks       = var.public_subnet
  ingress_rules             = ["ssh-tcp", "http-80-tcp", "https-443-tcp", "http-8080-tcp"]
  egress_rules              = ["all-all"]

  tags = {
    Owner              = "Ismail"
    Environment        = "test"
  }
}