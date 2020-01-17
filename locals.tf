locals {
  name_suffix = "${var.env == "" ? "" : " (${var.env})"}"
}
