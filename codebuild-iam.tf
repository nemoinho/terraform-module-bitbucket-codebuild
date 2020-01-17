resource "aws_iam_role" "build_role" {
  #max role-name length is 64 chars => https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length
  name = "${substr(var.repository_slug, 0, 53)}-build-role"

  assume_role_policy = data.aws_iam_policy_document.build_role_assume.json
}

data "aws_iam_policy_document" "build_role_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = "codebuild.amazonaws.com"
    }
  }
}

# Apply administrative rights to this role until we know exactly what we want!
resource "aws_iam_role_policy_attachment" "build_role_policy_attachment" {
  role       = aws_iam_role.build_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
