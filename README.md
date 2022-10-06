# Terraform playground

Running with Terraform v1.2.9 or to get started [tfenv](https://github.com/tfutils/tfenv) and [terraform registry](https://registry.terraform.io/).

## Environmental variables

RDS env variables are required to run the rds scripts.
```
# https://www.terraform.io/language/values/variables
rds-db-username
rds-db-password
```

Alternatively use .tfvars files or TF_VAR env variables with .env file set before running your scripts