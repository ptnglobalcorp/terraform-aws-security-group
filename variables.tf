variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = null
}

variable "name_sg" {
  description = "Name of security group - not required if create_sg is false"
  type        = string
  default     = ""
}

variable "description_sg" {
  description = "Description of security group"
  type        = string
  default     = ""
}

variable "tags" {
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




