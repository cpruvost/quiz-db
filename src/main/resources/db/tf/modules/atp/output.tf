data "oci_database_autonomous_databases" "autonomous_databases" {
  #Required
  compartment_id = "${var.COMPARTMENT_OCID}"

  #Optional
  display_name = "${oci_database_autonomous_database.tf_adb.display_name}"
  #db_workload  = "${var.autonomous_database_db_workload}"
  
}

output "autonomous_database_high_connection_string" {
  #value = "${lookup(oci_database_autonomous_database.tf_adb.connection_strings.0.all_connection_strings, "high", "unavailable")}"
  value = "${data.oci_database_autonomous_databases.autonomous_databases.autonomous_databases.connection_strings.0.high}"
}

output "autonomous_databases" {
  value = "${data.oci_database_autonomous_databases.autonomous_databases.autonomous_databases}"
}