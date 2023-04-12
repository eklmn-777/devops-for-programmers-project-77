### Hexlet tests and linter status:
[![Actions Status](https://github.com/eklmn-777/devops-for-programmers-project-77/workflows/hexlet-check/badge.svg)](https://github.com/eklmn-777/devops-for-programmers-project-77/actions)

## Application URL
https://www.eklmn-777.ru


## Requirements
- Terraform

- Ansible

- Make

## Usage

```bash
make init # initialize terraform

make prepare-terraform # export required variables to confg file

make plan # build the plan of cloud environment

make apply # initialize the cloud environment

make destroy # destroy the cloud environment

make setup # prepare server

make deploy # deploy

make encrypt-vault # ansible encrypt all vaults

make decrypt-vault # ansible decrypt all vaults

make linter # run terraform configuration linter
```