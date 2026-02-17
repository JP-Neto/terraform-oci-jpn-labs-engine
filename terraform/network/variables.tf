variable "compartment_id" {
  type        = string
  description = "OCID único do compartimento JPN Labs onde toda a stack será criada."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags globais para identificação de recursos da JPN Cloud Solutions."
}

# --- Networking VCN ---
variable "vcn_name" {
  type        = string
  description = "Nome de exibição da Virtual Cloud Network."
}

variable "vcn_cidr" {
  type        = string
  description = "Bloco CIDR IPv4 para a VCN."
}

variable "dns_label" {
  type        = string
  description = "Label DNS para a VCN, utilizado para resoluções de nomes internos."
}

# --- Gateways ---
variable "igw_display_name" {
  type        = string
  description = "Nome de exibição do Internet Gateway."
}

variable "nat_display_name" {
  type        = string
  description = "Nome de exibição do NAT Gateway."
}

variable "sgw_display_name" {
  type        = string
  description = "Nome de exibição do Service Gateway."
}


#--- Route Table ---#
variable "name_rt_public" {
  type        = string
  description = "Nome de exibição do Route Table Public."
}
variable "name_rt_private" {
  type        = string
  description = "Nome de exibição do Route Table Private."
}

#--- Subnet Public ---#
variable "subnet_public_display_name" {
  description = "Nome da subnet pública"
  type        = string
}

variable "subnet_public_cidr_block" {
  description = "CIDR da subnet pública"
  type        = string
}

variable "subnet_public_dns_label" {
  description = "DNS label da subnet pública"
  type        = string
}

variable "subnet_public_is_private" {
  description = "Define se a subnet é privada"
  type        = bool
}

#--- Subnet Privada ---#

variable "subnet_private_display_name" {
  description = "Nome da subnet privada"
  type        = string
}

variable "subnet_private_cidr_block" {
  description = "CIDR da subnet privada"
  type        = string
}

variable "subnet_private_dns_label" {
  description = "DNS label da subnet privada"
  type        = string
}

variable "subnet_private_is_private" {
  description = "Define se a subnet é privada"
  type        = bool
}

