# --- Cluster K8S  ---#
module "oke_control_plane" {
  source = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/compute/oke-cluster?ref=main"

  compartment_id        = var.compartment_id
  vcn_id                = data.terraform_remote_state.network.outputs.vcn_id
  cluster_name          = var.cluster_name
  kubernetes_version    = var.kubernetes_version
  endpoint_subnet_id    = data.terraform_remote_state.network.outputs.public_subnet_id
  service_lb_subnet_ids = [data.terraform_remote_state.network.outputs.public_subnet_id]
  cluster_nsg_ids       = [data.terraform_remote_state.security.outputs.cluster_nsg_id]
  is_public_endpoint    = var.is_public_endpoint

  tags = var.tags
}

# --- Node Pool  ---#
module "node_pool_ampere" {
  source = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/compute/oke-node-pool?ref=main"

  cluster_id          = module.oke_control_plane.cluster_id
  compartment_id      = var.compartment_id
  node_pool_name      = var.node_pool_name
  node_shape          = var.node_shape
  node_ocpus          = var.node_ocpus
  node_memory_gb      = var.node_memory_gb
  kubernetes_version  = var.kubernetes_version
  private_subnet_id   = data.terraform_remote_state.network.outputs.private_subnet_id
  availability_domain = var.availability_domain
  node_image_id       = var.node_image_id
  node_pool_size      = var.node_pool_size
  nsg_ids             = [data.terraform_remote_state.security.outputs.worker_nsg_id]

  tags = var.tags
}
