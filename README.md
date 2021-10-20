# terraform-gcp-gke

Terraform module which configure a Kubernetes cluster on Google Cloud

## Usage

```hcl

module "kubernetes" {

  project  = var.project
  location = var.location

  network        = var.network
  subnet_network = var.subnet_network

  name                       = var.name
  release_channel            = var.release_channel
  network_config             = var.network_config
  master_ipv4_cidr_block     = var.master_ipv4_cidr_block
  master_authorized_networks = var.master_authorized_networks

  maintenance_start_time = var.maintenance_start_time

  auto_scaling_max_cpu = var.auto_scaling_max_cpu
  auto_scaling_min_cpu = var.auto_scaling_min_cpu
  auto_scaling_max_mem = var.auto_scaling_max_mem
  auto_scaling_min_mem = var.auto_scaling_min_mem

  default_max_pods_per_node = var.default_max_pods_per_node
  max_pods_per_node         = var.max_pods_per_node

  labels = var.labels

  network_policy             = var.network_policy
  auto_scaling               = var.auto_scaling
  hpa                        = var.hpa
  pod_security_policy        = var.pod_security_policy
  monitoring_service         = var.monitoring_service
  logging_service            = var.logging_service
  binary_authorization       = var.binary_authorization
  google_cloud_load_balancer = var.google_cloud_load_balancer
  istio                      = var.istio
  cloudrun                   = var.cloudrun
  csi_driver                 = var.csi_driver

  node_pool_name          = var.node_pool_name
  default_service_account = var.default_service_account
  node_count              = var.node_count
  max_node_count          = var.max_node_count
  min_node_count          = var.min_node_count
  machine_type            = var.machine_type
  disk_size_gb            = var.disk_size_gb
  auto_upgrade            = var.auto_upgrade
  auto_repair             = var.auto_repair
  image_type              = var.image_type
  preemptible             = var.preemptible
  node_labels             = var.node_labels
  node_tags               = var.node_tags

  node_pools = var.node_pools
}
```

With variables :

```hcl
project = "foo"

location = "europe-west1"

#####################################################################""
# Kubernetes cluster

name = "mykube"

network        = "customer-prodnet"
subnet_network = "customer-prodsubnet-europe-west1"

release_channel = "REGULAR"

network_config = {
  enable_natgw   = true
  enable_ssh     = false
  private_master = false
  private_nodes  = true
  pods_cidr      = "customer-prodsubnet-gke-pods-europe-west1"
  services_cidr  = "customer-prodsubnet-gke-services-europe-west1"
}

master_authorized_networks = [
  {
    cidr_block   = "0.0.0.0/0"
    display_name = "internet"
  }
]

labels = {
  env      = "prod"
  service  = "kubernetes"
  made_by  = "terraform"
}

network_policy             = false
auto_scaling               = true
hpa                        = true
pod_security_policy        = false
monitoring_service         = true
logging_service            = true
binary_authorization       = false
google_cloud_load_balancer = true
istio                      = false
cloudrun                   = false
csi_driver                 = true

maintenance_start_time = "01:00"

default_max_pods_per_node = 110
max_pods_per_node = 110

#####################################################################""
# Kubernetes node pool

default_service_account = false

node_pool_name = "core"

node_count     = 1
min_node_count = 1
max_node_count = 2

machine_type = "n1-standard-4"
disk_size_gb = 100

auto_upgrade = true
auto_repair  = true

preemptible = false

node_labels = {
  env      = "prod"
  service  = "kubernetes"
  made_by  = "terraform"
}

node_tags = ["kubernetes", "nodes", "nat-europe-west1"]

```

## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| google | 3.89.0 |
| google-beta | 3.89.0 |

## Providers

| Name | Version |
|------|---------|
| google | 3.89.0 |
| google-beta | 3.89.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [google-beta_google_compute_backend_service](https://registry.terraform.io/providers/hashicorp/google-beta/3.89.0/docs/resources/google_compute_backend_service) |
| [google-beta_google_compute_firewall](https://registry.terraform.io/providers/hashicorp/google-beta/3.89.0/docs/resources/google_compute_firewall) |
| [google-beta_google_compute_health_check](https://registry.terraform.io/providers/hashicorp/google-beta/3.89.0/docs/resources/google_compute_health_check) |
| [google-beta_google_compute_url_map](https://registry.terraform.io/providers/hashicorp/google-beta/3.89.0/docs/resources/google_compute_url_map) |
| [google_compute_network](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/data-sources/compute_network) |
| [google_compute_network_endpoint_group](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/data-sources/compute_network_endpoint_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| gke\_service\_name | The Kubernetes service name | `string` | n/a | yes |
| hc\_check\_interval\_sec | How often (in seconds) to send a health check | `number` | `5` | no |
| hc\_log\_config | Configure logging on this health check | `bool` | `false` | no |
| hc\_timeout\_sec | How long (in seconds) to wait before claiming failure | `number` | `5` | no |
| neg\_name | Network Endpoint Group name | `string` | n/a | yes |
| neg\_zone | Network Endpoint Group zone | `string` | n/a | yes |
| network\_name | Name of the VPC | `string` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
