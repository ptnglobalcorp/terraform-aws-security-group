variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "sg_name" {
  description = "Name of security group"
  type        = string
  default     = ""
}

variable "sg_description" {
  description = "Description of security group"
  type        = string
  default     = ""
}

variable "sg_tags" {
  description = "A mapping of tags to assign to security group"
  type        = map(any)
  default     = {}
}

# Ingress
variable "ingress_rules" {
  description = "List of ingress rules to create by name"
  type = list(object({
    source_type = string
    source = string
    rule = list(any) # ['from port', 'to port', 'protocol', 'description']
  }))
  default = []
}

# Egress
variable "egress_rules" {
  description = "List of egress rules to create by name"
  type = list(object({
    source_type = string
    source = string
    rule = list(any) # ['from port', 'to port', 'protocol', 'description']
  }))
  default = []
}