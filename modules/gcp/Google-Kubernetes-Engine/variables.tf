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

variable "project_id" {
  description = "The ID of the project in which to create the service account"
  type        = string
}

variable "location" {
  description = "The location in which to create the cluster subnetwork"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC in which to create the cluster subnetwork"
  type        = string
}

variable "master_cluster_ipv4_cidr" {
  description = "The master cluster IPv4 CIDR block"
  type        = string
}

variable "cluster_subnetwork_primary_cidr" {
  description = "The cluster subnetwork primary CIDR block"
  type        = string
}

variable "cluster_secondary_pods_cidr_range" {
  description = "The cluster secondary pods CIDR range"
  type        = string
}

variable "cluster_secondary_services_cidr_range" {
  description = "The cluster secondary services CIDR range"
  type        = string
}

variable "default_max_pods_per_node" {
  description = "The default max pods per node"
  type        = number
}

variable "master_authorized_networks_cidr" {
  description = "The master authorized networks CIDR block"
  type        = string
}

variable "master_kubernetes_version" {
  description = "The master Kubernetes version"
  type        = string
}

variable "labels" {
  description = "The labels for the cluster"
  type        = map(string)
  default     = {}
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
  description = "List of roles to assign to the service account"
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
  description = "Whether to disable default SNAT status for the cluster"
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

variable "service_account_abbreviation" {
  description = "Abbreviation to be used in the service account name and display name"
  type        = string
  default     = "svcacc"
}

variable "service_account_description" {
  description = "Description of the service account"
  type        = string
}

variable "service_account_name" {
  description = "Name of the service account"
  type        = string
}

variable "subnetwork_abbreviation" {
  description = "Abbreviation to be used in the subnetwork name"
  type        = string
  default     = "snet"
}

variable "subnetwork_name" {
  description = "Name of the subnetwork"
  type        = string
}

variable "private_ip_google_access" {
  description = "Whether to enable private Google access for the cluster subnetwork"
  type        = bool
  default     = true
}

variable "container_cluster_abbreviation" {
  description = "Abbreviation to be used in the cluster name"
  type        = string
  default     = "gke"
}

variable "enable_kubernetes_alpha" {
  description = "Whether to enable Kubernetes alpha features"
  type        = bool
  default     = false
}

variable "networking_mode" {
  description = "The networking mode for the cluster"
  type        = string
  default     = "VPC_NATIVE"
}

variable "master_global_access_config_enabled" {
  description = "Whether to enable master global access config"
  type        = bool
  default     = false
}

variable "datapath_provider" {
  description = "The datapath provider for the cluster"
  type        = string
  default     = "ADVANCED_DATAPATH"
}

variable "binary_authorization_evaluation_mode" {
  description = "The evaluation mode for binary authorization"
  type        = string
  default     = "DISABLED"
}

variable "auto_provisioning_management_auto_upgrade" {
  description = "Whether to enable auto upgrade for cluster autoscaling auto provisioning management"
  type        = bool
  default     = false
}

variable "auto_provisioning_management_auto_repair" {
  description = "Whether to enable auto repair for cluster autoscaling auto provisioning management"
  type        = bool
  default     = true
}

variable "cluster_autoscaling_enabled" {
  description = "Whether to enable cluster autoscaling"
  type        = bool
  default     = false
}

variable "security_posture_mode" {
  description = "The security posture mode for the cluster"
  type        = string
  default     = "BASIC"
}

variable "security_posture_vulnerability_mode" {
  description = "The security posture vulnerability mode for the cluster"
  type        = string
  default     = "VULNERABILITY_BASIC"
}

variable "database_encryption_state" {
  description = "The database encryption state for the cluster"
  type        = string
  default     = "DECRYPTED"
}

variable "database_encryption_key_name" {
  description = "The database encryption key name for the cluster"
  type        = string
  default     = null
}

variable "secret_manager_config_enabled" {
  description = "Whether to enable Secret Manager config for the cluster"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection for the cluster"
  type        = bool
  default     = true
}

variable "cluster_description" {
  description = "Description of the cluster"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "subnetwork_description" {
  description = "Description of the cluster subnetwork"
  type        = string
  default     = null
}

variable "cluster_pods_secondary_range_name" {
  description = "The name of the secondary range for cluster pods"
  type        = string
  default     = "cluster-pods"
}

variable "cluster_services_secondary_range_name" {
  description = "The name of the secondary range for cluster services"
  type        = string
  default     = "cluster-services"
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

variable "master_authorized_networks_display_name" {
  description = "The display name for the master authorized networks CIDR block"
  type        = string
  default     = "Authorized network to access CP"
}
