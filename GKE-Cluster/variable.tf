variable "project" {
  type        = string
  description = "project_id to use for all resources"
}

variable "name" {
  type        = string
  description = "name to use for all resources"
}

variable "region" {
  type        = string
  description = "Region to use for all resources"
}

variable "network_name" {
  type        = string
  description = "name of VPC to deploy the kubernetescluster to"
}

variable "subnet_name" {
  type = string
  description = "the name of the subnet to deploy the kubernetes cluster to"
}


variable "node_type" {
  type = string
  description = "node type"
  default = "e2-standard-4" // 4 CPUs 16GB RAM
}
variable "min_node_count" {
  type = number
  description = "minimum of nodes"
  default = 1
}

variable "max_node_count" {
  type = number
  description = "maximum of nodes"
  default = 2
}




