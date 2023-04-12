init:
	terraform -chdir=terraform init

apply:
	terraform -chdir=terraform apply

plan:
	terraform -chdir=terraform plan

destroy:
	terraform -chdir=terraform destroy

prepare-terraform:
	ansible-playbook ansible/terraform.yml -i ansible/inventory.ini  --vault-password-file local.vault-password

setup:
	ansible-galaxy install -r ansible/requirements.yml
	ansible-playbook --vault-password-file local.vault-password ansible/setup.yml -i ansible/inventory.ini

deploy:
	ansible-playbook --vault-password-file local.vault-password ansible/deploy.yml -i ansible/inventory.ini -vvv

encrypt-vault:
	ansible-vault encrypt ansible/group_vars/*/vault.yml

decrypt-vault:
	ansible-vault decrypt ansible/group_vars/*/vault.yml
	
linter:
	terraform -chdir=terraform fmt
