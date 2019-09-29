# terraform-gcp-address
A repository to manage static IP addresses in GCP

### Steps
This repository assumes you are using terraform 0.12
```
# Set credentials
export GOOGLE_CREDENTIALS=$(cat /path-to-service-account.json)

# Write a addr.auto.tfvars file:
cat <<EOF>addr.auto.tfvars
gcp_project = "your-project-name"
address_count = 3
secondary_address_count = 1
EOF

# Run terraform
terraform plan
terraform apply
```