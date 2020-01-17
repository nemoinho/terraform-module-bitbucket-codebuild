variable "repository_slug" {
  description = "The slug of the repository"
  type        = string
}

variable "repository_name" {
  description = "The name of the repository"
  type        = string
}

variable "repository_url" {
  description = "The url to clone the repository"
  type        = string
}

variable "env" {
  description = "The environment this codebuild-instance is considered for"
  default     = ""
}

variable "buildspec" {
  description = "The name of the buildspec file"
  default     = "buildspec.yml"
}

variable "timeout" {
  description = "The timeout of the build"
  default     = "30"
}

variable "compute_type" {
  description = "The compute-type for the codebuild, see https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html"
  default     = "BUILD_GENERAL1_SMALL"
}

variable "compute_environment_type" {
  description = "The actual runtime-type of the compute_type, see: https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html"
  default     = "LINUX_CONTAINER"
}

variable "runtime_image" {
  description = "The runtime image used to build the code, see: https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html"
  default     = "aws/codebuild/standard:2.0"
}

variable "webhook_filter" {
  description = "The filters which are applied onto the webhooks"
  default     = [{
    type    = "EVENT"
    pattern = "PUSH"
  }]
}
