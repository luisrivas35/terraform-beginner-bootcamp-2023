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
## Dealing with config drift
### Fix using terraform refresh
````sh
terraform apply -refresh-only -auto-approve
````
### Fix missing resources with Terraform import
```
terraform import aws_s3_bucket.bucket bucket-name
```
[Terraform Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)
### Fix manual config
If someone goes and delete or modifies cloud resources

## Terraform Modules
https://developer.hashicorp.com/terraform/language/modules/sources
### Modules structure
It is recommended to place modules in a `modules` directory when working locally  
### Passing variables
The module has to declare its variables in its own file variables.tf
````tf
module "terrahouse_aws" {
    source ="./modules/terrahouse_aws"
    user_uuid ="var.user_uuid"
    bucket_name = "var.bucket_name"
}
````
It is important to take into account that variables and outputs should be declare inside the modules like:

```tf
variable "content_version" {
  description = "The content version (positive integer starting at 1)"
  type        = number
  validation {
    condition     = var.content_version > 0 && can(var.content_version, "int")
    error_message = "Content version must be a positive integer starting at 1"
  }
}

```
And it also be declare in the root level like:
```tf
variable "content_version" {
  description = "The content version (positive integer starting at 1)"
  type        = number
```
### Modules Sources
We can use differents sources eg. terraform registry, local, github 
````tf
module "terrahouse_aws" {
    source ="./modules/terrahouse_aws"
} 
````
### Condiderations using ChatGPT
It would be not trained with the latest versions of code and sometimes we get deprecated instructions 

## Working with files in terraform

### Fleexist function
Check if a file exist
```
condition = fileexists(var.index_html_filepath)
```
### Filemd5
https://developer.hashicorp.com/terraform/language/functions/filemd5

### Path variables
There is a special variable called `path` to reference a local path:
- path.module = get the path 
[Special path variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

```tf
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = var.index_html_filepath  # Replace with the path to your index.html file
 
  etag = filemd5(var.index_html_filepath)
}
```
we also created the variable path as a env variable in tfvars

### Terraform locals
Allows to define local variables(could be useful to transform data into another format)
[locals values](https://developer.hashicorp.com/terraform/language/values/locals)
```tf
locals {
  s3_origin_id = "MyS3Origin"
}
````

### Terraform Datasources
Allows use data from cloud
[datasources](https://developer.hashicorp.com/terraform/language/data-sources)
```tf
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```
### Working with JSON
Used to create an inline policy in HCL code
[Jsonencode](https://developer.hashicorp.com/terraform/language/functions/jsonencode)
```tf
jsonencode({"hello"="world"})
{"hello":"world"}
```
### Changing the resouces lifecycle
[Meta Arguments LifeCycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

### Terraform data
The replace_triggered_by lifecycle argument requires all of the given addresses to be for resources, because the decision to force replacement is based on the planned actions for all of the mentioned resources.

Plain data values such as Local Values and Input Variables don't have any side-effects to plan against and so they aren't valid in replace_triggered_by. You can use terraform_data's behavior of planning an action each time input changes to indirectly use a plain value to trigger replacement.

[](https://developer.hashicorp.com/terraform/language/resources/terraform-data)