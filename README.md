# Multi-Cloud Storage Provisioning with Terraform 

A clean, modular Terraform project designed to spin up cloud storage infrastructure across AWS, Azure, and Google Cloud Platform (GCP) simultaneously. Built with a strict multi-tier modular architecture, this codebase ensures each cloud environment remains decoupled, highly reusable, and easy to maintain.

---

##  Architecture Overview

The root module acts as the orchestrator, passing configuration variables down to cloud-specific sub-modules. Each module independently manages authentication and resource lifecycles for its respective cloud provider.

                          Developer
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
   Amazon S3          Storage Account       Cloud Storage
     Bucket           + Blob Container         Bucket

---

##  Project Structure

multi-cloud-terraform/
│
├── main.tf              # Main entry point (calls the cloud modules)
├── provider.tf          # Configures cloud providers & required versions
├── variables.tf         # Global input variables
├── outputs.tf           # Aggregated outputs from all providers
├── terraform.tfvars     # Local environment variables (git-ignored)
├── .gitignore           # Excludes state files and sensitive secrets
│
└── modules/             # Encapsulated cloud-specific infrastructure
    ├── aws/             # AWS S3 resources
    ├── azure/           # Azure Storage & Blob resources
    └── gcp/             # GCP Cloud Storage resources

---

##  Provisioned Resources

| Cloud Provider | Managed Resource | Default Region |
| :--- | :--- | :--- |
| AWS | Amazon S3 Bucket | us-east-1 |
| Azure | Storage Account & Blob Container | Denmark East |
| GCP | Cloud Storage Bucket | asia-south1 |

---

##  Prerequisites

Before executing the deployment workflow, ensure you have the following tools installed locally:

- Terraform (v1.0 or later)
- AWS CLI
- Azure CLI
- Google Cloud SDK (gcloud CLI)

---

##  Local Authentication Setup

You must authenticate with each cloud provider's CLI terminal before running the Terraform deployment:

1. AWS Authentication:
aws configure

2. Azure Authentication:
az login

3. Google Cloud Authentication:
gcloud auth application-default login

---

##  Deployment Workflow

Follow these step-by-step commands to initialize, validate, review, and provision your multi-cloud infrastructure:

Write/Edit Code --> terraform init --> terraform validate --> terraform plan --> terraform apply

Step 1: Clone & Navigate
git clone <repository-url>
cd multi-cloud-terraform

Step 2: Initialize Terraform
terraform init

Step 3: Validate & Plan
terraform validate
terraform plan

Step 4: Apply Changes
terraform apply

---

##  Output Verification

Upon a successful terraform apply, the terminal will display the names of the newly generated storage resources:

- aws_s3_bucket_name
- azure_storage_account_name
- gcp_storage_bucket_name

---

##  Security Best Practices

- Secret Isolation: Local variables and credentials are hardcoded only within terraform.tfvars, which is explicitly blocked via .gitignore to prevent source-control leaks.
- Access Control: All provisioned storage targets are configured private by default. Access permissions should be managed externally using native cloud IAM and RBAC tools.
- Least Privilege: Ensure your localized CLI profiles have only the necessary bucket/storage creation privileges required to execute this template.
