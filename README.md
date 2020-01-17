# terraform-module for codebuild-projects from bitbucket
This is a module to simplify creation of codebuild-projects for bitbucket-repositories.

## Usage
The usage is rather simple because you only have to name the repository informations to run it:

    provider "aws" {
      version = "2.39.0"
    }

    module "codebuild" {
      source = "github.com/nemoinho/terraform-module-bitbucket-codebuild"

      repository_name = "Fancy repository in Bitbucket"
      repository_slug = "fancy-repository-in-bitbucket"
      repository_url  = "https://some-username@bitbucket/some-organization/fancy-repository-in-bitbucket.git"
    }

### Configuration
Beside of the basic setup the module can be configured by a bunch of variables:

**env**: The environment this codebuild-instance is considered for

**buildspec**: The name of the buildspec file

**timeout**: The timeout of the build

**compute_type**: The [compute-type](https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html) for the codebuild

**compute_environment_type**: The actual [runtime-type](https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-compute-types.html) of the compute_type

**runtime_image**: The runtime [image](https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html) used to build the code

**webhook_filter**: The filters which are applied onto the webhooks

---

The following example illustrates all variables by resetting their defaults:

    provider "aws" {
      version = "2.39.0"
    }

    module "codebuild" {
      source = "github.com/nemoinho/terraform-module-bitbucket-codebuild"

      repository_name = "Fancy repository in Bitbucket"
      repository_slug = "fancy-repository-in-bitbucket"
      repository_url  = "https://some-username@bitbucket/some-organization/fancy-repository-in-bitbucket.git"

      env = ""

      buildspec = "buildspec.yml"

      timeout = "30"

      compute_type = "BUILD_GENERAL1_SMALL"

      compute_environment_type = "LINUX_CONTAINER"

      runtime_image = "aws/codebuild/standard:2.0"

      webhook_filter = [{
        type    = "EVENT"
        pattern = "PUSH"
      }]
    }

## Limitations
- The role which is assumed by codebuild has administrative access at the moment.
