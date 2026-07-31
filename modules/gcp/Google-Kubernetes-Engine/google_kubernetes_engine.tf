# -------------------------------------------------------------------------------------
#
# Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com). All Rights Reserved.
#
# This software is the property of WSO2 LLC. and its suppliers, if any.
# Dissemination of any information or reproduction of any material contained
# herein in any form is strictly forbidden, unless permitted by WSO2 expressly.
# You may not alter or remove any copyright or other notice from copies of this content.
#
# --------------------------------------------------------------------------------------
# Ignore: AVD-GCP-0051 (https://avd.aquasec.com/misconfig/avd-gcp-0051)
# Reason: The cluster labels(tags) are added via a required variable in the module. When using the module, the labels are added from the implementation.
# Ignore: AVD-GCP-0056 (https://avd.aquasec.com/misconfig/avd-gcp-0056)
# Reason: Network-Policies are enabled from the Helm level. Not when provisioning the cluster.
# Ignore: AVD-GCP-0058 (https://avd.aquasec.com/misconfig/avd-gcp-0058)
# Reason: Automatic updates are disabled for the cluster and updates are done manually with intention.

# trivy:ignore:AVD-GCP-0051
# trivy:ignore:AVD-GCP-0056
resource "google_container_cluster" "cluster" {
  name               = join("-", ["gke", var.project_name, var.project_region_short_name, var.environment])
  project            = var.project_name
  description        = join("", ["GKE cluster for ", var.project_name, " located in ", var.cluster_location, " ENV: ", var.environment])
  min_master_version = var.master_kubernetes_version

  # Regional cluster
  location                  = var.cluster_location
  enable_kubernetes_alpha   = false
  enable_l4_ilb_subsetting  = var.enable_l4_ilb_subsetting
  enable_tpu                = var.enable_tpu
  default_max_pods_per_node = var.default_max_pods_per_node

  # Setting the value to 1 as it will be the minimum number to remove the default node pool
  initial_node_count       = 1
  remove_default_node_pool = true

  node_config {
    service_account = google_service_account.cluster_service_account.email
  }
  # network configuration
  network    = var.vpc_id
  subnetwork = google_compute_subnetwork.cluster_subnetwork.name
  private_cluster_config {
    enable_private_endpoint = var.enable_private_endpoint
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_cluster_ipv4_cidr
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = "cluster-pods"
    services_secondary_range_name = "cluster-services"
  }
  default_snat_status {
    disabled = var.default_snat_status_disabled
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.master_authorized_networks_cidr
      display_name = "Authorized network to access CP"
    }
  }
  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
  workload_identity_config {
    workload_pool = join(".", [var.project_name, "svc.id.goog"])
  }
  release_channel {
    channel = var.release_channel
  }
  cluster_autoscaling {
    enabled = false
  }
  addons_config {
    horizontal_pod_autoscaling {
      disabled = var.horizontal_pod_autoscaling
    }
    http_load_balancing {
      disabled = var.http_load_balancing
    }
    gcp_filestore_csi_driver_config {
      enabled = var.gcp_filestore_csi_driver_config
    }
    gke_backup_agent_config {
      enabled = var.gke_backup_agent_config
    }
    gce_persistent_disk_csi_driver_config {
      enabled = var.gce_persistent_disk_csi_driver_config
    }
    network_policy_config {
      disabled = var.network_policy_config
    }
    dns_cache_config {
      enabled = var.dns_cache_config
    }
  }
  vertical_pod_autoscaling {
    enabled = var.vertical_pod_autoscaling
  }
  confidential_nodes {
    enabled = var.confidential_nodes
  }
  resource_labels = var.labels
  dynamic "dns_config" {
    for_each = var.dns_config != null ? [var.dns_config] : []
    content {
      cluster_dns                   = dns_config.value.cluster_dns
      cluster_dns_scope             = dns_config.value.cluster_dns_scope
      cluster_dns_domain            = dns_config.value.cluster_dns_domain
      additive_vpc_scope_dns_domain = dns_config.value.additive_vpc_scope_dns_domain
    }
  }
  logging_config {
    enable_components = var.logging_enabled_components
  }
  monitoring_config {
    enable_components = var.enabled_monitoring_components
    managed_prometheus {
      enabled = var.managed_prometheus_enabled
    }
  }

  depends_on = [
    google_compute_subnetwork.cluster_subnetwork,
    google_service_account.cluster_service_account
  ]
}
