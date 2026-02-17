terraform {
  required_version = ">= 1.14.5"

  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "~> 5.0"
    }
  }
}

provider "oci" {
  region = "sa-vinhedo-1"
}