locals {
  name_suffix = "${var.env == "" ? "" : " (${var.env})"}"
  name_prefix = "${var.env == "" ? "" : "${var.env}-"}"
  codebuild_name = "${local.name_prefix}${var.repository_slug}"
}
