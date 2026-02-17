output "cluster_nsg_id" {
  value       = module.security_nsg_k8s.nsg_id
  description = "OCID do Network Security Group destinado ao Control Plane (API Server) do OKE."
}

output "worker_nsg_id" {
  value       = module.security_nsg_workers.nsg_id
  description = "OCID do Network Security Group destinado aos Worker Nodes ."
}

output "cluster_nsg_name" {
  value       = var.nsg_name
  description = "Nome atribuído ao NSG do Cluster."
}

output "worker_nsg_name" {
  value       = var.nsg_workers
  description = "Nome atribuído ao NSG dos Workers."
}