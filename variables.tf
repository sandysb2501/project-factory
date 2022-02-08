
############### Variables for IFT_UAT integration ################################


variable "IFT_UAT_environment" {

  type        = list(string)
  description = "IFT_UAT environments for key deployment"
  default     = []

}

variable "IFT_UAT_project_name" {

  type        = string
  description = "IFT_UAT SA project name"
  default     = ""

}

variable "IFT_UAT_nar_id" {

  type        = string
  description = "IFT_UAT NAR ID"
  default     = ""

}

variable "IFT_UAT_instance_id" {

  type        = string
  description = "IFT_UAT instance id"
  default     = ""

}

variable "IFT_UAT_sa_name" {

  type        = string
  description = "IFT_UAT etl service account name"
  default     = ""

}

variable "IFT_UAT_sa_public_key_directory" {

  type        = string
  description = "IFT_UAT directory with SA public keys"
  default     = ""

}

#################################################################################


############### Variables for TESTAPP integration ################################


variable "TESTAPP_environment" {

  type        = list(string)
  description = "TESTAPP environments for key deployment"
  default     = []

}

variable "TESTAPP_project_name" {

  type        = string
  description = "TESTAPP SA project name"
  default     = ""

}

variable "TESTAPP_nar_id" {

  type        = string
  description = "TESTAPP NAR ID"
  default     = ""

}

variable "TESTAPP_instance_id" {

  type        = string
  description = "TESTAPP instance id"
  default     = ""

}

variable "TESTAPP_sa_name" {

  type        = string
  description = "TESTAPP etl service account name"
  default     = ""

}

variable "TESTAPP_sa_public_key_directory" {

  type        = string
  description = "TESTAPP directory with SA public keys"
  default     = ""

}

#################################################################################


############### Variables for test-app integration ################################

variable "test-app_environment" {
  type        = list(string)
  description = "test-app environments for key deployment"
  default     = []
}

variable "test-app_project_name" {
  type        = string
  description = "test-app SA project name"
  default     = ""
}

variable "test-app_nar_id" {
  type        = string
  description = "test-app NAR ID"
  default     = ""
}

variable "test-app_instance_id" {
  type        = string
  description = "test-app instance id"
  default     = ""
}

variable "test-app_sa_name" {
  type        = string
  description = "test-app etl service account name"
  default     = ""
}

variable "test-app_sa_public_key_directory" {
  type        = string
  description = "test-app directory with SA public keys"
  default     = ""
}

#################################################################################

############### Variables for test1-app integration ################################

variable "test1-app_environment" {
  type        = list(string)
  description = "test1-app environments for key deployment"
  default     = []
}

variable "test1-app_project_name" {
  type        = string
  description = "test1-app SA project name"
  default     = ""
}

variable "test1-app_nar_id" {
  type        = string
  description = "test1-app NAR ID"
  default     = ""
}

variable "test1-app_instance_id" {
  type        = string
  description = "test1-app instance id"
  default     = ""
}

variable "test1-app_sa_name" {
  type        = string
  description = "test1-app etl service account name"
  default     = ""
}

variable "test1-app_sa_public_key_directory" {
  type        = string
  description = "test1-app directory with SA public keys"
  default     = ""
}


############### Variables for test2-app integration ################################

variable "test2-app_environment" {
  type        = list(string)
  description = "test2-app environments for key deployment"
  default     = []
}

variable "test2-app_project_name" {
  type        = string
  description = "test2-app SA project name"
  default     = ""
}

variable "test2-app_nar_id" {
  type        = string
  description = "test2-app NAR ID"
  default     = ""
}

variable "test2-app_instance_id" {
  type        = string
  description = "test2-app instance id"
  default     = ""
}

variable "test2-app_sa_name" {
  type        = string
  description = "test2-app etl service account name"
  default     = ""
}

variable "test2-app_sa_public_key_directory" {
  type        = string
  description = "test2-app directory with SA public keys"
  default     = ""
}

