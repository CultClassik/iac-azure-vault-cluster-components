<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >=1.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 3.1.50 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.32.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.50 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tls_cert_request.server](https://registry.terraform.io/providers/troyready/tls/3.1.50/docs/resources/cert_request) | resource |
| [tls_locally_signed_cert.server](https://registry.terraform.io/providers/troyready/tls/3.1.50/docs/resources/locally_signed_cert) | resource |
| [tls_private_key.ca](https://registry.terraform.io/providers/troyready/tls/3.1.50/docs/resources/private_key) | resource |
| [tls_private_key.server](https://registry.terraform.io/providers/troyready/tls/3.1.50/docs/resources/private_key) | resource |
| [tls_self_signed_cert.ca](https://registry.terraform.io/providers/troyready/tls/3.1.50/docs/resources/self_signed_cert) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | (Optional) Map of common tags for all taggable resources | `map(string)` | `{}` | no |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | The full DNS zone name to use when creating TLS certificates | `any` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Azure resource group in which resources will be deployed | <pre>object({<br>    name     = string<br>    location = string<br>  })</pre> | n/a | yes |
| <a name="input_resource_name_prefix"></a> [resource\_name\_prefix](#input\_resource\_name\_prefix) | Prefix applied to resource names | `string` | n/a | yes |
| <a name="input_vault_cluster_host_name"></a> [vault\_cluster\_host\_name](#input\_vault\_cluster\_host\_name) | The host name for the Vault cluster. Will be pre-pended to dns\_zone\_name. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_root_ca_pem"></a> [root\_ca\_pem](#output\_root\_ca\_pem) | n/a |
| <a name="output_root_ca_pfx"></a> [root\_ca\_pfx](#output\_root\_ca\_pfx) | n/a |
| <a name="output_shared_san"></a> [shared\_san](#output\_shared\_san) | n/a |
| <a name="output_vault_server_cert_pfx"></a> [vault\_server\_cert\_pfx](#output\_vault\_server\_cert\_pfx) | n/a |
<!-- END_TF_DOCS -->