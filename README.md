codd# everyandrey_infra

testapp_IP = 34.118.12.247
testapp_port = 9292


gcloud compute instances create reddit-app \
--boot-disk-size=10GB \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure \
--metadata-from-file startup-script=startup_script.sh


gcloud compute firewall-rules create default-puma-server \
--allow=tcp:9292 \
--target-tags=puma-server \
--source-ranges="0.0.0.0/0"


## Packer
The main purpose is creating images

Build full image
cd packer && packer build immutable.json

Launch the virtual machine:
gcloud compute instances create reddit-app \
--image-project=infra-311816 \
--image=reddit-full-1620055863 \
--machine-type=g1-small \
--tags puma-server \
--zone=europe-central2-a \
--restart-on-failure

Build app/db image from repo directory
packer build -var-file=packer/variables.json packer/app.json
packer build -var-file=packer/variables.json packer/db.json

Packer is used gcloud tool when is used googlecompute type
gcloud auth application-default login

## Connect by SSH
ssh andrey@ip
~/.ssh/appuser - private key

## Terraform
Responsible for creating and supporting cloud infrastracture

create two stages -
    prod
    stage
    you can disable provisioners by setting enable_provisioner = false in main.tf in each stage

from stage/prod
    apply: terraform-12 apply -auto-approve
    destroy: terraform-12 destroy -auto-approve

## ANSIBLE
Inventory - is used for declaring set of hosts
Created a static inventory(ini), inventory.yml and inventory.json.
Also created inventory.gcp.yml which uses special gcp_compute module to getting data from the gcp cloud.
Despite the documentation, the property "service_account_file" is strictly required!

Dynamic inventory get data from the cloud (or somewhere else) by preparing a xml file (the format like _meta: {..}, group_name1: {}, group_name2: {}, groups: {})
On this groups you can link by group name in host field of ansible playbook.
