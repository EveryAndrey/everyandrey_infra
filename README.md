# everyandrey_infra

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
