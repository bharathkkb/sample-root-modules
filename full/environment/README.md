# Per-env root modules

Directory structure
```
.
├── envs
│   ├── dev
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── envs.sh
│   ├── modules
│   │   └── base_env
│   │       ├── folders.tf
│   │       ├── iam.tf
│   │       ├── outputs.tf
│   │       ├── projects.tf
│   │       └── variables.tf
│   ├── nonprod
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── prod
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── network
│   ├── dev
│   │   ├── backend.tf
│   │   └── main.tf
│   ├── envs.sh
│   ├── modules
│   │   └── base_env
│   │       ├── networks.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── nonprod
│   │   ├── backend.tf
│   │   └── main.tf
│   └── prod
│       ├── backend.tf
│       └── main.tf
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

### envs
#### envs dev root config
- Folders (Dev for each team)
- IAM (Dev folder IAM for each team)
- Projects (Monitoring Dev, VPC Dev projects)

#### envs nonprod prod config
- Folders (Nonprod for each team)
- IAM (Nonprod folder IAM for each team)
- Projects (Monitoring Nonprod, VPC Nonprod projects)

#### envs prod root config
- Folders (Prod for each team)
- IAM (Prod folder IAM for each team)
- Projects (Monitoring Prod, VPC Prod projects)

### network
#### network dev root config
- Network (VPCs Dev and associated subnets)

#### network nonprod root config
- Network (VPCs Nonprod and associated subnets, NAT)

#### network prod root config
- Network (VPCs Prod and associated subnets)