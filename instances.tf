data "aws_ami" "ubuntu18" {
  most_recent = true
  owners = [var.ubuntu_account_number]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

module "petclinic_ec2_nat" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"
  instance_count              = 1
  name                        = "petclinic_ec2_nat"
  ami                         = data.aws_ami.ubuntu18.id
  instance_type               = var.instance_type
  subnet_id                   = tolist(module.petclinic_vpc.public_subnets)[0]
  vpc_security_group_ids      = [module.petclinic_sg_group.this_security_group_id]
  associate_public_ip_address = true
  user_data                   = file("./public.sh")
  key_name                    = var.key_pair

  tags = {
    Owner = "Tagnos"
  }
}

module "petclinic_ec2_private" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"
  instance_count              = 1
  name                        = "petclinic_ec2_private"
  ami                         = data.aws_ami.ubuntu18.id
  instance_type               = var.instance_type
  subnet_id                   = tolist(module.petclinic_vpc.private_subnets)[0]
  vpc_security_group_ids      = [module.petclinic_sg_group.this_security_group_id]
  associate_public_ip_address = false
  user_data                   = file("./private.sh")
  key_name                    = var.key_pair

  tags = {
    Owner = "Tagnos"
  }
}