resource "google_notebooks_instance" "week2" {
  project  = var.project_id
  name     = local.notebook_name
  location = var.zone
  # access
  service_account = google_service_account.week2_notebook.email
  # networking
  network = module.vpc.network_id
  subnet  = module.vpc.subnets_ids[0]
  # machine configuration
  machine_type       = "n1-standard-8"
  boot_disk_type     = "PD_SSD"
  boot_disk_size_gb  = 100
  install_gpu_driver = true
  container_image {
    repository = var.notebook_image_repository
    tag = var.notebook_image_tag
  }
  accelerator_config {
    core_count = 1
    type       = "NVIDIA_TESLA_T4"
  }
  metadata = { notebook-disable-root = true }

  no_public_ip    = false
  no_proxy_access = false

  depends_on = [
    google_project_organization_policy.requiredShieldedVM,
    google_project_organization_policy.vmExternalIpAccess
  ]
  
}

resource "google_service_account" "week2_notebook" {
  project    = var.project_id
  account_id = local.sa_notebook_name

  depends_on = [
    module.enabled_google_apis
  ]
}

resource "google_service_account_iam_member" "notebook_users" {
  for_each = toset(var.notebook_users)

  service_account_id = google_service_account.week2_notebook.id
  role               = "roles/iam.serviceAccountUser"
  member             = each.value
}
