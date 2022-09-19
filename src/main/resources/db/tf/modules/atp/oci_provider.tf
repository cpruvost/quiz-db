# Variables.
variable "TENANCY_OCID"         { type = string }
variable "USER_OCID"            { type = string }
#variable "private_key_path"     { type = string }
variable "PRIVATE_KEY"          { type = string }
variable "FINGERPRINT"          { type = string }
variable "REGION"               { type = string }
#variable "root_compartment_id"  { type = string }


# Resources
provider "oci" {
  tenancy_ocid     = var.TENANCY_OCID
  user_ocid        = var.USER_OCID
  #private_key_path = var.private_key_path
  private_key      = var.PRIVATE_KEY
  fingerprint      = var.FINGERPRINT
  region           = var.REGION
}