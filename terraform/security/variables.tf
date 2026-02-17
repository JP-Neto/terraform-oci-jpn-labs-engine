variable "compartment_id" {
  type        = string
  description = "OCID do compartimento onde o NSG será criado"
}

variable "vcn_id" {
  type        = string
  description = "OCID da VCN alvo"
}

variable "nsg_name" {
  type        = string
  description = "Nome de exibição do NSG"
}

variable "nsg_workers" {
  type        = string
  description = "Nome de exibição do NSG Worker"
}

variable "ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}