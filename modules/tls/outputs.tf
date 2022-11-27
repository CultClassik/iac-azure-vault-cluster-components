output "root_ca_pem" {
  value = tls_self_signed_cert.ca.cert_pem
}

output "root_ca_pfx" {
  value = tls_self_signed_cert.ca.cert_pfx
}

output "shared_san" {
  value = tls_cert_request.server.dns_names[0]
}

output "vault_server_cert_pfx" {
  value = tls_locally_signed_cert.server.cert_pfx
}
