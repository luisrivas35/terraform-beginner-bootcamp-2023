# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure
Our root Structure:
```
PROJECT_ROOT
|-- variables.tf      => stores input variables
|-- main.tf           => principal code
|-- providers.tf      => required providers and configurations
|-- outputs.tf        => stores outputs
|-- terraform.tfvars  => variables in our project
|-- README.md         => required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform input variables

### Terraform Cloud environment vars
We have two types:
- Terraform vars => those you put in tfvars
- Environment vars => those you normally put in your bash env vars

### Loading Terraform input variables
[Terraform Input variables](https://developer.hashicorp.com/terraform/language/values/variables)

#### var flag
We can use the `-var` flag to set up or override a variable in the tfvars file eg.
`terraform init -var user_uuid="my-user-id"`
#### var-file flag
- to do: research and document this flag
#### terraform.tfvars
This is the default file to load variables in Terraform
#### auto.tfvars
- to do: research and document this flag
#### order of terraform variables
- to do: research and document

