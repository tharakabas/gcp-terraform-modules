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
# Application-layer secrets encryption (etcd) for the GKE cluster. The KMS key ring and
# crypto key below are only created when var.enable_database_encryption is true.
#
# Note: Cloud KMS key rings and crypto keys cannot be deleted from GCP. `terraform destroy`
# removes them from state only, so re-creating the cluster in the same project and region
# will fail on an already existing key ring. Pass var.database_encryption_key_ring_name to
# reuse a different name in that case.
#
# Note: the Cloud KMS API (cloudkms.googleapis.com) must be enabled on the project.

# The GKE service agent needs encrypt/decrypt access on the key, and it is addressed by
# project number rather than project id.
data "google_project" "cluster_project" {
  count      = var.enable_database_encryption ? 1 : 0
  project_id = var.project_name
}

resource "google_kms_key_ring" "database_encryption" {
  count    = var.enable_database_encryption ? 1 : 0
  name     = coalesce(var.database_encryption_key_ring_name, join("-", ["keyring", "gke-cluster", var.environment]))
  project  = var.project_name
  location = var.cluster_location
}

resource "google_kms_crypto_key" "database_encryption" {
  count           = var.enable_database_encryption ? 1 : 0
  name            = join("-", ["key", "gke-db-encryption", var.environment])
  key_ring        = google_kms_key_ring.database_encryption[0].id
  purpose         = "ENCRYPT_DECRYPT"
  rotation_period = var.database_encryption_key_rotation_period
  labels          = var.labels
}

resource "google_kms_crypto_key_iam_member" "database_encryption" {
  count         = var.enable_database_encryption ? 1 : 0
  crypto_key_id = google_kms_crypto_key.database_encryption[0].id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.cluster_project[0].number}@container-engine-robot.iam.gserviceaccount.com"
}
