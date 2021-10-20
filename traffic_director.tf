# Copyright (C) 2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource "google_compute_health_check" "this" {
  provider = google-beta

  name        = local.service_name
  description = "Health check for GKE service with Traffic Director"

  http_health_check {
    port_specification = "USE_SERVING_PORT"
  }

  timeout_sec        = var.hc_timeout_sec
  check_interval_sec = var.hc_check_interval_sec

  log_config {
    enable = var.hc_log_config
  }
}

resource "google_compute_backend_service" "this" {
  provider = google-beta

  name        = local.service_name
  description = "Backend service for GKE service with Traffic Director"

  health_checks = [
    google_compute_health_check.this.id
  ]
  load_balancing_scheme = "INTERNAL_SELF_MANAGED"

  backend {
    group                 = data.google_compute_network_endpoint_group.this.id
    balancing_mode        = "RATE"
    max_rate_per_endpoint = 5
  }
}

resource "google_compute_url_map" "this" {
  provider = google-beta

  name        = local.service_name
  description = "URL map for GKE service with Traffic Director"

  default_service = google_compute_backend_service.this.id

  host_rule {
    hosts = [
      var.gke_service_name
    ]
    path_matcher = "gke"
  }
  path_matcher {
    name            = "gke"
    default_service = google_compute_backend_service.this.id

    path_rule {
      service = google_compute_backend_service.this.id
      paths = [
        "/"
      ]
    }
  }
}
