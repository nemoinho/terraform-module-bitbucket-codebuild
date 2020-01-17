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
