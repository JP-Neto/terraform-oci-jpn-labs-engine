#--- Network Security Group K8S ---#
module "security_nsg_k8s" {
  source         = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/security/nsg?ref=main"
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  name           = var.nsg_name
  tags           = var.tags
}

#--- Rules Security Group K8S ---#
module "rules_nsg_k8s" {
  source                    = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/security/nsg-rules?ref=main"
  network_security_group_id = module.security_nsg_k8s.nsg_id
  ingress_rules             = jsondecode(file("${path.root}/../../config/nsg_rules.json")).ingress_rules
  egress_rules              = jsondecode(file("${path.root}/../../config/nsg_rules.json")).egress_rules
  tags                      = var.tags
}

#--- Network Security Group Workers ---#
module "security_nsg_workers" {
  source         = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/security/nsg?ref=main"
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  name           = var.nsg_workers
  tags           = var.tags
}

#--- Rules Security Group Workers ---#
module "rules_nsg_workers" {
  source                    = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/security/nsg-rules?ref=main"
  network_security_group_id = module.security_nsg_workers.nsg_id
  ingress_rules             = jsondecode(file("${path.root}/../../config/nsg_rules_workers.json")).ingress_rules
  egress_rules              = jsondecode(file("${path.root}/../../config/nsg_rules_workers.json")).egress_rules
  tags                      = var.tags
}


