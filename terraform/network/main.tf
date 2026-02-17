#--- Virtual Cloud Network ---#
module "network_vcn" {
  source = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/network/vcn?ref=main"

  compartment_id = var.compartment_id
  vcn_name       = var.vcn_name
  vcn_cidr       = var.vcn_cidr
  dns_label      = var.dns_label

  tags = var.tags
}

#--- Internet Gateway ---#
module "internet_gateway" {
  source = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/network/int-gateway?ref=main"

  compartment_id = var.compartment_id
  vcn_id         = module.network_vcn.vcn_id
  display_name   = var.igw_display_name

  tags = var.tags
}

#--- NAT Gateway ---#
module "nat_gateway" {
  source = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/network/nat-gateway?ref=main"

  compartment_id = var.compartment_id
  vcn_id         = module.network_vcn.vcn_id
  display_name   = var.nat_display_name

  tags = var.tags
}

#--- Service Gateway ---#
module "service_gateway" {
  source = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/network/svc-gateway?ref=main"

  compartment_id = var.compartment_id
  vcn_id         = module.network_vcn.vcn_id
  display_name   = var.sgw_display_name

  tags = var.tags
}

#--- Route Table Public ---#
module "public_route_table" {
  source = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/network/route-table?ref=main"

  compartment_id = var.compartment_id
  vcn_id         = module.network_vcn.vcn_id
  display_name   = var.name_rt_public
  route_rules    = jsondecode(file("${path.root}/../../config/route_rules_public.json")).public_rules

  tags = var.tags
}

#--- Route Table Private ---#
module "private_route_table" {
  source = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/network/route-table?ref=main"

  compartment_id = var.compartment_id
  vcn_id         = module.network_vcn.vcn_id
  display_name   = var.name_rt_private
  route_rules    = jsondecode(file("${path.root}/../../config/route_rules_private.json")).private_rules

  tags = var.tags
}


#--- Subnet Public ---#
module "subnet_public" {
  source = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/network/subnet?ref=main"

  compartment_id = var.compartment_id
  vcn_id         = module.network_vcn.vcn_id
  display_name   = var.subnet_public_display_name
  cidr_block     = var.subnet_public_cidr_block
  dns_label      = var.subnet_public_dns_label

  route_table_id    = module.public_route_table.route_table_id
  security_list_ids = [module.network_vcn.default_security_list_id]

  is_private = var.subnet_public_is_private
  tags       = var.tags
}



#--- Subnet Private ---#
module "subnet_private" {
  source = "git::https://github.com/JP-Neto/Terraform-Multi-Cloud-Modules.git//modules/oci/network/subnet?ref=main"

  compartment_id = var.compartment_id
  vcn_id         = module.network_vcn.vcn_id
  display_name   = var.subnet_private_display_name
  cidr_block     = var.subnet_private_cidr_block
  dns_label      = var.subnet_private_dns_label

  route_table_id    = module.private_route_table.route_table_id
  security_list_ids = [module.network_vcn.default_security_list_id]

  is_private = var.subnet_private_is_private
  tags       = var.tags
}