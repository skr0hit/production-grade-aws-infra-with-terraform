# Production-Grade AWS Infrastructure with Terraform

This repository contains the Infrastructure as Code (IaC) for a secure, scalable, and production-ready cloud platform on AWS. The project is designed to serve as a blueprint for real-world systems and to demonstrate senior-level DevOps competencies in cloud architecture, automation, and security.

The entire platform is defined using Terraform and is structured to support a multi-environment software delivery lifecycle (Dev, Staging, & Prod).

---

## 🏛️ Architecture Overview

The core of this platform is a highly available Amazon EKS cluster deployed within a custom-built, secure VPC. Each environment is completely isolated within its own VPC to ensure stability and prevent cross-environment interference. The infrastructure is designed with a security-first mindset, leveraging private subnets for workloads and tightly controlled network access.

*(A great addition here would be an architecture diagram image)*
`![Architecture Diagram](path/to/your/diagram.png)`

---

## ✨ Core Features

* **100% Infrastructure as Code:** The entire platform is defined declaratively using **Terraform**, ensuring consistency, reusability, and version control for all cloud resources.
* **Modular & Reusable Design:** The Terraform configuration is broken down into logical modules (`vpc`, `iam`, `eks`), allowing for clean separation of concerns and easy reuse.
* **Multi-Environment Isolation:** Deploys completely separate `dev`, `staging`, and `production` environments, each with its own isolated VPC and backend state file to prevent conflicts and ensure stability.
* **Production-Grade Networking:** Each VPC is engineered with **public and private subnets**. Workloads run securely in private subnets, while NAT Gateways provide controlled outbound internet access.
* **Scalable Container Orchestration:** A highly available **Amazon EKS cluster** serves as the core of the platform, configured to run across multiple Availability Zones for resilience.
* **Security by Design (DevSecOps):**
    * **Least Privilege:** Granular **IAM Roles** are defined for the EKS control plane and worker nodes.
    * **In-Cluster Firewall:** Kubernetes **Network Policies** are used to enforce a zero-trust network model, restricting pod-to-pod communication.
* **Professional Git Workflow:** The `main` branch is protected, requiring all changes to be made via **Pull Requests**. This enforces code reviews and prevents direct, un-audited changes to the infrastructure.

---

## 📁 Project Structure

The project uses a standard Terraform structure that separates reusable modules from environment-specific configurations.


.
├── environments/
│   ├── dev/            # Configuration for the Development environment
│   ├── staging/        # Configuration for the Staging environment
│   └── prod/           # Configuration for the Production environment
│
└── modules/
├── eks/            # Reusable module for the EKS Cluster
├── iam/            # Reusable module for IAM Roles
├── jenkins/        # Reusable module for Jenkins (Future Work)
└── vpc/            # Reusable module for the VPC and Networking


---

## 🚀 How to Deploy an Environment

### Prerequisites

* An AWS Account with appropriate permissions.
* [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed.
* AWS CLI configured with your credentials.

### Deployment Steps

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/skr0hit/production-grade-aws-infra-with-terraform.git](https://github.com/skr0hit/production-grade-aws-infra-with-terraform.git)
    cd production-grade-aws-infra-with-terraform
    ```

2.  **Navigate to an environment directory:**
    ```bash
    cd environments/dev
    ```

3.  **Initialize Terraform:**
    This will download the necessary providers and configure the S3 backend.
    ```bash
    terraform init
    ```

4.  **Review the execution plan:**
    This is a dry run that shows you what resources will be created.
    ```bash
    terraform plan
    ```

5.  **Apply the configuration:**
    This will build the infrastructure in your AWS account. Confirm the prompt by typing `yes`.
    ```bash
    terraform apply
    ```

---

