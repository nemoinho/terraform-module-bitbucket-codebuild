resource "aws_cloudwatch_log_group" "build_log_group" {
  name = "/aws/codebuild/${var.repository_slug}"
}

resource "aws_codebuild_project" "build" {
  name          = var.repository_slug
  description   = "This project builds ${var.repository_name}${local.name_suffix}"
  build_timeout = var.timeout
  service_role  = aws_iam_role.build_role.arn

  artifacts { type = "NO_ARTIFACTS" }
  cache { type = "NO_CACHE" }

  environment {
    compute_type                = var.compute_type
    type                        = var.compute_environment_type
    image                       = var.runtime_image
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    type            = "BITBUCKET"
    location        = var.repository_url
    git_clone_depth = 1
    buildspec       = var.buildspec
  }
}

resource "aws_codebuild_webhook" "build_webhook" {
  project_name = aws_codebuild_project.build.name
  filter_group {
    dynamic "filter" {
      for_each = var.webhook_filter
      content {
        type    = filter.value.type
        pattern = filter.value.pattern
      }
    }
  }
}
