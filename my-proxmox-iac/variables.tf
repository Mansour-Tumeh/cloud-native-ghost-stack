variable "proxmox_api_url" {
  description = "The full URL for the Proxmox API (e.g. https://1.2.3.4:8006/api2/json)"
  type        = string
}

variable "proxmox_api_token_id" {
  description = "The Token ID (e.g. terraform-prov@pve!tokenid)"
  type        = string
}

variable "proxmox_api_token_secret" {
  description = "The Token Secret UUID"
  type        = string
  sensitive   = true
}

variable "proxmox_node" {
  type    = string
  default = "sd-177083"
}

variable "proxmox_datastore" {
  type    = string
  default = "vmdata"
}

variable "vm_count" {
  type    = number
  default = 3
}

variable "template_vm_id" {
  type    = number
  default = 8000
}

variable "vm_cpu_cores" {
  type    = number
  default = 2
}

variable "vm_memory" {
  type    = number
  default = 4096
}

variable "vm_user" {
  type    = string
  default = "ubuntu"
}

variable "ssh_public_key" {
  type      = string
  sensitive = true
}