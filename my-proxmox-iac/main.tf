terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.46.1"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_api_url
  username = var.proxmox_api_token_id
  password = var.proxmox_api_token_secret
  insecure = true
}

resource "proxmox_virtual_environment_vm" "k3s_cluster" {
  count     = var.vm_count
  name      = "k3s-node-${count.index + 1}"
  node_name = var.proxmox_node

  clone {
    vm_id = var.template_vm_id
    full  = true
  }

  agent {
    enabled = true
  }

  cpu {
    cores = var.vm_cpu_cores
  }

  memory {
    dedicated = var.vm_memory
  }

  network_device {
    bridge = "vmbr0"
  }

  initialization {
    datastore_id = var.proxmox_datastore
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
    user_account {
      username = var.vm_user
      keys     = [var.ssh_public_key]
    }
  }
}