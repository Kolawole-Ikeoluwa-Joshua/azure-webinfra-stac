# Documentation (Provision Azure Web Infrastructure)

```
.
├── README.md                  # Deployment instructions and reference
├── backend.tf                 # Terraform Cloud backend configuration (optional)
├── main.tf                   # Main Terraform configuration referencing modules
├── modules
│   ├── key_vault              # Module for Azure Key Vault (optional)
│   │   ├── key_vault.tf        # Key Vault resource configuration
│   │   └── variables.tf       # Key Vault specific variables (optional)
│   ├── lb                      # Module for Azure Load Balancer (optional)
│   │   ├── lb.tf                # Load Balancer resource configuration
│   │   └── variables.tf       # Load Balancer specific variables (optional)
│   ├── app_gateway            # Module for Azure Application Gateway (optional)
│   │   ├── app_gateway.tf      # Application Gateway resource configuration
│   │   └── variables.tf       # Application Gateway specific variables (optional)
│   ├── backup                  # Module for Azure Backup (optional)
│   │   ├── backup.tf            # Backup schedule resources
│   │   └── variables.tf       # Backup specific variables (optional)
│   ├── security_center        # Module for Azure Security Center (optional)
│   │   ├── security_center.tf  # Security Center workspace configuration
│   │   └── variables.tf       # Security Center specific variables (optional)
│   ├── vnet                    # Module for Virtual Network and Subnets
│   │   ├── vnet.tf              # Virtual Network and Subnet resources
│   │   └── variables.tf       # Network configuration variables
│   ├── nsg                    # Module for Network Security Groups
│   │   ├── nsg.tf               # Network Security Group resources
│   │   └── variables.tf       # Network Security Group variables
│   ├── availability_set       # Module for Availability Set
│   │   ├── availability_set.tf  # Availability Set resource
│   │   └── variables.tf       # Availability Set variables
│   └── vm                      # Module for Virtual Machines
│       ├── db_vm.tf             # Database VM resource configuration
│       ├── vms.tf               # Web VM resource configuration
│       └── variables.tf       # VM configuration variables
├── providers.tf                # Azure provider configuration
├── variables.tf               # Global variables for deployment
└── outputs.tf                 # Outputs for deployed resources (optional)


```


## 1. Prerequisites

```
# set up backends.tf

# to access remote backend with API token:
terraform login

# initialize backend
terraform init


# update terraform cloud execution mode
local ==> plans and applies occur on machines you control. Terraform cloud is only used to store and sync state
```

## 2. Variables & Sensitive Variables

List all variables defined in variables.tf with descriptions and default values (if any).

Create a `terraform.tfvars` file to provide values for the variables. This file is where you define your sensitive data, which is not checked into version control.

```
admin_username  = ""
admin_password  = ""
subscription_id = ""
tenant_id       = ""
client_id       = ""
client_secret   = ""

```

## 3. Deployment Steps

- Clone this repository.

- Update variables.tf with your desired values.

- Initialize Terraform:

```
terraform login

terraform init
```

Review the planned changes:

```
terraform plan
```

Apply the configuration to Azure:

```
terraform apply

terraform apply -var-file="terraform.tfvars"
```

## 4. Additional Notes

This deployment creates a basic web application infrastructure.
Modify the code for specific needs (e.g., scaling web VMs).
Refer to Azure documentation for detailed configuration options of each resource.

## 5. References

https://developer.hashicorp.com/terraform/tutorials/azure-get-started
Remember to update variable names and resource configurations based on your specific implementation.
