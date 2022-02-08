
module "UAT_sa_project" {

  for_each           = var.UAT_environment != "" ? toset(var.UAT_environment) : []
  source             = "dbtfe.db.com/PMR/cpt-project/google"
  version            = "1.1.2"
  project_name       = var.UAT_project_name
  environment        = each.key
  nar_id             = var.UAT_nar_id
  folder_id          = "folders/${var.sa_folder_id}"
  organization_id    = "organizations/${var.org_id}"
  billing_account_id = var.billing_account
  instance_id        = var.UAT_instance_id
  lz_version         = "none"

  contacts = {
    "cpe.technical.contacts@list.db.com" = { language = "en", category = ["ALL"] }
  }

  activate_apis = ["a.googleapis.com"]

}

# Service account Generation

module "UAT_int_service_account" {

  for_each     = var.UAT_environment != "" ? toset(var.UAT_environment) : []
  source       = "dbtfe.db.com/PMR/cpt-sa/google"
  version      = "1.3.3"
  project_id   = module.UAT_sa_project[each.key].project_id
  nar_id       = var.UAT_nar_id
  instance_id  = var.UAT_instance_id
  environment  = each.key
  account_id   = var.UAT_sa_name
  purpose      = "Service account for UAT to manage ${each.key} certificates"
  display_name = "Service account for UAT"
  access_level = "Project"
  used_in      = "Std"

}

locals {

  # construct a map of certificate file to environment

  UAT_int_certfileenvmap = transpose({

    for env in var.UAT_environment : env => [

      for file in fileset(path.module, "${var.UAT_sa_public_key_directory}/*-${env}.crt") : file

    ]
  })
}

# allow multiple keys to be bound to a single service account to facilitate rotation

module "UAT_sa_keys" {

  source                    = "./modules/service_account_key"
  for_each                  = var.UAT_environment != "" ? local.UAT_int_certfileenvmap : {}
  service_account_id        = module.UAT_int_service_account[each.value[0]].service_account_id
  service_account_unique_id = module.UAT_int_service_account[each.value[0]].service_account_unique_id
  public_key                = filebase64(each.key)

}

# output a map of key id to a string that can be used as the basis of a credential file by the

# application that holds the private key

output "UAT_sa_credential_templates" {

  description = "Map of certificate filename to json string representation of a credential file template for that cert"
  value       = var.UAT_environment == "" ? null : { for k, v in module.UAT_sa_keys : k => v.credential_template }

}