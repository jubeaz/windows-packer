# https://www.packer.io/docs/templates/hcl_templates/variables#type-constraints for more info.
# #################
# DISK INFO
# #################
# #################
variable "template_name" {
  type    = string
  default = "win2k19"
}

variable "winrm_password" {
  type      = string
  default   = "packer"
  sensitive = true
}

variable "winrm_username" {
  type      = string
  default   = "Administrator"
  sensitive = true
}

variable "locale" {
  type      = string
  sensitive = false
  default   = "en_US"
}
# #################
#  VM VARS
# #################

variable "cpu" {
  type    = string
  default = "4"
}

variable "ram" {
  type    = string
  default = "4096"
}

variable "disk_size" {
  type    = string
  default = "40960"
}

# #################
#  BUILD VARS
# #################

variable "headless" {
  type    = string
  default = "false"
}
variable "shutdown_command" {
  type    = string
  default = "shutdown /s /t 5 /f /d p:4:1 /c \"Packer Shutdown\""
}

variable "winrm_insecure" {
  type    = bool
  default = true
}
variable "winrm_use_ssl" {
  type    = bool
  default = true
}
variable "winrm_timeout" {
  type    = string
  default = "1h"
}

variable "shutdown_timeout" {
   type = string
   default = "30m"
}

variable "skip_compaction" {
    type = bool
    default = false
}

variable "qemu_out_dir" {
  type    = string
}
# The "legacy_isotime" function has been provided for backwards compatability, but we recommend switching to the timestamp and formatdate functions.

# All locals variables are generated from variables that uses expressions
# that are not allowed in HCL2 variables.
# Read the documentation for locals blocks here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/locals
locals {
  iso_checksum = "3022424f777b66a698047ba1c37812026b9714c5"
  iso_url      = "https://software-download.microsoft.com/download/pr/17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso"
  vm_name      = "${var.template_name}-win2k19"
}



