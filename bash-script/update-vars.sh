#!/bin/bash

# Update the variables in the github environment

GH_VARIABLE_ENVIRONMENT_NAME="ECR_REPO_URL"
GH_ECR_REGISTRY_NAME = "ECR_REGISTRY"
GH_ECR_REPOSITORY_NAME = "ECR_REPOSITORY"

ECR_REPO_URL=""
ENVIRONMENT=""

# get parameters
while getopts "e:u:" flag
do
  case "${flag}" in
    u) ECR_REPO_URL=${OPTARG} ;;
    e) ENVIRONMENT=${OPTARG} ;;
  esac
done

echo "ECR_REPO_URL: $ECR_REPO_URL"
echo "ENVIRONMENT: $ENVIRONMENT"

# update the environment variables
gh variable set $VARIABLE_ENVIRONMENT_NAME -b $ECR_REPO_URL -e $ENVIRONMENT


echo "gh variable set $VARIABLE_ENVIRONMENT_NAME -b $ECR_REPO_URL -e $ENVIRONMENT"



string=$ECR_REPO_URL

# Save the current IFS value to restore it later
oldIFS=$IFS
# Set the IFS to "/"
IFS="/"

# Split the string into an array using the IFS
read -ra parts <<< "$string"

# Restore the IFS to its original value
IFS=$oldIFS

# Loop through the array to access each part
for part in "${parts[@]}"; do
    echo "$part"
done

