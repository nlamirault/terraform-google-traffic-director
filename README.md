# terraform-google-traffic-director

Terraform module which configure Traffic Director on Google Cloud

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
