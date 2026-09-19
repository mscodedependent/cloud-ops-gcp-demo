#!/bin/bash

# Setup script for infra/environments/dev/terraform.tfvars
# This script creates the directory structure and initializes the terraform.tfvars file
# with a template for GCP dev environment variables

set -e

# Define paths (adjust PROJECT_ROOT if running from a different location)
PROJECT_ROOT="${1:-.}"
TFVARS_DIR="${PROJECT_ROOT}/infra/environments/dev"
TFVARS_FILE="${TFVARS_DIR}/terraform.tfvars"

echo "🚀 Setting up Terraform variables file..."
echo "Project root: ${PROJECT_ROOT}"
echo "Target: ${TFVARS_FILE}"
echo ""

# Create directory structure if it doesn't exist
if [ ! -d "${TFVARS_DIR}" ]; then
    echo "📁 Creating directory structure..."
    mkdir -p "${TFVARS_DIR}"
    echo "✓ Created ${TFVARS_DIR}"
else
    echo "✓ Directory ${TFVARS_DIR} already exists"
fi

# Create terraform.tfvars if it doesn't exist
if [ ! -f "${TFVARS_FILE}" ]; then
    echo "📝 Creating terraform.tfvars with template..."
    cat > "${TFVARS_FILE}" << 'EOF'
# Development environment Terraform variables
# WARNING: This file may contain sensitive data and should NEVER be committed to version control
# It's already covered by the *.tfvars / !*.tfvars.example .gitignore rule

# GCP Project Configuration
gcp_project_id = "your-gcp-project-id"
gcp_region     = "us-east4"

# Environment Name
environment = "dev"

# TODO: Add other required variables as you progress through the setup
# Examples:
# - vpc_name
# - subnet_name
# - service_account_email
# - etc.
EOF
    echo "✓ Created ${TFVARS_FILE}"
    echo ""
    echo "📋 Template created with placeholder values. You'll need to fill in:"
    echo "   - gcp_project_id: Your actual GCP project ID"
    echo "   - gcp_region: Your desired GCP region"
    echo "   - Other variables as needed for your infrastructure"
else
    echo "✓ File ${TFVARS_FILE} already exists"
    echo "⚠️  Not overwriting existing file"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Edit ${TFVARS_FILE} with your actual values"
echo "2. Run 'terraform plan' to validate your configuration"
echo "3. Make sure this file is in .gitignore (should already be)"
