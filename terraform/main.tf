# --- Root Infrastructure Orchestrator ---

module "proxmox_vms" {
  source = "../my-proxmox-iac"
  
  proxmox_api_url          = var.proxmox_api_url
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
  ssh_public_key           = var.ssh_public_key
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}


resource "kubernetes_namespace" "ghost_stack" {
  metadata {
    name = "ghost-prod"
  }
}


resource "kubernetes_secret" "mysql_credentials" {
  metadata {
    name      = "mysql-auth"
    namespace = kubernetes_namespace.ghost_stack.metadata[0].name
  }

  data = {
    root_password = var.mysql_root_password
    db_password   = var.mysql_db_password
  }
  type = "Opaque"
}

output "cluster_namespace" {
  value = kubernetes_namespace.ghost_stack.metadata[0].name
}