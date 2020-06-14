# Example Linuxes (Debian, Centos) on DigitalOcean by Terraform

    Ondrej Sika <ondrej@ondrejsika.com>
    https://github.com/ondrejsika/example-terraform-do-linuxes

## Run Server

```
terraform init
terraform plan
terraform apply -auto-approve
```

## Connect

- Debian - `ssh root@droplet.sikademo.com`
- CentOS - `ssh root@droplet.sikademo.com`

## Destroy Infrastructure

```
terraform destroy -auto-approve
```
