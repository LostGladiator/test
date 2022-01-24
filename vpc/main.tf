module "vpc" {
	source  = "terraform-google-modules/network/google"
	version = "~> 4.0"

	project_id   = var.project
	network_name = var.name
	routing_mode = "GLOBAL"

	subnets = [
		{
			subnet_name   = "${var.name}subnet-01"
			subnet_ip     = var.subnetCidr
			subnet_region = var.region
		}
	]
}


