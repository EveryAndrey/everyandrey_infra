#!/bin/bash

gcloud compute instances create reddit-app \
--image-project=infra-311816 \
--image=reddit-full-1620055863 \
--machine-type=g1-small \
--tags puma-server \
--zone=europe-central2-a \
--restart-on-failure
