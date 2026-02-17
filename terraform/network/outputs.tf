output "vcn_id" {
  value       = module.network_vcn.vcn_id
  description = "OCID da VCN principal do JPN Labs."
}

output "public_subnet_id" {
  value       = module.subnet_public.subnet_id
  description = "OCID da Subnet Pública usada para Load Balancers e Endpoint do OKE."
}

output "private_subnet_id" {
  value       = module.subnet_private.subnet_id
  description = "OCID da Subnet Privada onde os Worker Nodes (Ampere) serão alocados."
}