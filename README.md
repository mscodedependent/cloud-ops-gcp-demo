# cloud-ops-gcp-demo
Terraform + GitHub Actions provisioning and deploying to Google Cloud — without a single long‑lived service‑account key.

# Zero-Key GCP Pipeline

Terraform + GitHub Actions provisioning and deploying to GCP — authenticated
entirely via Workload Identity Federation, with no service-account keys.

## Status
🚧 In progress — see project checklist.

## Architecture
(diagram coming in a later phase)

## Stack
Terraform · GitHub Actions · GCP (Cloud Run, Cloud SQL, VPC, Secret Manager)

## Environments
dev → staging → prod, promoted via GitHub Environments with required reviewers.