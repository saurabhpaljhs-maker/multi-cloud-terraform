# Multi-Cloud Terraform Infrastructure 🌐

## Overview
This project provisions cloud storage infrastructure across AWS, Azure, and GCP using Terraform modules in a single codebase.

## Architecture
multi-cloud-terraform/
├── main.tf              
├── variables.tf         
├── outputs.tf           
├── terraform.tfvars     (never commit)
└── modules/
    ├── aws/             
    ├── azure/           
    └── gcp/             

## Resources Created
| Cloud | Resource | Region |
|-------|----------|--------|
| AWS | S3 Bucket | us-east-1 |
| Azure | Storage Account + Blob Container | Denmark East |
| GCP | Cloud Storage Bucket | asia-south1 |

## Prerequisites
| Tool | Version |
|------|---------|
| Terraform | >= 1.0.0 |
| AWS CLI | >= 2.0 |
| Azure CLI | >= 2.0 |
| GCP CLI | >= 400.0 |

## Authentication Setup

### AWS
\`\`\`bash
aws configure
\`\`\`

### Azure
\`\`\`bash
az login
\`\`\`

### GCP
\`\`\`bash
gcloud auth application-default login
\`\`\`

## Usage

### Initialize
\`\`\`bash
terraform init
\`\`\`

### Preview Changes
\`\`\`bash
terraform plan
\`\`\`

### Deploy
\`\`\`bash
terraform apply
\`\`\`

### Destroy
\`\`\`bash
terraform destroy
\`\`\`

## Outputs
| Output | Description |
|--------|-------------|
| aws_bucket_name | AWS S3 Bucket name |
| azure_storage_name | Azure Storage Account name |
| gcp_bucket_name | GCP Cloud Storage Bucket name |

## Security
- terraform.tfvars never committed to Git
- All storage resources are private by default
- IAM roles used for access control

## Author
- **Name:** Saurabh Pal
- **Role:** DevOps Engineer
- **GitHub:** https://github.com/yourusername
