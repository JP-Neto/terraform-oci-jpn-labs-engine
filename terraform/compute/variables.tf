# --- Global ---
variable "compartment_id" {
  type        = string
  description = "OCID do compartment onde o cluster será criado"
}

variable "tags" {
  type        = map(string)
  description = "Tags globais para os recursos"
  default     = {}
}

# --- OKE Cluster (Control Plane) ---
variable "cluster_name" {
  type        = string
  description = "Nome do cluster OKE"
}

variable "kubernetes_version" {
  type        = string
  description = "Versão do Kubernetes para o cluster"
}

variable "is_public_endpoint" {
  type        = bool
  description = "Endpoint do Kubernetes para o cluster"
}


# --- Node Pool  ---#
variable "availability_domain" {
  type        = string
  description = "O AD onde os recursos serão criados (ex: Uocm:sa-vinhedo-1-AD-1)."
}

variable "node_image_id" {
  type        = string
  description = "OCID da imagem do worker node. Use a imagem específica para OKE e arquitetura ARM."
}

variable "node_pool_size" {
  type        = number
  description = "Quantidade de worker nodes. Para o Always Free Ampere, o limite total é 4 OCPUs no tenant."
}

variable "node_pool_name" {
  type        = string
  description = "Nome de exibição do Node Pool."
}

variable "node_shape" {
  type        = string
  description = "Shape ARM Ampere compatível com o nível gratuito (Always Free)."
}

variable "node_ocpus" {
  type        = number
  description = "Quantidade de OCPUs. O limite gratuito é 4."
}

variable "node_memory_gb" {
  type        = number
  description = "Quantidade de memória em GB. O limite gratuito é 24GB para o shape A1."
}