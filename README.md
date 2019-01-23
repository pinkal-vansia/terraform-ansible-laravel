 # Terraform
 
 Deploy Laravel application in AWS.

- Deploy in multiple Availability Zones using _Auto-Scaling Group_ for High Availability.
- _Launch template_ with user_data to automatically bootstrap application using **Ansible Playbook**.
- _ELB_ in multiple Availability zones
- All EC2 Instances in Private Subnet.

#### Prerequisites
- Terraform installed.
- EC2 key pair already created
- AWS profile configured locally with required permissions

**Steps to deploy**  

```
$ terraform workspace new dev

$ terraform workspace select dev

$ terraform init

$ terraform plan \
  -var 'key_name=KEY_NAME' \
  -var 'profile=PROFILE_NAME'

$ terraform apply \
  -var 'key_name=KEY_NAME' \
  -var 'profile=PROFILE_NAME'
```