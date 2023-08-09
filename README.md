# terraform-aws-security-group
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.egress_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.ingress_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | List of egress rules to create by name | <pre>list(object({<br>    source_type = string<br>    source = string<br>    rule = list(any) # ['from port', 'to port', 'protocol', 'description']<br>  }))</pre> | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress rules to create by name | <pre>list(object({<br>    source_type = string<br>    source = string<br>    rule = list(any) # ['from port', 'to port', 'protocol', 'description']<br>  }))</pre> | `[]` | no |
| <a name="input_sg_description"></a> [sg\_description](#input\_sg\_description) | Description of security group | `string` | `""` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Name of security group | `string` | `""` | no |
| <a name="input_sg_tags"></a> [sg\_tags](#input\_sg\_tags) | A mapping of tags to assign to security group | `map(any)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where to create security group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_arn"></a> [sg\_arn](#output\_sg\_arn) | The ARN of the security group |
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | The ID of the security group |
<!-- END_TF_DOCS -->
