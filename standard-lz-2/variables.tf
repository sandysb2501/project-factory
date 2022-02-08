
variable "UAT_environment" {
  type        = list(string)
  description = "UAT environments for key deployment"
  default     = []
}

variable "UAT_project_name" {
  type        = string
  description = "UAT SA project name"
  default     = ""
}

variable "UAT_nar_id" {
  type        = string
  description = "UAT NAR ID"
  default     = ""
}

variable "UAT_instance_id" {
  type        = string
  description = "UAT instance id"
  default     = ""
}

variable "UAT_sa_name" {
  type        = string
  description = "UAT etl service account name"
  default     = ""
}

variable "UAT_sa_public_key_directory" {
  type        = string
  description = "UAT directory with SA public keys"
  default     = ""
}

variable "sdkfjskldjf_environment" {
  type        = list(string)
  description = "sdkfjskldjf environments for key deployment"
  default     = []
}

variable "sdkfjskldjf_project_name" {
  type        = string
  description = "sdkfjskldjf SA project name"
  default     = ""
}

variable "sdkfjskldjf_nar_id" {
  type        = string
  description = "sdkfjskldjf NAR ID"
  default     = ""
}

variable "sdkfjskldjf_instance_id" {
  type        = string
  description = "sdkfjskldjf instance id"
  default     = ""
}

variable "sdkfjskldjf_sa_name" {
  type        = string
  description = "sdkfjskldjf etl service account name"
  default     = ""
}

variable "sdkfjskldjf_sa_public_key_directory" {
  type        = string
  description = "sdkfjskldjf directory with SA public keys"
  default     = ""
}
