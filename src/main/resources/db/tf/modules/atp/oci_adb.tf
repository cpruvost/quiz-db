# Variables
variable "COMPARTMENT_OCID" { type = string }
variable "DB_NAME"        { type = string }
variable "ADMIN_PASSWORD" { type = string }
variable "DB_VERSION"     { type = string }
# OLTP, DW, AJD, APEX
variable "DB_WORKLOAD"    { type = string }
# Must be false for AJD and APEX
variable "IS_FREE_TIER"   { 
  type = string
  default =  "false"
}
# BRING_YOUR_OWN_LICENSE or LICENSE_INCLUDED
variable "LICENCE_MODEL"  { 
  type = string 
  default =  "BRING_YOUR_OWN_LICENSE"
}
variable "IS_MTLS"  { 
  type = string 
  default =  "false"
}
variable "WHITELISTED_IPS"  { 
  type = list(string) 
  default =  ["0.0.0.0/0"]
}


variable "CPU_CORE_COUNT" {
  type    = number
  default = 1
}

variable "DATA_STORAGE_SIZE_IN_TBS" {
  type    = number
  default = 1
}


# Resources
resource "oci_database_autonomous_database" "tf_adb" {
  compartment_id              = var.COMPARTMENT_OCID
  cpu_core_count              = var.CPU_CORE_COUNT
  data_storage_size_in_tbs    = var.DATA_STORAGE_SIZE_IN_TBS
  db_name                     = var.DB_NAME
  admin_password              = var.ADMIN_PASSWORD
  db_version                  = var.DB_VERSION
  db_workload                 = var.DB_WORKLOAD
  display_name                = var.DB_NAME
  is_free_tier                = var.IS_FREE_TIER
  license_model               = var.LICENCE_MODEL
  is_mtls_connection_required = var.IS_MTLS 
  #is_access_control_enabled   = false
  is_auto_scaling_enabled     = true
  is_auto_scaling_for_storage_enabled = true
  whitelisted_ips             = var.WHITELISTED_IPS
}


# Outputs
output "db_name" {
  value = oci_database_autonomous_database.tf_adb.display_name
}

output "db_state" {
  value = oci_database_autonomous_database.tf_adb.state
}
