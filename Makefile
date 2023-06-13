output_directory = output/
terraform_directory = ./terraform/applications/cluster/
terraforms_var_file = ./env/nonprod.tfvars

prereq:
	mkdir -p $(output_directory)

init: prereq
	@echo "Initializing!"
	terraform -chdir=$(terraform_directory) init 

plan: prereq
	@echo "Planning!"
	terraform -chdir=$(terraform_directory) plan -out ../../../$(output_directory)/plan.out -var-file $(terraforms_var_file)

apply: prereq
	@echo "Applying!"
	terraform -chdir=$(terraform_directory) apply ../../../$(output_directory)/plan.out

destroy: prereq
	@echo "Destroying!"
	terraform -chdir=$(terraform_directory) destroy

