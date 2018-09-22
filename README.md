# gsuite_route53_terraform_module
A terrform module that establishes the necessary route 53 for all g-suite apps.


# gsuite_route53_terraform_module

This is a terraform module that creates route 53 records based on strict inputs taken from g-suite when establishing a new account and mail services.

## Input variables:

  * `route53_zone_name` - The name of the pre-existing route 53 zone in the provider account
  * `record_ttl` - The TTL for all created records, defaults to `3600`
  * `g_suite_site_verification_key` - The site verification key used to prove ownership of domain
  * `g_suite_mx_verification_key` - The final, heaviest weight MX record specific to the account
  * `g_suite_mail_dkim` - The DKIM key, split into strings of length 100 characters

## Authors

Created and maintained by [Josh Durbin](https://github.com/joshdurbin).

# License

Apache 2 Licensed. See LICENSE for full details.
