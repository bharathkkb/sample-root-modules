# Monolith

## Directory structure
```
.
├── backend.tf
├── folders.tf
├── iam.tf
├── log-export.tf
├── network.tf
├── projects.tf
├── README.md
├── terraform.tfstate
├── variables.tf
└── versions.tf
```

## Resources

- Folders (Common, Team 1, Team 2, Team 3, Dev/Nonprod/Prod for each team)
- IAM (Org, Dev/Nonprod/Prod folder IAM for each team)
- Log Export
- Projects (Logging project, Monitoring Dev/Nonprod/Prod projects, VPC Dev/Nonprod/Prod projects)
- Network (VPCs Dev/Nonprod/Prod and associated subnets, NAT etc)