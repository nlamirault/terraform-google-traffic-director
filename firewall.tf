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

resource "google_compute_firewall" "this" {
  provider = google-beta

  name        = local.service_name
  description = "Allow health checker IP address ranges"

  network   = data.google_compute_network.this.name
  direction = "INGRESS"

  source_ranges = [
    "35.191.0.0/16",
    "130.211.0.0/22"
  ]

  allow {
    protocol = "tcp"
    #ports = [
    #  var.gke_service_port,
    #]
  }

  #target_tags = [
  #  "kubernetes"
  #]
}
