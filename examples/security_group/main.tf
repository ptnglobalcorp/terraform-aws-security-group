locals {
  sg_tags = {
    Project = "${var.project}"
    Environment = "${var.environment}"
    Name = "${var.prefix}-${var.project}-${var.environment}-sg-${var.region_code}-allow-all"      
  }
}

# Security Group
module "security_group" {
  source = "./../../"

  description_sg = "This is security group that created by terraform"
  name_sg = local.sg_tags.Name
  vpc_id = "vpc-0cd411d05d952eaa8"

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

  tags = local.sg_tags
}