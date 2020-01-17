# terraform-module for codebuild-projects from bitbucket
This is a module to simplify creation of codebuild-projects for bitbucket-repositories.

## Usage
The usage is rather simple because you only have to name the repository informations and an optional environment-name:

    provider "aws" {
      version = "2.39.0"
    }

    module "codebuild" {
      source = "github.com/nemoinho/terraform-module-bitbucket-codebuild"

      repository_name = "Fancy repository in Bitbucket"
      repository_slug = "fancy-repository-in-bitbucket"
      repository_url  = "https://some-username@bitbucket/some-organization/fancy-repository-in-bitbucket.git"
    }

## Limitations
- The module currently only support builds without caches.
- The role which is assumed by codebuild has administrative access at the moment.
