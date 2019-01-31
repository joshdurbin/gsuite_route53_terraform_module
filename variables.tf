variable "route53_zone_name" {}

variable "record_ttl" {
  default = "3600"
}

variable "g_suite_site_verification_key" {}

variable "g_suite_mail_dkim" {
  description = ""
  type        = "list"
}
