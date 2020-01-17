resource "aws_cloudwatch_log_group" "build_log_group" {
  name = "/aws/codebuild/${var.repository_slug}"
}

resource "aws_codebuild_project" "build" {
  name          = var.repository_slug
  description   = "This project builds ${var.repository_name}${local.name_suffix}"
  build_timeout = "30"
  service_role  = aws_iam_role.build_role.arn

  artifacts { type = "NO_ARTIFACTS" }
  cache { type = "NO_CACHE" }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    type            = "BITBUCKET"
    location        = var.repository_url
    git_clone_depth = 1
    buildspec       = "buildspec.yml"
  }
}

resource "aws_codebuild_webhook" "build_webhook" {
  project_name = aws_codebuild_project.build.name
  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }
    filter {
      type    = "HEAD_REF"
      pattern = "master"
    }
  }
}
