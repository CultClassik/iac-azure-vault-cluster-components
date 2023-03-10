# iac-azure-vault-cluster-components
* Mangages pre-requisite resources required by a HashiCorp Vault cluster and accompanying AGW configuration.
* Note that for environment we have "production" and "nonprod" clustersonly.

## Vault Cluster - order of operations
| Order | Repo Name | Description |
|---|---|---|
| 1. | ac-azure-network | Manages virtual networks and subnets |
| 2. | iac-azure-vault-cluster-components | Manages ssh keys, identities, role assignments, key vault, etc |
| 3. | iac-azure-vault-agw | Manages the Azure Application Gateway and multiple configurations |
| 4. | iac-azure-vault-cluster | Manages VMSS for the Vault cluster |
| ? | iac-azure-dns | ? | ? |

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
* Add managed & encrypted storage for keyvault
* Internal tls certs good for 1 year - this needs to be monitored and automated i.e. scheduled pipeline run to update the certs or use letsencrypt etc
* migrate tfstate - use updated method/storage account

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.31 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.32.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.50 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/iam | n/a |
| <a name="module_keyvault"></a> [keyvault](#module\_keyvault) | ./modules/keyvault | n/a |
| <a name="module_tls"></a> [tls](#module\_tls) | ./modules/tls | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [tls_private_key.bastion](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_private_key.vault_nodes](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_sub_id"></a> [az\_sub\_id](#input\_az\_sub\_id) | Azure subscription ID to create resources in | `string` | n/a | yes |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | The DNS zone name the Vault cluster will use | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | production or nonprod | `string` | n/a | yes |
| <a name="input_git_repo"></a> [git\_repo](#input\_git\_repo) | The name of the IAC repo that manages these resources | `string` | n/a | yes |
| <a name="input_keyvault_readers"></a> [keyvault\_readers](#input\_keyvault\_readers) | Map of objects IDs to grant read access on certificates and secrets for.<br>Ex:<br>{ devops = "8f2fccad-59de-4699-8e72-33adea4bcc8b" } | `map(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_akv_secret_id_root_ca_pem"></a> [akv\_secret\_id\_root\_ca\_pem](#output\_akv\_secret\_id\_root\_ca\_pem) | Secret ID of AKV secret for private root CA certificate |
| <a name="output_akv_secret_id_vault_server_cert"></a> [akv\_secret\_id\_vault\_server\_cert](#output\_akv\_secret\_id\_vault\_server\_cert) | Secret ID of AKV Certificate for Vault nodes |
| <a name="output_akv_secret_id_vault_vm_tls"></a> [akv\_secret\_id\_vault\_vm\_tls](#output\_akv\_secret\_id\_vault\_vm\_tls) | Secret ID of AKV secret for Vault Cluster nodes TLS certificate |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | Key Vault ID |
| <a name="output_keyvault_name"></a> [keyvault\_name](#output\_keyvault\_name) | Name of the keyvault - autogenerated if one is not specified. |
| <a name="output_lb_identity_id"></a> [lb\_identity\_id](#output\_lb\_identity\_id) | n/a |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | The resource group that was created for Vault cluster resources |
| <a name="output_root_ca_pem"></a> [root\_ca\_pem](#output\_root\_ca\_pem) | n/a |
| <a name="output_shared_san"></a> [shared\_san](#output\_shared\_san) | n/a |
| <a name="output_vault_server_cert_pfx"></a> [vault\_server\_cert\_pfx](#output\_vault\_server\_cert\_pfx) | n/a |
| <a name="output_vm_identity_client_id"></a> [vm\_identity\_client\_id](#output\_vm\_identity\_client\_id) | n/a |
| <a name="output_vm_identity_id"></a> [vm\_identity\_id](#output\_vm\_identity\_id) | n/a |
<!-- END_TF_DOCS -->
