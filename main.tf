//--------------------------------------------------------------------
// Variables
variable "compute_admin_password" {}
variable "compute_admin_username" {}
variable "network_allow_ssh_traffic" {}
variable "network_location" {}
variable "network_resource_group_name" {}

//--------------------------------------------------------------------
// Modules
module "compute" {
  source  = "roger-ptfe.hashidemos.io/Solutions-Engineering/compute/azurerm"
  version = "1.1.1"

  admin_password = "${var.compute_admin_password}"
  admin_username = "${var.compute_admin_username}"
  location = "${module.network.vnet_location}"
  nb_instances = 1
  vnet_subnet_id = "${module.network.vnet_subnets[0]}"
}

module "network" {
  source  = "roger-ptfe.hashidemos.io/Solutions-Engineering/network/azurerm"
  version = "1.1.1"

  allow_ssh_traffic = "${var.network_allow_ssh_traffic}"
  location = "${var.network_location}"
  resource_group_name = "${var.network_resource_group_name}"
}
