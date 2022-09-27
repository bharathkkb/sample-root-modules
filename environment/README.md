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
│   ├── modules
│   │   └── base_env
│   │       ├── outputs.tf
│   │       ├── projects.tf
│   │       └── variables.tf
│   └── prod
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── network
│   ├── dev
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── modules
│   │   └── base_env
│   │       ├── networks.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   └── prod
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── org
    ├── backend.tf
    ├── log_sinks.tf
    ├── org_policy.tf
    ├── outputs.tf
    ├── projects.tf
    └── variables.tf
```