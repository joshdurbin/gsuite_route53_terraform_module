data "aws_route53_zone" "zone" {
  name = "${var.route53_zone_name}"
}

resource "aws_route53_record" "g_suite_verification" {
  zone_id = "${data.aws_route53_zone.zone.id}"
  name    = ""
  type    = "TXT"
  ttl     = "${var.record_ttl}"

  records = ["${var.g_suite_site_verification_key}"]
}

resource "aws_route53_record" "g_suite_spf" {
  name    = ""
  type    = "SPF"
  zone_id = "${data.aws_route53_zone.zone.id}"
  ttl     = "${var.record_ttl}"

  records = [
    "v=spf1 include:_spf.google.com ~all",
  ]
}

resource "aws_route53_record" "g_suite_dkim" {
  name    = "google._domainkey"
  type    = "TXT"
  zone_id = "${data.aws_route53_zone.zone.id}"
  ttl     = "${var.record_ttl}"

  records = ["${var.g_suite_mail_dkim}"]
}

resource "aws_route53_record" "g_suite_mail_cname" {
  name    = "mail"
  type    = "CNAME"
  zone_id = "${data.aws_route53_zone.zone.id}"
  ttl     = "${var.record_ttl}"

  records = [
    "ghs.googlehosted.com",
  ]
}

resource "aws_route53_record" "g_suite_drive_cname" {
  name    = "drive"
  type    = "CNAME"
  zone_id = "${data.aws_route53_zone.zone.id}"
  ttl     = "${var.record_ttl}"

  records = [
    "ghs.googlehosted.com",
  ]
}

resource "aws_route53_record" "g_suite_calendar_cname" {
  name    = "calendar"
  type    = "CNAME"
  zone_id = "${data.aws_route53_zone.zone.id}"
  ttl     = "${var.record_ttl}"

  records = [
    "ghs.googlehosted.com",
  ]
}

resource "aws_route53_record" "g_suite_sites_cname" {
  name    = "sites"
  type    = "CNAME"
  zone_id = "${data.aws_route53_zone.zone.id}"
  ttl     = "${var.record_ttl}"

  records = [
    "ghs.googlehosted.com",
  ]
}

resource "aws_route53_record" "g_suite_groups_cname" {
  name    = "groups"
  type    = "CNAME"
  zone_id = "${data.aws_route53_zone.zone.id}"
  ttl     = "${var.record_ttl}"

  records = [
    "ghs.googlehosted.com",
  ]
}

resource "aws_route53_record" "g_suite_mx" {
  name    = ""
  type    = "MX"
  zone_id = "${data.aws_route53_zone.zone.id}"
  ttl     = "${var.record_ttl}"

  records = [
    "1 aspmx.l.google.com",
    "5 alt1.aspmx.l.google.com",
    "5 alt2.aspmx.l.google.com",
    "10 alt3.aspmx.l.google.com",
    "10 alt4.aspmx.l.google.com",
    "${var.g_suite_mx_verification_key}",
  ]
}
