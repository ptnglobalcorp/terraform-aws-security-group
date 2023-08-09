locals {
  source_types = ["cidr_block", "ipv6_cidr_block", "prefix_list_id", "security_group"]
  security_group_id = aws_security_group.this.id
}

# Security group with name
resource "aws_security_group" "this" {
  name = var.name_sg
  description = var.description_sg
  
  vpc_id = var.vpc_id

  tags = merge(var.tags, {
    ApplicationRole = "Security Group"
    SensitiveData = "false"
  })
}

# Ingress - List of rules
resource "aws_vpc_security_group_ingress_rule" "ingress_rule" {
  count = length(var.ingress_rules)

  security_group_id = local.security_group_id

  cidr_ipv4 = var.ingress_rules[count.index].source_type == local.source_types[0] ? var.ingress_rules[count.index].source : null
  cidr_ipv6 = var.ingress_rules[count.index].source_type == local.source_types[1] ? var.ingress_rules[count.index].source : null
  prefix_list_id = var.ingress_rules[count.index].source_type == local.source_types[2] ? var.ingress_rules[count.index].source : null
  referenced_security_group_id = var.ingress_rules[count.index].source_type == local.source_types[3] ? var.ingress_rules[count.index].source : null

  from_port = var.ingress_rules[count.index].rule[0]
  to_port = var.ingress_rules[count.index].rule[1]
  ip_protocol = var.ingress_rules[count.index].rule[2]
  description = var.ingress_rules[count.index].rule[3]
}

# Egress - List of rules
resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  count = length(var.egress_rules)

  security_group_id = local.security_group_id

  cidr_ipv4 = var.egress_rules[count.index].source_type == local.source_types[0] ? var.egress_rules[count.index].source : null
  cidr_ipv6 = var.egress_rules[count.index].source_type == local.source_types[1] ? var.egress_rules[count.index].source : null
  prefix_list_id = var.egress_rules[count.index].source_type == local.source_types[2] ? var.egress_rules[count.index].source : null
  referenced_security_group_id = var.egress_rules[count.index].source_type == local.source_types[3] ? var.egress_rules[count.index].source : null

  from_port = var.egress_rules[count.index].rule[0]
  to_port = var.egress_rules[count.index].rule[1]
  ip_protocol = var.egress_rules[count.index].rule[2]
  description = var.egress_rules[count.index].rule[3]
}

