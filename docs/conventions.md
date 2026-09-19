# Naming & Labeling Conventions

- Resource names: `{project}-{env}-{resource}` — e.g. `zkgp-dev-vpc`, `zkgp-prod-sql`
- Labels on every resource: `environment = "<env>"`, `managed_by = "terraform"`, `project = "zkgp"`
- Region: us-east4 (Virginia) across all environments

# docs/wif-config.md

| Environment | WIF Provider | Service Account |
|---|---|---|
| dev | projects/123.../providers/github-provider | tf-runner@zkgp-dev.iam.gserviceaccount.com |
| staging | projects/456.../providers/github-provider | tf-runner@zkgp-staging.iam.gserviceaccount.com |
| prod | projects/789.../providers/github-provider | tf-runner@zkgp-prod.iam.gserviceaccount.com |