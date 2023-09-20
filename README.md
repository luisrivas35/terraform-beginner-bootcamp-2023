# Terraform Beginner Bootcamp 2023

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