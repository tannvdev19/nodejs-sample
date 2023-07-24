#!/bin/bash

VERSION=""
ENVIRONMENT=${GITHUB_REF##*/}

git config --global user.email "github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"

# get parameters
while getopts v: flag
do
  case "${flag}" in
    v) VERSION=${OPTARG};;
  esac
done

# echo "ENVIROMENT: $ENVIROMENT";
echo "ENVIRONMENT=$ENVIRONMENT";

# get highest tag number, and add v0.1.0 if doesn't exist
git fetch --prune --unshallow 2>/dev/null
CURRENT_VERSION=`git tag --list "$ENVIRONMENT-v*" --sort=-creatordate | head -n 1 2>/dev/null`

if [[ $CURRENT_VERSION == '' ]]
then
  CURRENT_VERSION="$ENVIRONMENT-v0.1.0"
fi
echo "Current Version: $CURRENT_VERSION"

echo "CURRENT_VERSION=$CURRENT_VERSION" >> $GITHUB_OUTPUT

exit 0
// git tag --list "dev-v*" --sort=-creatordate | head -n 1