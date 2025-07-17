# Terraform Multi-Client Infrastructure Project

This repository follows a modular and scalable Terraform structure for managing infrastructure across multiple clients and environments, following all best practices.

---

## 🔧 Project Structure

```
terraform/
└── clients/
    └── client-a/
        ├── dev/
        │   ├── networking/
        │   ├── security/
        │   ├── compute/
        │   ├── loadbalancing/
        │   ├── data/
        │   └── dns/
        ├── staging/
        │   └── ...
        └── prod/
            └── ...
```

---

## 🧱 Layer Definitions

| Layer          | Purpose |
|----------------|---------|
| `networking/`     | VPC, Subnets, NAT Gateway, Internet Gateway, Peering |
| `security/`       | Security Groups, IAM Roles, Secrets Manager, KMS |
| `compute/`        | EKS, Auto Scaling Groups, ECR, EC2 Launch Templates |
| `loadbalancing/`  | ALB, Target Groups, Ingress Controller |
| `data/`           | RDS, S3, Backup Vaults |
| `dns/`            | Route53 Zones and Records |

> 🔄 The `platform/` layer has been renamed to `compute/` for clarity.

---

## 🔗 Dependency Graph

```
networking
├──→ security
│    └──→ compute
│          └──→ loadbalancing
├──→ data
loadbalancing
└──→ dns
```

- Each layer uses `terraform_remote_state` to fetch outputs from dependent layers.
- State is separated per component, per environment, and per client.

---

## 🌍 Region Handling

Each layer includes a `region.tf` file with the provider and region configuration.

---

## 📦 Backend Configuration

Each layer includes a `backend.tf` file configured to store state in Azure Blob Storage under a unique path:

```
key = "<client>/<environment>/<layer>/terraform.tfstate"
```

---

## 🚀 CI/CD (GitHub Actions)

A GitHub Actions workflow is used to:
- Detect which layer was changed
- Enforce the dependency graph
- Run `terraform init`, `plan`, and `apply` only on the necessary layers

See `.github/workflows/terraform.yaml` for details.