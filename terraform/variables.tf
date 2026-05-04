variable "proxmox_api_url" {
  type        = string
}

variable "proxmox_api_token_id" {
  type        = string
}

variable "proxmox_api_token_secret" {
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  type      = string
  sensitive = true
}

variable "mysql_root_password" {
  type      = string
  sensitive = true
}

variable "mysql_db_password" {
  type      = string
  sensitive = true
}
