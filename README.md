# Documentation (Provision Azure Web Infrastructure)

```
.
├── .gitignore
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── backend.tf
├── providers.tf
├── vnet
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── nsg
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── vms
│   ├── main.tf
│   ├── network_interfaces.tf
│   ├── variables.tf
│   ├── outputs.tf
├── load_balancer
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── app_gateway
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── sql_database
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── key_vault
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── backup
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── security_center
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf


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
