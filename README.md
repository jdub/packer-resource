# Packer Build Resource

A Concourse CI resource to build new [Amazon Machine Images (AMI) via Packer](https://www.packer.io/docs/builders/amazon.html)

## Source Configuration

- `aws_access_key_id`: *Required.* Your AWS access key ID.

- `aws_secret_access_key`: *Required.* Your AWS secret access key.

- `region`: *Required.* The AWS region to search for AMIs.


## Behaviour

### `out`: Build a new AMI

#### Parameters
- `template`: *Required.* The path to the packer template.
- `var_file`: *Required.* The path to a [external JSON variable file](https://www.packer.io/docs/templates/user-variables.html).

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
      var_file: secrets.json
  ```
