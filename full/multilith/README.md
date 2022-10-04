# Multilith

Directory structure
```
.
├── envs
│   ├── backend.tf
│   ├── folders.tf
│   ├── iam.tf
│   ├── outputs.tf
│   ├── projects.tf
│   └── variables.tf
├── network
│   ├── backend.tf
│   └── network.tf
├── org
│   ├── backend.tf
│   ├── folders.tf
│   ├── iam.tf
│   ├── log_export.tf
│   ├── outputs.tf
│   ├── projects.tf
│   └── variables.tf
└── README.md
```

## Resources

### org root config
- Folders (Common, Team 1, Team 2, Team 3)
- IAM (Org)
- Log Export
- Projects (Logging project)

### envs root config
- Folders (Dev/Nonprod/Prod for each team)
- IAM (Dev/Nonprod/Prod folder IAM for each team)
- Projects (Monitoring Dev/Nonprod/Prod projects, VPC Dev/Nonprod/Prod projects)

### network root config
- Network (VPCs Dev/Nonprod/Prod and associated subnets, NAT etc)