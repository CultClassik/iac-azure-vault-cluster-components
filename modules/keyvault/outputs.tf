output "key_vault_id" {
  description = "Key Vault ID"
  value       = azurerm_key_vault.akv.id
}

output "akv_secret_id_vault_server_cert" {
  description = "Secret ID of AKV Certificate for Vault nodes"
  value       = azurerm_key_vault_certificate.vault_server.versionless_id
}

output "akv_secret_id_vault_vm_tls" {
  description = "Secret ID of AKV secret for Vault Cluster nodes TLS certificate"
  value       = azurerm_key_vault_secret.vault.versionless_id
}

output "keyvault_name" {
  description = "Name of the keyvault - autogenerated if one is not specified."
  value       = azurerm_key_vault.akv.name
}
output "akv_secret_id_root_ca_pem" {
  description = "Secret ID of AKV secret for private root CA certificate"
  value       = azurerm_key_vault_secret.root_ca_pem.versionless_id
}

