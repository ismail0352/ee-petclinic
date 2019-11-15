variable "region" {
  default = "eu-west-2"
}

variable "vpc_cidr_block" {
  default = "172.20.0.0/16"
}

variable "public_subnet" {
  default = ["172.20.10.0/24"]
}

variable "private_subnet" {
  default = ["172.20.20.0/24"]
}

variable "ubuntu_account_number" {
  default = "099720109477"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_pair" {
  default = "ubuntu"
}