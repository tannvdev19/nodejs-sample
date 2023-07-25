#!/bin/bash

# Update the variables in the github environment

VARIABLE_ENVIRONMENT_NAME="ECR_REPO_URL"
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

