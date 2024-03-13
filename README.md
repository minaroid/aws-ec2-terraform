# AWS EC2 Terraform

This repository contains Terraform configurations to manage AWS EC2 (Elastic Compute Cloud) resources.

## Overview

The AWS EC2 Terraform configuration allows you to define and manage EC2 instances, security groups, key pairs, and other related resources in your AWS account. With Terraform, you can automate the provisioning and management of EC2 instances, enabling you to create, update, and delete resources as code.

## Features

- Define EC2 instances, security groups, key pairs, and other resources as code.
- Provision and manage infrastructure in a repeatable and predictable manner.
- Automate the deployment and scaling of applications on AWS.
- Integrate with other AWS services and resources using Terraform modules.

## Prerequisites

Before getting started, ensure you have the following installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI (configured with appropriate permissions)

## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/minaroid/aws-ec2-terraform.git
    ```

2. Navigate to the project directory:

    ```bash
    cd aws-ec2-terraform
    ```

3. Initialize Terraform:

    ```bash
    terraform init
    ```

4. Review the Terraform plan:

    ```bash
    terraform plan
    ```

5. Apply the Terraform configuration:

    ```bash
    terraform apply
    ```

## Configuration

- Update the `terraform.tfvars` file with your AWS credentials and any other configuration variables specific to your environment.

## Contributing

Contributions are welcome! Feel free to submit pull requests, suggest improvements, or report issues.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
