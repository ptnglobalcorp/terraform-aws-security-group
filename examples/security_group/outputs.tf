output "sg_arn" {
  description = "The ARN of the security group"
  value = module.security_group.sg_arn 
}

output "sg_id" {
  description = "The ID of the security group"
  value = module.security_group.sg_id
}