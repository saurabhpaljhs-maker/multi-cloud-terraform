Overview

This project provisions cloud storage infrastructure across AWS, Microsoft Azure, and Google Cloud Platform using Terraform. It follows a modular architecture, allowing each cloud provider to be managed independently while keeping the code reusable and easy to maintain.

Architecture
                          Developer
                              │
                              │
                     terraform apply
                              │
                              ▼
                    Terraform Root Module
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
        ▼                     ▼                     ▼
   AWS Module           Azure Module          GCP Module
        │                     │                     │
        ▼                     ▼                     ▼
   Amazon S3          Storage Account      Cloud Storage
      Bucket          + Blob Container         Bucket
Project Structure
multi-cloud-terraform
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
├── .gitignore
│
└── modules
    ├── aws
    ├── azure
    └── gcp
Deployment Workflow
Write Terraform Code
        │
        ▼
terraform init
        │
        ▼
terraform validate
        │
        ▼
terraform plan
        │
        ▼
terraform apply
        │
        ▼
Resources Created in AWS, Azure and GCP
Resources Created
Cloud Provider	Resource	Region
AWS	Amazon S3 Bucket	us-east-1
Azure	Storage Account with Blob Container	Denmark East
GCP	Cloud Storage Bucket	asia-south1
Prerequisites
Terraform 1.0 or later
AWS CLI
Azure CLI
Google Cloud CLI
Authentication

AWS

aws configure

Azure

az login

Google Cloud

gcloud auth application-default login

Deployment Steps
Clone the repository.
Open the project directory.
Run Terraform initialization.
Validate the configuration.
Review the execution plan.
Apply the infrastructure.
Verify that resources are created in all three cloud providers.
Outputs
AWS S3 Bucket Name
Azure Storage Account Name
GCP Storage Bucket Name
Security
Sensitive values are stored in the terraform.tfvars file and are excluded from Git.
Cloud credentials are managed using the respective cloud CLIs.
Storage resources are private by default.
IAM and RBAC permissions are used to control access.
The modular structure makes the project easier to maintain and extend.
Technologies Used
Terraform
AWS S3
Azure Storage Account
Azure Blob Storage
Google Cloud Storage
AWS CLI
Azure CLI
Google Cloud CLI
Key Features
Multi-Cloud Infrastructure Provisioning
Modular Terraform Architecture
Reusable Terraform Modules
Infrastructure as Code (IaC)
Secure Authentication
Scalable Project Structure
Easy Deployment and Cleanup
