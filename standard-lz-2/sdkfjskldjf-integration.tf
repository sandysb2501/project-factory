
module "sdkfjskldjf_sa_project" {

  for_each           = var.sdkfjskldjf_environment != "" ? toset(var.sdkfjskldjf_environment) : []
  source             = "dbtfe.db.com/PMR/cpt-project/google"
  version            = "1.1.2"
  project_name       = var.sdkfjskldjf_project_name
  environment        = each.key
  nar_id             = var.sdkfjskldjf_nar_id
  folder_id          = "folders/${var.sa_folder_id}"
  organization_id    = "organizations/${var.org_id}"
  billing_account_id = var.billing_account
  instance_id        = var.sdkfjskldjf_instance_id
  lz_version         = "none"

  contacts = {
    "cpe.technical.contacts@list.db.com" = { language = "en", category = ["ALL"] }
  }

  activate_apis = ["pubsub.googleapis.com", "bigquery.googleapis.com"]

}

# Service account Generation

module "sdkfjskldjf_int_service_account" {

  for_each     = var.sdkfjskldjf_environment != "" ? toset(var.sdkfjskldjf_environment) : []
  source       = "dbtfe.db.com/PMR/cpt-sa/google"
  version      = "1.3.3"
  project_id   = module.sdkfjskldjf_sa_project[each.key].project_id
  nar_id       = var.sdkfjskldjf_nar_id
  instance_id  = var.sdkfjskldjf_instance_id
  environment  = each.key
  account_id   = var.sdkfjskldjf_sa_name
  purpose      = "Service account for sdkfjskldjf to manage ${each.key} certificates"
  display_name = "Service account for sdkfjskldjf"
  access_level = "Project"
  used_in      = "Std"

}

locals {

  # construct a map of certificate file to environment

  sdkfjskldjf_int_certfileenvmap = transpose({

    for env in var.sdkfjskldjf_environment : env => [

      for file in fileset(path.module, "${var.sdkfjskldjf_sa_public_key_directory}/*-${env}.crt") : file

    ]
  })
}

# allow multiple keys to be bound to a single service account to facilitate rotation

module "sdkfjskldjf_sa_keys" {

  source                    = "./modules/service_account_key"
  for_each                  = var.sdkfjskldjf_environment != "" ? local.sdkfjskldjf_int_certfileenvmap : {}
  service_account_id        = module.sdkfjskldjf_int_service_account[each.value[0]].service_account_id
  service_account_unique_id = module.sdkfjskldjf_int_service_account[each.value[0]].service_account_unique_id
  public_key                = filebase64(each.key)

}

# output a map of key id to a string that can be used as the basis of a credential file by the

# application that holds the private key

output "sdkfjskldjf_sa_credential_templates" {

  description = "Map of certificate filename to json string representation of a credential file template for that cert"
  value       = var.sdkfjskldjf_environment == "" ? null : { for k, v in module.sdkfjskldjf_sa_keys : k => v.credential_template }

}