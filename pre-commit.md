# tf-module-template

Template for creating terraform module repo.

## Needs

- Download all the linter dependencies
- Change the URL parameter in .github/workflows/cliff.toml with the repository URL so the commits can be shown on the CHANGELOG.md file

#### Pre-commit hook

The template utilizes [pre-commit](https://pre-commit.com/) hooks to run the linters before committing the code, if you are using starting the template for the first time, you need to enable the pre-commit, after that it will work for all subsecuents commits. To use the To install the pre-commit hooks run the following command:

```bash
pre-commit install
```

#### Hook Process

After that the pre-commit will check

- Terraform fmt
- Terraform tflint
- Terraform tfsec
- Terraform validate
- Terraform docs (if the tf-docs isn't updated the is going to overrite the README.md file)
- It will check for [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bastion_host"></a> [bastion\_host](#module\_bastion\_host) | ./modules/bastion | n/a |
| <a name="module_container_registry"></a> [container\_registry](#module\_container\_registry) | ./modules/ecr | n/a |
| <a name="module_document_db"></a> [document\_db](#module\_document\_db) | ./modules/document_db | n/a |
| <a name="module_ecs_fargate"></a> [ecs\_fargate](#module\_ecs\_fargate) | ./modules/ecs | n/a |
| <a name="module_secrets_manager"></a> [secrets\_manager](#module\_secrets\_manager) | ./modules/secrets_manager | n/a |
| <a name="module_vpc_aws"></a> [vpc\_aws](#module\_vpc\_aws) | ./modules/vpc_manual | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region | `string` | `"us-east-1"` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | Availability Zones | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b"<br>]</pre> | no |
| <a name="input_bastion_creation"></a> [bastion\_creation](#input\_bastion\_creation) | Create Bastion: true or false | `bool` | `false` | no |
| <a name="input_database_subnet_cidrs"></a> [database\_subnet\_cidrs](#input\_database\_subnet\_cidrs) | Private Subnet CIDR values | `list(string)` | <pre>[<br>  "10.0.4.0/24",<br>  "10.0.5.0/24"<br>]</pre> | no |
| <a name="input_documentdb_pg_tls"></a> [documentdb\_pg\_tls](#input\_documentdb\_pg\_tls) | DocumentDB enable or disable TLS [enabled/disabled] | `string` | `"disabled"` | no |
| <a name="input_documentdb_username"></a> [documentdb\_username](#input\_documentdb\_username) | Username for documentDB | `string` | `"main"` | no |
| <a name="input_ec2_ami"></a> [ec2\_ami](#input\_ec2\_ami) | AMI | `string` | `"ami-0230bd60aa48260c6"` | no |
| <a name="input_ecr_name"></a> [ecr\_name](#input\_ecr\_name) | The name of the ECR registry | `string` | `"frontend-image"` | no |
| <a name="input_encrypt_type"></a> [encrypt\_type](#input\_encrypt\_type) | Provide type of encryption here | `string` | `"KMS"` | no |
| <a name="input_image_mutability"></a> [image\_mutability](#input\_image\_mutability) | Provide image mutability | `string` | `"IMMUTABLE"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | instance type | `string` | `"t2.micro"` | no |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | Private Subnet CIDR values | `list(string)` | <pre>[<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | Public Subnet CIDR values | `list(string)` | <pre>[<br>  "10.0.0.0/24",<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | n/a | `string` | `"10.0.0.0/16"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
