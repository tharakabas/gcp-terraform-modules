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
  description = "The project ID in which the bastion VM will be created"
  type        = string
}

variable "zone" {
  description = "The zone of the bastion VM"
  type        = string
}

variable "region" {
  description = "The region of the bastion VM"
  type        = string
}

variable "network" {
  description = "The self link of the VPC in which the bastion VM will be created"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC in which the bastion VM will be created"
  type        = string
}

variable "bastion_ip_cidr_range" {
  description = "The IP CIDR range of the bastion subnet"
  type        = string
}

variable "bastion_vm_machine_type" {
  description = "The machine type of the bastion VM"
  type        = string
  default     = "e2-small"
}

variable "boot_disk_image" {
  description = "The boot disk image of the bastion VM"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
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

variable "metadata_flow_logs" {
  description = "Metadata of the VPC subnetwork logs"
  type        = string
  default     = "INCLUDE_ALL_METADATA"
}

variable "enable_secure_boot" {
  description = "Enable secure boot of the bastion VM"
  type        = bool
  default     = true
}

variable "metadata_startup_script" {
  description = "Startup script of the bastion VM"
  type        = string
  default     = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt-get update
    # Install Helm
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
    # Install kubectl
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt update
    sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin kubectl -y
    export USE_GKE_GCLOUD_AUTH_PLUGIN=True
    # Install Kustomize
    sudo snap install kustomize
    # Install Kapp
    wget -O- https://carvel.dev/install.sh > install.sh
    sudo bash install.sh
    # Install yq and jq
    sudo snap install yq
    sudo apt-get install jq
    # Intsall Unzip
    sudo apt install unzip
    EOF
}

variable "bastion_vm_abbreviation" {
  description = "The abbreviation to be used in naming the bastion VM resources"
  type        = string
  default     = "vmbastion"
}

variable "description" {
  description = "The description of the bastion VM"
  type        = string
  default     = null
}

variable "boot_disk_size_gb" {
  description = "The boot disk size in GB of the bastion VM"
  type        = number
  default     = 20
}

variable "boot_disk_type" {
  description = "The boot disk type of the bastion VM"
  type        = string
  default     = "pd-standard"
}

variable "boot_disk_labels" {
  description = "The boot disk labels of the bastion VM"
  type        = map(string)
  default     = {}
}

variable "bastion_vm_network_ip" {
  description = "The network IP of the bastion VM. If not provided, an ephemeral IP will be assigned."
  type        = string
  default     = null
}

variable "enable_vtpm" {
  description = "Enable vTPM of the bastion VM"
  type        = bool
  default     = true
}

variable "enable_integrity_monitoring" {
  description = "Enable integrity monitoring of the bastion VM"
  type        = bool
  default     = true
}

variable "metadata" {
  description = "The metadata of the bastion VM in key-value pairs"
  type        = map(string)
  default     = {}
}

variable "bastion_vm_labels" {
  description = "The labels of the bastion VM"
  type        = map(string)
  default     = {}
}

variable "bastion_vm_tags" {
  description = "The tags of the bastion VM"
  type        = list(string)
  default     = []
}

variable "subnetwork_abbreviation" {
  description = "The abbreviation to be used in naming the bastion subnetwork"
  type        = string
  default     = "snet"
}

variable "subnetwork_name" {
  description = "The name of the bastion subnetwork"
  type        = string
}

variable "firewall_abbreviation" {
  description = "The abbreviation to be used in naming the firewall rules related to the bastion VM"
  type        = string
  default     = "fwr"
}

variable "priority" {
  description = "The priority of the firewall rules related to the bastion VM"
  type        = number
  default     = 100
}

variable "ssh_allow_source_ranges" {
  description = "The source ranges allowed to SSH to the bastion VM"
  type        = list(string)
}

variable "service_account_description" {
  description = "The description of the bastion VM service account"
  type        = string
  default     = null
}

variable "service_account_abbreviation" {
  description = "The abbreviation to be used in naming the bastion VM service account"
  type        = string
  default     = "svcacc"
}

variable "service_account_name" {
  description = "The name to be used in naming the bastion VM service account"
  type        = string
  default     = "bastion"
}

variable "data_disk_abbreviation" {
  description = "The abbreviation to be used in naming the bastion VM data disk"
  type        = string
  default     = "datadisk"
}

variable "data_disk_name" {
  description = "The name to be used in naming the bastion VM data disk"
  type        = string
  default     = "bastion"
}

variable "data_disk_description" {
  description = "The description of the bastion VM data disk"
  type        = string
  default     = null
}

variable "data_disk_type" {
  description = "The disk type of the bastion VM data disk"
  type        = string
  default     = "pd-standard"
}

variable "data_disk_zone" {
  description = "The zone of the bastion VM data disk"
  type        = string
}

variable "data_disk_size_gb" {
  description = "The size in GB of the bastion VM data disk"
  type        = number
  default     = 20
}

variable "data_disk_labels" {
  description = "The labels of the bastion VM data disk"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "The name of the bastion VM instance"
  type        = string
}

variable "firewall_name" {
  description = "The name to be used in naming the firewall rules related to the bastion VM"
  type        = string
  default     = ""
}
