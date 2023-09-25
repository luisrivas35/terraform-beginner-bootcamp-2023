# Terraform Beginner Bootcamp 2023
- [Terraform Beginner Bootcamp 2023](#terraform-beginner-bootcamp-2023)
  * [Semantic Versioning](#semantic-versioning)
  * [Steps:](#steps-)
    + [check linux version ex.](#check-linux-version-ex)
    + [Install Terraform from:](#install-terraform-from-)
    + [make a script portable](#make-a-script-portable)
    + [file permissions](#file-permissions)
    + [Gitpod lifecycle](#gitpod-lifecycle)
    + [This bash script is located in:](#this-bash-script-is-located-in-)
    + [Work with ENV var](#work-with-env-var)
    + [AWS CLI Installation](#aws-cli-installation)
    + [Install or update the latest version of the AWS CLI](#install-or-update-the-latest-version-of-the-aws-cli)
    + [Check if our credentials are configured](#check-if-our-credentials-are-configured)
    + [Generate AWS credential for terraform user](#generate-aws-credential-for-terraform-user)
  * [Terraform Basics](#terraform-basics)
    + [Terraform Registry](#terraform-registry)
    + [Terraform Console](#terraform-console)
      - [Terraform init](#terraform-init)
      - [Terraform plan](#terraform-plan)
      - [Terraform apply](#terraform-apply)
    + [Terraform destroy:](#terraform-destroy-)
    + [Terraform Lock File](#terraform-lock-file)
    + [Terraform State File](#terraform-state-file)
    + [Terraform issues with login and gitpod](#terraform-issues-with-login-and-gitpod)
    + [Add alias to ~/.bash_profile](#add-alias-to---bash-profile)

## Semantic Versioning

This project will utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)


## Steps:

- ### check linux version ex.
    $ cat /etc/os-release
     ```
    PRETTY_NAME="Ubuntu 22.04.3 LTS"
    NAME="Ubuntu"
    VERSION_ID="22.04"
    VERSION="22.04.3 LTS (Jammy Jellyfish)"
    VERSION_CODENAME=jammy
    ID=ubuntu
    ID_LIKE=debian
    HOME_URL="https://www.ubuntu.com/"
    SUPPORT_URL="https://help.ubuntu.com/"
    BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
    PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
    UBUNTU_CODENAME=jammy
    ```


- ### Install Terraform from: 
    [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

- ### make a script portable
    https://en.wikipedia.org/wiki/Shebang_(Unix)

- ### file permissions
    https://en.wikipedia.org/wiki/Chmod

- ### Gitpod lifecycle
    https://www.gitpod.io/docs/configure/workspaces/tasks

- ### This bash script is located in: 
    [ ./bin/install_terraform_cli.sh ](./bin/install_terraform_cli.sh)

- ### Work with ENV var
    Create a .env.xxxx 

- ### AWS CLI Installation
    AWS CLI is installed for this project via the bash script `./bin/install_aws_cli`

- ### Install or update the latest version of the AWS CLI
    [Getting Started AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

- ### Check if our credentials are configured
    ```sh
    aws sts get-caller-identity
    ```

   * [AWS CLI env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

- ### Generate AWS credential for terraform user
    If it is successful you see something like this:
    ```json
    {
        "UserId": "AKIAIOSFODNN7EXAMPLE",
        "Account": "123456789012",
        "Arn": "arn:aws:iam::123456789012:user/terraform_user"
    }
    ```
    we'll need to generate AWS CLI credits from AIM user in order to the user AWS CLI 

## Terraform Basics

### Terraform Registry

Terraform registry located at: [registry.terraform.io](https://registry.terraform.io/)

- **Providers** are interfaces to API that will allow to create resources.
- **Modules** are a way to refactor to make a large amount of code modular, portable and sharable.

### Terraform Console

list terraform commands:
```
terraform
```
[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)

#### Terraform init
At the start of a new project:
```
terraform init
```

#### Terraform plan
Generate a changeset about the state of the infra and changes. 
```
terraform plan
```

#### Terraform apply
Execute a changeset.
```
terraform apply
```
To make it automatically:
```
terraform apply --auto-approve
```

### Terraform destroy:
Destroy 
```
terraform destroy
```

### Terraform Lock File
`.terraform.lock.hcl` contains the locked versioning for providers or modules used. It should be committed to your git repo.

### Terraform State File
`.terraform.tfstate` contains info about the current state of youur infra. It should not be committed. It is sensitive data.

`.terraform.lock.backup` contains the previous file state

### Terraform issues with login and gitpod
when attempted to login, a windows appears to aks for a token credentials to tf cloud and need to do manually
```
https://app.terraform.io/app/settings/tokens?source=terraform-login
```
The file lives in here:
````
/home/gitpod/.terraform.d/credentials.tfrc.json
````
Write this info:
````json
{
  "credentials": {
    "app.terraform.io": {
      "token": "your-token-here"
    }
  }
}
````
Automate this process using the scrip located in:
````sh
./bin/create_tfrc_cred.sh
````
### Add alias to ~/.bash_profile
Add an alias to bash profile and automate it with a bash script
````
alias tf="terraform"
````
if it not work, add this to the gitpod yml to assure it is executed properly:
````
source ~/.bash_profile  
````





