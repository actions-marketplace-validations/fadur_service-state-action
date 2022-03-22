# Service state action

This action checks the state of a recently created service on apprunner.
While the service is being created its not possible to update it, eg. add environment variables, 
associate custom domain, notify slack etc.

This action polls the service and returns `true` when the service is ready.

## Inputs

**Service-Arn** Required to retrieve service state 

## environment variables
Required for aws cli 

**AWS_ACCESS_KEY_ID**
**AWS_SECRET_ACCESS_KEY**
**AWS_DEFAULT_REGION**

## Outputs 

`true`

## Example usage

```
- name: is my service up
  uses: actions/service-state-action
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    AWS_DEFAULT_REGION: ${{ secrets.AWS_DEFAULT_REGION}}
  with:
    Service-Arn: {{ steps.service-arn.outputs.value}} 

```
