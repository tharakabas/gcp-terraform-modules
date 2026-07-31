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

variable "project_name" {
  description = "The project name of the GKE cluster"
  type        = string
}
variable "environment" {
  description = "The environment name"
  type        = string
}
variable "cluster_location" {
  description = "The location name"
  type        = string
}
variable "project_region_short_name" {
  description = "The short name of the project region"
  type        = string
}
variable "vpc_id" {
  description = "The VPC id of the cluster"
  type        = string
}
variable "master_cluster_ipv4_cidr" {
  description = "The master cluster ipv4 cidr"
  type        = string
}
variable "cluster_subnetwork_primary_cidr" {
  description = "The cluster subnet cidr range"
  type        = string
}
variable "cluster_secondary_pods_cidr_range" {
  description = "The cluster secondry pods cidr range"
  type        = string
}
variable "cluster_secondary_services_cidr_range" {
  description = "The cluster secondry services cidr range"
  type        = string
}
variable "default_max_pods_per_node" {
  description = "The default max pods per node"
  type        = number
}
variable "master_authorized_networks_cidr" {
  description = "The master authorized networks cidr"
  type        = string
}
variable "master_kubernetes_version" {
  description = "The master Kubernetes version"
  type        = string
}
variable "labels" {
  description = "The labels for the cluster"
  type        = map(string)
}
variable "enable_flow_logs" {
  description = "Enable flow logs of the VPC subnetwork"
  type        = bool
  default     = false
}
variable "aggregation_interval" {
  description = "Aggregation interval of the VPC subnetwork logs"
  type        = string
  default     = "INTERVAL_10_MIN"
}
variable "flow_sampling" {
  description = "Flow sampling of the VPC subnetwork logs"
  type        = number
  default     = 0.5
}
variable "metadata" {
  description = "Metadata of the VPC subnetwork logs"
  type        = string
  default     = "INCLUDE_ALL_METADATA"
}
variable "roles" {
  description = "List of roles to assign"
  type        = list(string)
  default     = []
}
variable "managed_prometheus_enabled" {
  description = "Whether to enable managed Prometheus"
  type        = bool
  default     = false
}
variable "enabled_monitoring_components" {
  description = "List of monitoring components to enable"
  type        = list(string)
  default     = []
}
variable "logging_enabled_components" {
  description = "List of logging components to enable"
  type        = list(string)
  default     = []
}
variable "enable_l4_ilb_subsetting" {
  description = "Enable L4 ILB subsetting"
  type        = bool
  default     = false
}
variable "enable_tpu" {
  description = "Enable TPU support"
  type        = bool
  default     = false
}
variable "enable_private_endpoint" {
  description = "Enable private endpoint for the cluster"
  type        = bool
  default     = true
}
variable "default_snat_status_disabled" {
  description = "Default SNAT status for the cluster"
  type        = bool
  default     = false
}
variable "release_channel" {
  description = "Release channel for the GKE cluster"
  type        = string
  default     = "UNSPECIFIED"
}
variable "horizontal_pod_autoscaling" {
  description = "Enable horizontal pod autoscaling"
  type        = bool
  default     = false
}
variable "http_load_balancing" {
  description = "Enable HTTP load balancing"
  type        = bool
  default     = false
}
variable "gcp_filestore_csi_driver_config" {
  description = "Enable GCP Filestore CSI driver"
  type        = bool
  default     = false
}
variable "gke_backup_agent_config" {
  description = "Enable GKE backup agent"
  type        = bool
  default     = true
}
variable "gce_persistent_disk_csi_driver_config" {
  description = "Enable GCE persistent disk CSI driver"
  type        = bool
  default     = true
}
variable "network_policy_config" {
  description = "Enable network policy config"
  type        = bool
  default     = true
}
variable "dns_cache_config" {
  description = "Enable DNS cache config"
  type        = bool
  default     = false
}
variable "vertical_pod_autoscaling" {
  description = "Enable vertical pod autoscaling"
  type        = bool
  default     = true
}
variable "confidential_nodes" {
  description = "Enable confidential nodes"
  type        = bool
  default     = false
}
variable "dns_config" {
  description = "Configuration for using Cloud DNS for GKE. Defaults to the platform in-cluster DNS provider (kube-dns). Set to null to omit the block entirely"
  type = object({
    cluster_dns                   = optional(string, "PLATFORM_DEFAULT")
    cluster_dns_scope             = optional(string)
    cluster_dns_domain            = optional(string)
    additive_vpc_scope_dns_domain = optional(string)
  })
  default = {
    cluster_dns = "PLATFORM_DEFAULT"
  }
}

