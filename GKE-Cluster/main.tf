module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster"
  project_id                 = var.project
  name                       = var.name
  region                     = var.region
  zones                      = []
  network                    = var.network_name
  subnetwork                 = var.subnet_name
  ip_range_pods              = "${var.name}-kubernetes-pods"
  ip_range_services          = "${var.name}-kubernetes-svc"
  http_load_balancing        = false
  horizontal_pod_autoscaling = false
  network_policy             = false
  enable_private_endpoint    = false
  enable_private_nodes       = true
  master_ipv4_cidr_block     = "172.16.0.0/28"
  istio = true
  cloudrun = true
  dns_cache = false
  remove_default_node_pool   = true

  node_pools = [
    {
      name                      = "node-pool-test-1"
      machine_type              = var.node_type
      node_locations            = var.region
      min_count                 = var.min_node_count
      max_count                 = var.max_node_count
      disk_size_gb              = 100
      disk_type                 = "pd-standard"
      image_type                = "cos_containerd"
      auto_repair               = true
      auto_upgrade              = true
      preemptible               = false

    },
  ]

}

