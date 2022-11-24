# -----------------------------------------------------------------------------
# open ssh private key for bastion host, stored in akv
# -----------------------------------------------------------------------------
resource "azurerm_key_vault_secret" "ssh_key_bastion" {
  key_vault_id = azurerm_key_vault_access_policy.owner.key_vault_id
  name         = "${var.resource_name_prefix}-vault-ssh-key-bastion"
  tags         = var.common_tags
  value        = var.bastion_ssh_private_key
}

# -----------------------------------------------------------------------------
# open ssh private key for vault nodes, stored in akv
# -----------------------------------------------------------------------------
resource "azurerm_key_vault_secret" "ssh_key_nodes" {
  key_vault_id = azurerm_key_vault_access_policy.owner.key_vault_id
  name         = "${var.resource_name_prefix}-vault-ssh-key-nodes"
  tags         = var.common_tags
  value        = var.vault_nodes_ssh_private_key
}

# -----------------------------------------------------------------------------
# open ssh public key for bastion host, stored in akv
# -----------------------------------------------------------------------------
resource "azurerm_key_vault_secret" "ssh_key_bastion_public" {
  key_vault_id = azurerm_key_vault_access_policy.owner.key_vault_id
  name         = "${var.resource_name_prefix}-vault-ssh-public-key-bastion"
  tags         = var.common_tags
  value        = var.bastion_ssh_public_key
}

# -----------------------------------------------------------------------------
# open ssh public key for vault nodes, stored in akv
# -----------------------------------------------------------------------------
resource "azurerm_key_vault_secret" "ssh_key_nodes_public" {
  key_vault_id = azurerm_key_vault_access_policy.owner.key_vault_id
  name         = "${var.resource_name_prefix}-vault-ssh-public-key-nodes"
  tags         = var.common_tags
  value        = var.vault_nodes_ssh_public_key
}
