# Packer Build Resource

A Concourse CI resource to build new [Amazon Machine Images (AMI) via Packer](https://www.packer.io/docs/builders/amazon.html)

*Note:* This fork includes ansible for use as a provisioner.

## Source Configuration

- `aws_access_key_id`: Your AWS access key ID.

- `aws_secret_access_key`: Your AWS secret access key.

- `region`: *Required.* The AWS region to search for AMIs.

If `aws_access_key_id` and `aws_secret_access_key` are not provided [packer will use credentials provided by the worker's IAM profile, if it has one](https://www.packer.io/docs/builders/amazon.html#using-an-iam-instance-profile).

## Behaviour

### `out`: Build a new AMI

#### Parameters
- `template`: *Required.* The path to the packer template.
- `var_file`: *Required.* The path or list of paths to a [external JSON variable file](https://www.packer.io/docs/templates/user-variables.html).

All other parameters will be passed through to packer as variables.

## Example

```yaml
resource_types:
- name: packer
  type: docker-image
  source:
    repository: jdub/packer-resource

resources:
- name: build-ami
  type: packer
  source:
    aws_access_key_id: "..."
    aws_secret_access_key: "..."
    region: ap-southeast-2

jobs:
- name: my-ami
  plan:
  - put: build-ami
    params:
      template: packer_template.json
      var_file:
         - secrets.json
         - foo.json
  ```
