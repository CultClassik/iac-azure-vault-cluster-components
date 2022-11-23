# iac-azure-vault-cluster-components
* Mangages pre-requisite resources required by a HashiCorp Vault cluster and accompanying AGW configuration.
* Note that for environment we have "production" and "nonprod" clustersonly.

## Vault Cluster - order of operations
| Order | Repo Name | Description |
|---|---|---|
| 1. | ac-azure-network | Manages virtual networks and subnets | 
| 2. | iac-azure-vault-cluster-components | Manages ssh keys, identities, role assignments, key vault, etc | 
| 2. | iac-azure-vault-cluster | Manages VMSS for the Vault cluster | 
| 4. | iac-azure-vault-agw | Manages the Azure Application Gateway and multiple configurations | 

## Running locally
* Need some detail here on extracing values for backend and supplying ARM_CLIENT_SECRET (or better yet, using Azure AD creds)
```bash
export VAULT_ENV=nonprod

# ensure env file is up to date and source it
set -o allexport &&\
source variables/$VAULT_ENV.env &&\
set +o allexport

# login to az cli or supply the ARM_CLIENT_SECRET env var
export ARM_CLIENT_SECRET=xxx

terraform init

terraform plan -var-file=variables/$VAULT_ENV.tfvars

```
## TODO
* Update/add descriptions for all variables and outputs
