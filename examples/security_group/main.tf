locals {
  sg_tags = {
    Project = "${var.project}"
    Environment = "${var.environment}"
    Name = "${var.prefix}-${var.project}-${var.environment}-sg-${var.region_code}-allow-all"      
  }
}

resource "aws_vpc" "vpc_example" {
  cidr_block = "10.0.0.0/16"
}

# Security Group
module "security_group" {
  source = "./../../"

  sg_description = "This is security group that created by terraform"
  sg_name = local.sg_tags.Name
  vpc_id = aws_vpc.vpc_example

  ingress_rules = [
    {
      source_type = "cidr_block"
      source = "0.0.0.0/0"
      rule = [0, 65535, "tcp", "SMTP"]
    }
  ]
  egress_rules = [
    {
      source_type = "cidr_block"
      source = "0.0.0.0/0"
      rule = [0, 65535, "tcp", "SMTP"]
    }
  ]

  sg_tags = local.sg_tags
}
